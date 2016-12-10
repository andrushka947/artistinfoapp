package com.MusicApp.Controllers;


import com.MusicApp.EmailSender;
import com.MusicApp.Entity.*;
import com.MusicApp.Entity.Album;
import com.MusicApp.Entity.JsonClasses.For_TopAlbums.*;
import com.MusicApp.Entity.JsonClasses.For_TopTracks.*;
import com.MusicApp.Entity.JsonClasses.For_ArtistGeneral.JsonArtist;
import com.MusicApp.Entity.JsonClasses.For_TrackInfo.JsonTrackInfo;
import com.MusicApp.Entity.JsonClasses.LyricsClasses.TrackId.JsonTrackId;
import com.MusicApp.Entity.JsonClasses.LyricsClasses.TrackLyrics.JsonLyrics;
import com.MusicApp.Entity.Track;
import com.MusicApp.ServiceImplAndService.ArtistService;
import com.MusicApp.ServiceImplAndService.UserService;
import com.google.gson.Gson;
import com.google.gson.GsonBuilder;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.imageio.ImageIO;
import java.awt.image.BufferedImage;
import java.io.*;
import java.net.ConnectException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/artists")
public class ArtistController {

    private static final String API_KEY1 = "36495b0483f94c4c810338356e797bfa";
    private static final String API_KEY2 = "d38b30f2aa8023c419a976ee403a8c00";
    private static EmailSender sslSender = new EmailSender ("likeintel9@gmail.com", "Prototype1and2");

    @Autowired
    private UserService userService;

    @Autowired
    private ArtistService artistService;

    @RequestMapping("/")
    public String onIndex(){
        return "artistView";
    }

    @RequestMapping("/addArtist")
    public String onAddArtist() {
        return"addArtist";
    }

    @RequestMapping("/add")
    public String onAdd(@RequestParam("name") String name, Model model) throws IOException {
        MusicArtist musicArtist = null;
        try {
            musicArtist = getArtistInfo(name);
        } catch (ConnectException e) {
            System.out.println(e.getMessage());
            model.addAttribute("connError", "error");
            return "/addArtist";
        }

        if (musicArtist == null) {
            model.addAttribute("error", "errorRequest");
            return "/addArtist";
        }

        //cz i need right artist's name in here(cz of lower case)
        if (artistService.getArtistByName(musicArtist.getName()) != null) {
            model.addAttribute("repeat", "repeat");
            model.addAttribute("artist", artistService.getArtistByName(musicArtist.getName()));
            return "/addArtist";
        }

        List<Album> topAlbums = getAlbumsByArtist(name, musicArtist);
        List<Track> topTracks = getTracksByArtist(name, musicArtist);
        musicArtist.setTopAlbums(topAlbums);                                            //setting albums
        musicArtist.setTopTracks(topTracks);                                            //setting tracks to music artist
        artistService.addArtist(musicArtist);                                           //saving to DB
        return "redirect:/artists/view";
    }

    @RequestMapping("/view")
    public String onView(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        CustomUser customUser = userService.getUserByLogin(user.getUsername());

        List<MusicArtist> list = artistService.getArtistsByUser(customUser);
        if (list.size() == 0) {
            model.addAttribute("size", "empty");
            return "artistView";
        } else {
            model.addAttribute("email", customUser.getEmail());
            model.addAttribute("artists", list);
        }
        return "artistView";
    }

    @RequestMapping("/sendemail")
    public String sendEmail(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        CustomUser customUser = userService.getUserByLogin(user.getUsername());

        StringBuilder response = new StringBuilder();
        List<MusicArtist> list = artistService.getArtistsByUser(customUser);
        for (MusicArtist artist : list) {
            response.append(artist.getName());
            response.append(" - ");
            response.append(artist.getUrl());
            response.append("\n");
        }
        response.append("This email was sent by my music project");
        try {
            sslSender.send("Artist links", response.toString(), "support@musapp.com", customUser.getEmail());
            model.addAttribute("success", "success");
        } catch (Exception e) {
            model.addAttribute("error", "error");
            e.printStackTrace();
        }
        return "sentemail";
    }

    @RequestMapping("/delete")
    public String onDelete(Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        CustomUser customUser = userService.getUserByLogin(user.getUsername());

        List<MusicArtist> artists = artistService.getArtistsByUser(customUser);
        model.addAttribute("artists", artists);
        return "deleteArtist";
    }

