package com.MusicApp.Controllers;


import com.MusicApp.Entity.CustomUser;
import com.MusicApp.Entity.FunnyImage;
import com.MusicApp.ServiceImplAndService.FunnyImageService;
import com.MusicApp.ServiceImplAndService.UserService;
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
import org.springframework.web.multipart.MultipartFile;

import java.io.*;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/funnyImages")
public class ImageController {

    @Autowired
    private FunnyImageService funnyImageService;

    @Autowired
    private UserService userService;

    @RequestMapping("/")
    public String onFunnyImage(){
        return "funnyImages";
    }

    @RequestMapping("/view")
    public String getPhotos(Model model) throws SQLException, IOException {
        User user = (User) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        CustomUser customUser = userService.getUserByLogin(user.getUsername());

        if (funnyImageService.getAllImages().size() == 0) {
            if (new File("src/main/AFunnyImages").listFiles() == null) {               //adding 1st image, if there is
                File firstImage = new File("D:\\sl.jpg");                              //no one in the database
                long name = System.currentTimeMillis();
                File localFile = new File("src/main/AFunnyImages", name + ".jpg");
                boolean isFileCreated = localFile.createNewFile();
                if (isFileCreated) {
                    FileInputStream fis = new FileInputStream(firstImage);
                    byte[] arr = new byte[fis.available()];
                    fis.read(arr);
                    FileOutputStream fos = new FileOutputStream(localFile);
                    fos.write(arr);
                    funnyImageService.addImage(new FunnyImage(name));
                }
            } else {
                File[] imageList = new File("src/main/AFunnyImages").listFiles();
                Map<Long, byte[]> images = new HashMap<>();

                for (int i = 0; i < imageList.length; i++) {                                    //put each image's id and body(by path) in byte
                    File f = new File("src/main/AFunnyImages/" + imageList[i].getName());       //into new map<id, byte[]> and send it to the jsp
                    FileInputStream fis = new FileInputStream(f);

                    byte[] bytes = new byte[fis.available()];
                    fis.read(bytes);
                    images.put(Long.parseLong(imageList[i].getName().substring(0, 13)), bytes);

                    fis.close();
                    funnyImageService.addImage(new FunnyImage(Long.parseLong(f.getName().substring(0, 13))));
                }
                model.addAttribute("success", "success");
                model.addAttribute("images", images);
            }
        } else {
            List<FunnyImage> list = funnyImageService.getAllImages();
            Map<Long, byte[]> images = new HashMap<>();

            for (FunnyImage image : list) {
                File f = new File("src/main/AFunnyImages/" + image.getPath() + ".jpg");      //into new map<id, byte[]> and send it to the jsp
                FileInputStream fis = new FileInputStream(f);

                byte[] bytes = new byte[fis.available()];
                fis.read(bytes);
                images.put(Long.parseLong(String.valueOf(image.getPath())), bytes);

                fis.close();
            }
            model.addAttribute("success", "success");
            model.addAttribute("images", images);
            if (customUser.getLogin().equalsIgnoreCase("admin")) {
                model.addAttribute("useraccess", "granted");
            } else {
                model.addAttribute("useraccess", "denied");
            }
        }
        return "funnyImages";
    }

    @RequestMapping("/add")
    public String onAddImage(Model model, @RequestParam MultipartFile photo) {
        if (photo.isEmpty()) {                                  //adding new photo
            model.addAttribute("emp","empty");
            return "redirect:/funnyImages/view";
        }
        long name = System.currentTimeMillis();
        try {
            File file = new File("src/main/AFunnyImages", name + ".jpg");
            boolean isFileCreated = file.createNewFile();
            if (isFileCreated) {
                FileOutputStream fos = new FileOutputStream(file);
                fos.write(photo.getBytes());
                funnyImageService.addImage(new FunnyImage(name));
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
        model.addAttribute("success", "successful");
        return "redirect:/funnyImages/view";
    }

    @RequestMapping("/{id}")
    private ResponseEntity<byte[]> onGetImageRequest(@PathVariable long id) throws IOException {
        return getImage(id);
    }

    private ResponseEntity<byte[]> getImage(@PathVariable long id) throws IOException {
        File file = new File("src/main/AFunnyImages/" + Long.toString(id) + ".jpg");
        FileInputStream fis = new FileInputStream(file);
        byte[] bytes = new byte[fis.available()];
        fis.read(bytes);

        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.IMAGE_JPEG);

        return new ResponseEntity<byte[]>(bytes, headers, HttpStatus.OK);
    }

    @RequestMapping("/delete")
    private String delete(@RequestParam("ids")String ids) {
        String[] toDelete = ids.split(",");
        if (toDelete.length != 0) {
            for (String id : toDelete) {
                deletePhoto(id);
            }
        }
        return "redirect:/view";
    }

    private void deletePhoto(String id) {
        funnyImageService.deletePhotoByPath(id);
        File file = new File("src/main/AFunnyImages/" + Long.parseLong(id) + ".jpg");
        file.delete();

    }
}
