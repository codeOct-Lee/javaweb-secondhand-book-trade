package com.ssm.service.impl;

import com.ssm.dao.AdminDao;
import com.ssm.pojo.Admin;
import com.ssm.service.AdminService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("adminService")
public class AdminServiceImpl implements AdminService {
    @Resource
    private AdminDao adminDao;

    @Override
    public Admin adminLogin(String telephone, String password) {
        return adminDao.adminLogin(telephone,password);
    }

    @Override
    public Boolean checkTelephone(String telephone) {
        Admin admin=adminDao.checkTelephone(telephone);
        if (admin==null){
            return false;
        }else {
            return true;
        }
    }

    @Override
    public Boolean checkAdmin(String telephone, String password) {
        Admin admin=adminDao.adminLogin(telephone,password);
        if (admin==null){
            return false;
        }else {

            return true;
        }
    }

    @Override
    public Boolean updatePassword(String password, int id) {
        try {
            adminDao.updatePassword(password,id);
        } catch (Exception e) {
            return false;
        }
        return true;
    }
}
