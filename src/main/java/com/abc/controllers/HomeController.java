package com.abc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.abc.entities.Post;
import com.abc.entities.User;
import com.abc.services.FollowService;
import com.abc.services.PostService;

import jakarta.servlet.http.HttpSession;

@Controller
public class HomeController {

    private PostService postService;
    private FollowService followService;

    @Autowired
    public HomeController(PostService postService, FollowService followService) {
        this.postService = postService;
        this.followService = followService;
    }

    @RequestMapping(value = "/")
    public String homeController(Model model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute("user");
        if (user == null) {
            return "redirect:/login";
        }

        try {
            Long userId = user.getId();
            List<User> suggestFollow = followService.getSuggestFollow(userId);
            List<User> usersf = followService.getUserFollower(userId);
            List<User> userfed = followService.getUserFollowed(userId);
            List<Post> posts = postService.getAllPost(userId);

            model.addAttribute("suggestfollow", suggestFollow);
            model.addAttribute("usersf", usersf);
            model.addAttribute("userfed", userfed);
            model.addAttribute("posts", posts);
        } catch (Exception e) {
            model.addAttribute("error", "Không thể tải dữ liệu trang chủ");
        }

        return "home";
    }
}