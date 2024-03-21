package com.ssm.service;

import com.ssm.pojo.Admin;

public interface AdminService {

    Admin adminLogin(String telephone,String password);

    Boolean checkTelephone(String telephone);

    Boolean checkAdmin(String telephone, String password);


    Boolean updatePassword(String password, int id);
}
