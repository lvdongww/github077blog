package com.kgc.controller;

import com.kgc.pojo.Users;
import com.kgc.service.UsersService;
import org.apache.commons.io.FilenameUtils;
import org.apache.commons.lang.math.RandomUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;

/**
 * @author shkstart
 * @create 2020-09-23 16:21
 */
@Controller
public class UsersController {

    @Resource
    UsersService usersService;

    @RequestMapping("/userins")
    public String userins(Users users,MultipartFile picpathname, HttpSession session){
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

}