    @RequestMapping("/doDelete")
    public String doDelete(@RequestParam(name = "ids", required = false) String ids, Model model) {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        CustomUser customUser = userService.getUserByLogin(user.getUsername());

        if (ids == null || ids.length() == 0) {
            return "redirect:view";
        }
        String[] arr = ids.split(",");
        if (arr.length != 0) {
            for (String s : arr) {
                artistService.delete(Long.parseLong(s));
            }
        }
        List<MusicArtist> list = artistService.getArtistsByUser(customUser);
        if (list == null) {
            model.addAttribute("artists", null);
        } else {
            model.addAttribute("artists", list);
        }
        return "redirect:view";
        //return "artistView";
    }

    @RequestMapping("/photo/{id}")
    public ResponseEntity<byte[]> getPhoto(@PathVariable long id) throws IOException {
        return getPhotoByName(id);
    }

    public ResponseEntity<byte[]> getPhotoByName(long id) throws IOException {
        MusicArtist artist = artistService.getArtistById(id);
        File file = new File("src/main/ArtistImages/" + artist.getPhoto().getPath());
        FileInputStream fis = new FileInputStream(file);

        byte[] bytes = new byte[fis.available()];
        fis.read(bytes);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_PNG);

        return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.OK);
    }

    private MusicArtist getArtistInfo (String artistName) throws IOException {
        String rightName = artistName.replace(' ', '+');
        String urlRequest = "http://ws.audioscrobbler.com/2.0/?method=artist.getinfo&artist=" + rightName + "&api_key=" + API_KEY1 + "&format=json&limit=5";
        String result = performRequest(urlRequest);

        JsonObject jo = new JsonParser().parse(result).getAsJsonObject();         //check if we got right response
        if (jo.has("error")) {
         return null;
        }

        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        CustomUser customUser = userService.getUserByLogin(user.getUsername());

        Gson gson = new GsonBuilder().create();
        JsonArtist json = gson.fromJson(result, JsonArtist.class);

        MusicArtist musicArtist = new MusicArtist();
        musicArtist.setName(json.getArtist().getName());
        ArtistPhoto ap = new ArtistPhoto(musicArtist, downloadAndSaveImage(json.getArtist().getImage()[3].getUrl(), musicArtist.getName()));
        musicArtist.setPhoto(ap);
        musicArtist.setSummary(fixSummary(json.getArtist().getBio().getSummary()));
        musicArtist.setUser(customUser);
        musicArtist.setUrl(json.getArtist().getUrl());

       return musicArtist;
    }

    private List<Track> getTracksByArtist(String artistName, MusicArtist artist) throws IOException {       //transferring json response to our track type and
        String rightName = artistName.replace(' ', '+');                                                    //and setting it to the musicArtist

        String request = "http://ws.audioscrobbler.com/2.0/?method=artist.gettoptracks&artist=" + rightName + "&api_key=" + API_KEY1 + "&format=json&limit=5";
        byte[] buff = request.getBytes();
        String rightRequest = new String(buff, "UTF-8");
        String result = performRequest(rightRequest);

        Gson gson = new GsonBuilder().create();
        JsonTracks json = gson.fromJson(result, JsonTracks.class);

        List<Track> list = new ArrayList<>();                                               //transferring JsonTracks to
        for (int i = 0; i < json.getToptracks().getTrack().length; i++) {                  //regular tracks
            com.MusicApp.Entity.JsonClasses.For_TopTracks.Track t = json.getToptracks().getTrack()[i];
            if (!t.getName().equals("(null)")) {                                            //checking if track.name not equals
                Track track = new Track();                                              //"(null)", cz in last.fm db it can happen
                track.setName(t.getName());
                track.setMusicArtist(artist);
                track.setLyrics(getLyrics(t.getName(), artist.getName()));              //getting lyrics for each track
                if (getAlbumByTrack(rightName,t.getName())[0] != null) {
                    track.setAlbum_title(getAlbumByTrack(rightName,t.getName())[0]);
                    track.setAlbum_url(getAlbumByTrack(rightName, t.getName())[1]);
                } else {
                    track.setAlbum_title("Sorry, but we haven't found album for this song");
                    track.setAlbum_url(null);
                }

                list.add(track);
            }
        }
        return list;
    }

    private List<Album> getAlbumsByArtist(String artistName, MusicArtist artist) throws IOException {       //transferring json response to our album type and
        String rightName = artistName.replace(' ', '+');                                                    //and setting it to the musicArtist

        String urlRequest = "http://ws.audioscrobbler.com/2.0/?method=artist.gettopalbums&artist=" + rightName + "&api_key=" + API_KEY1 + "&format=json&limit=5";
        String result = performRequest(urlRequest);

        Gson gson = new GsonBuilder().create();
        JsonAlbums json = gson.fromJson(result, JsonAlbums.class);

        List<Album> list = new ArrayList<>();                                               //transferring JsonAlbums to
        for (int i = 0; i < json.getTopAlbums().getAlbum().length; i++) {                  //regular albums
            com.MusicApp.Entity.JsonClasses.For_TopAlbums.Album a = json.getTopAlbums().getAlbum()[i];
            if (!a.getName().equals("(null)")) {                                        //checking if album.name not equals
                Album album = new Album();                                              //"(null)", cz in last.fm db it can happen
                album.setName(a.getName());
                album.setMusicArtist(artist);
                list.add(album);
            }
        }
        return list;
    }

    private String[] getAlbumByTrack(String artistName, String name) throws IOException {
        String rightName = name.replace(' ', '+');
        rightName = fixTrackName(rightName);            //check track name for special symbols like "#"

        String request = "http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=" + API_KEY1 + "&artist=" + artistName + "&track=" + rightName + "&format=json";
        String result = performRequest(request);
        Gson gson = new GsonBuilder().create();
        JsonTrackInfo json = gson.fromJson(result, JsonTrackInfo.class);
        String[] arr = new String[2];
        arr[0] = null;
        arr[1] = null;
        try {
            arr[0] = json.getTrack().getAlbum().getTitle();
            arr[1] = json.getTrack().getAlbum().getUrl();
            return arr;
        } catch (NullPointerException e) {
            arr[0] = null;
            arr[1] = null;
        }
        return arr;
    }

    private String getLyrics(String trackName, String artistName) throws IOException {
        String rightTrackName = trackName.replace(' ', '+');
        rightTrackName = fixTrackName(rightTrackName);
        String rightArtistName = artistName.replace(' ', '+');

        String request1 = "http://api.musixmatch.com/ws/1.1/track.search?q_track=" + rightTrackName + "&q_artist=" + rightArtistName + "&f_has_lyrics=1&format=json&apikey=" + API_KEY2;
        String resultId = performRequest(request1);

        Gson gson1 = new GsonBuilder().create();
        try {
            JsonTrackId jsonTrackId = gson1.fromJson(resultId, JsonTrackId.class);

            if (jsonTrackId.getMessage().getBody().getTrack_list().length != 0) {
                int id = jsonTrackId.getMessage().getBody().getTrack_list()[0].getTrack().getId();
                String request2 = "http://api.musixmatch.com/ws/1.1/track.lyrics.get?track_id=" + id + "&format=json&apikey=" + API_KEY2;
                String result2 = performRequest(request2);

                Gson gson2 = new GsonBuilder().create();
                JsonLyrics jsonLyrics = gson2.fromJson(result2, JsonLyrics.class);

                if (jsonLyrics.getMessage().getBody().getLyrics().getBody().length() != 0) {
                    return fixLyrics(jsonLyrics.getMessage().getBody().getLyrics().getBody());
                }
            }
        } catch (IllegalStateException e) {
            return "Sorry, but it looks like we don't have lyrics for this song.";
        } catch (IOException e) {
            return "Sorry, but it looks like we don't have lyrics for this song.";
        }
        return "Sorry, but it looks like we don't have lyrics for this song.";
    }

    private String downloadAndSaveImage(String url, String artistName) throws FileNotFoundException {
        File file = new File("src/main/ArtistImages/" + artistName + ".png");
        try {
            BufferedImage img = ImageIO.read(new URL(url));
            if (!file.exists()) {
                file.createNewFile();
            }
            ImageIO.write(img, "png", file);
        } catch (IOException e) {
            e.printStackTrace();
        }
        return file.getName();
    }

    private static String performRequest(String urlStr) throws IOException {
        URL url = new URL(urlStr);
        StringBuilder sb = new StringBuilder();

        HttpURLConnection http = (HttpURLConnection) url.openConnection();
        try {
            BufferedReader br = new BufferedReader(new InputStreamReader(http.getInputStream()));
            char[] buf = new char[1000000];

            int r = 0;
            do {
                if ((r = br.read(buf)) > 0)
                    sb.append(new String(buf, 0, r));
            } while (r > 0);
        } finally {
            http.disconnect();
        }

        return sb.toString();
    }

    private String fixSummary(String str) {
        int num = str.indexOf("<a");
        if (num >= 1) {
            return str.substring(0, num);
        }
        return str;
    }       //these two methods located here, cz i need to fix
                                                      //it 1 time and save in right form to db
    private String fixLyrics(String str) {
        int num = str.indexOf("******* ");
        if (num >= 1) {
            return str.substring(0, num);
        }
        return str;
    }

    private String fixTrackName(String str) {
        String[] arr = new String[]{"#","&","`","@","™"};
        String result = str;
        for (String pattern : arr){
            if (str.substring(0,1).equals(pattern)){
                result = str.replace(pattern, "");
            }
        }
        return result;
    }
}








