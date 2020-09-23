package com.kgc.service;

import com.kgc.pojo.Blog;
import com.kgc.pojo.Users;

import java.util.List;

/**
 * @author shkstart
 * @create 2020-09-23 13:54
 */
public interface UsersService {
    Users userLogin(String name);
    int ins(Users users);
    //查询用户
    List<Users> seluser();
    List<Users> selByid(Integer id);
    //修改密码
    int updpwd(Users users,Integer id);
    //删除用户
    int deluser(Integer id);
}
