package com.MusicApp.Controllers;

import com.MusicApp.Entity.CustomUser;
import com.MusicApp.ServiceImplAndService.ArtistService;
import com.MusicApp.ServiceImplAndService.UserService;
import com.MusicApp.Entity.UserRole;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class MyController {

    @Autowired
    private UserService userService;

    @Autowired
    private ArtistService artistService;

    @RequestMapping("/")
    public String index(Model model){
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = userService.getUserByLogin(login);

        model.addAttribute("login", login);
        model.addAttribute("roles", user.getAuthorities());
        model.addAttribute("email", dbUser.getEmail());
        model.addAttribute("role", dbUser.getRole().toString());

        return "index";
    }

    @RequestMapping(value = "/update", method = RequestMethod.POST)
    public String update(@RequestParam(required = false) String email) {
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        String login = user.getUsername();

        CustomUser dbUser = userService.getUserByLogin(login);
        dbUser.setEmail(email);

        userService.updateUser(dbUser);

        return "redirect:/";
    }

    @RequestMapping(value = "/newuser", method = RequestMethod.POST)
    public String update(@RequestParam String login,
                         @RequestParam String password,
                         @RequestParam(required = false) String email,
                         Model model) {
        CustomUser dbUser = new CustomUser();
        dbUser.setLogin(login);

        ShaPasswordEncoder encoder = new ShaPasswordEncoder();
        String passHash = encoder.encodePassword(password, null);
        dbUser.setPassword(passHash);

        if (userService.getAllUsers() == null || userService.getAllUsers().size() == 0) {
            dbUser.setRole(UserRole.ADMIN);
            model.addAttribute("admin", "Congrats! You are admin!");
        } else {
            dbUser.setRole(UserRole.USER);
        }

        if (email == null || email.equals("")) {
        } else {
            dbUser.setEmail(email);
        }

        if (userService.existsByLogin(login)) {
            model.addAttribute("exists", true);
            return "register";
        }

        userService.addUser(dbUser);

        return "redirect:/";
    }

    @RequestMapping("/register")
    public String register() {
        return "register";
    }

    @RequestMapping("/admin")
    public String admin(Model model){
        model.addAttribute("userlist", userService.getAllUsers());
        model.addAttribute("artistlist", artistService.getAllArtists());
        return "admin";
    }

    @RequestMapping("/unauthorized")
    public String unauthorized(Model model){
        User user = (User)SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        model.addAttribute("login", user.getUsername());
        return "unauthorized";
    }

    @RequestMapping("/sessionExpired")
    public String expired() {
        return "sessionExpired";
    }
}
