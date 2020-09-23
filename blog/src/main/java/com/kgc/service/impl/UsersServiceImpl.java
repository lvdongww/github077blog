package com.kgc.service.impl;

import com.kgc.mapper.UsersMapper;
import com.kgc.pojo.Users;
import com.kgc.pojo.UsersExample;
import com.kgc.service.UsersService;
import org.omg.CORBA.UserException;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author shkstart
 * @create 2020-09-23 13:55
 */

@Service("usersService")
public class UsersServiceImpl implements UsersService {
    @Resource
    UsersMapper usersMapper;

    @Override
    public Users userLogin(String name) {
        UsersExample usersExample = new UsersExample();
        UsersExample.Criteria criteria = usersExample.createCriteria();
        criteria.andUsernameEqualTo(name);
        List<Users> users = usersMapper.selectByExample(usersExample);
        if (users.size() != 0) {
            return users.get(0);
        }
        return null;
    }

    @Override
    public int ins(Users users) {
        if (usersMapper.insert(users) > 0) {
            return 1;
        }
        return 0;
    }

    @Override
    public List<Users> seluser() {
        return usersMapper.selectByExample(null);
    }

    @Override
    public List<Users> selByid(Integer id) {
        UsersExample example = new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(id);
        return usersMapper.selectByExample(example);
    }

    @Override
    public int updpwd(Users users, Integer id) {
        UsersExample example = new UsersExample();
        UsersExample.Criteria criteria = example.createCriteria();
        criteria.andIdEqualTo(id);
        return usersMapper.updateByExampleSelective(users, example);
    }

    @Override
    public int deluser(Integer id) {
        return usersMapper.deleteByPrimaryKey(id);
    }
}
