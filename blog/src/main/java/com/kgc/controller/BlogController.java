package com.kgc.controller;

import com.kgc.pojo.Blog;
import com.kgc.service.BlogService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.annotation.Resource;
import java.util.Date;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-09-23 15:34
 */
@Controller
public class BlogController {
    @Resource
    BlogService blogService;

    @RequestMapping("/ins")
    public String ins(Blog blog, Integer uid) {
        blog.setPublishtime(new Date());
        blog.setUserid(uid);
        int ins = blogService.ins(blog);
        if (ins > 0) {
            System.out.println("添加成功");
        } else {
            System.out.println("添加失败");
        }
        return "main";
    }
}
