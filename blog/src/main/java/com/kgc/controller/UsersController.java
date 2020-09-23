package com.kgc.controller;

import com.kgc.mapper.UsersMapper;
import com.kgc.pojo.Users;
import com.kgc.service.UsersService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-09-23 16:21
 */
@Controller
public class UsersController {

    @Resource
    UsersService usersService;

    @Resource
    UsersMapper usersMapper;

    @RequestMapping("/userins")
    public String userins(Users users, MultipartFile picpathname, HttpSession session) {
        String realPath = session.getServletContext().getRealPath("statics/img");
        String originalFilename = picpathname.getOriginalFilename();
        String extension = FilenameUtils.getExtension(originalFilename);
        String fileName = System.currentTimeMillis() + RandomUtils.nextInt(1000000) + "." + extension;
        File file = new File(realPath, fileName);
        System.out.println(fileName);
        try {
            picpathname.transferTo(file);
        } catch (IOException e) {
        }
        users.setPicpath(realPath + "/" + fileName);
        users.setSupper(1);
        int ins = usersService.ins(users);
        if (ins > 0) {
            System.out.println("添加成功");
            return "user";
        } else {
            System.out.println("添加失败");
            return "user";
        }
    }

    @RequestMapping("/userguanli")
    public String usergunali(Model model, HttpSession session) {
        Integer uid = (Integer) session.getAttribute("uid");
        Integer supper = (Integer) session.getAttribute("supper");
        if (supper == 0) {
            List<Users> users = usersService.selByid(uid);
            model.addAttribute("pageInfo", users);
            return "pwd";
        } else {
            List<Users> seluser = usersService.seluser();
            model.addAttribute("pageInfo", seluser);
            return "user";
        }
    }

    @RequestMapping("/toupdpwd")
    public String toupdpwd(Model model, HttpSession session) {
        Integer uid = (Integer) session.getAttribute("uid");
        Users users = usersMapper.selectByPrimaryKey(uid);
        model.addAttribute("pageInfo", users);
        return "updpwd";
    }

    @RequestMapping("/updpwd")
    public String updpwd(Users users, Model model, HttpSession session) {
        Integer uid = (Integer) session.getAttribute("uid");
        List<Users> users1 = usersService.selByid(uid);
        model.addAttribute("pageInfo", users1);
        int updpwd = usersService.updpwd(users, uid);
        if (updpwd > 0) {
            session.setAttribute("msg", "修改成功!");
        } else {
            session.setAttribute("msg", "修改失败!");
        }
        return "redirect:/toupdpwd";
    }

    @RequestMapping("deluser/{id}")
    public String dwluser(@PathVariable Integer id, HttpSession session) {
        int deluser = usersService.deluser(id);
        if (deluser > 0) {
            session.setAttribute("msg", "删除成功");
        } else {
            session.setAttribute("msg", "删除失败");
        }
        return "redirect:/userguanli";
    }
}
