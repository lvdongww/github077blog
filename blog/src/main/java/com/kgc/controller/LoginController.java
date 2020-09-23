package com.kgc.controller;

import com.kgc.pojo.Users;
import com.kgc.service.UsersService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;

/**
 * @author shkstart
 * @create 2020-09-23 13:49
 */
@Controller
public class LoginController {
    @Resource
    UsersService usersService;
    @RequestMapping("/")
    public String toLogin(){
        return "login";
    }
    @RequestMapping("userLogin")
    public String tomain(String username, String password, Model model){
        Users users = usersService.userLogin(username);
        if (users==null){
            return "login";
        }else{
            if (users.getPassword().equals(password)) {
               model.addAttribute("username",username);
            }else{
                return "login";
            }
        }
        return "main";
    }
}
