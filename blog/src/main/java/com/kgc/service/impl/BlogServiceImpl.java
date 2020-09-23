package com.kgc.service.impl;

import com.kgc.mapper.BlogMapper;
import com.kgc.pojo.Blog;
import com.kgc.service.BlogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author shkstart
 * @create 2020-09-23 15:33
 */
@Service("blogService")
public class BlogServiceImpl implements BlogService {

    @Resource
    BlogMapper blogMapper;

    @Override
    public int ins(Blog blog) {
        if(blogMapper.insert(blog)>0){
            return 1;
        }
        return 0;
    }
}
