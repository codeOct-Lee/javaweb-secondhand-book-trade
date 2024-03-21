package com.ssm.service.impl;

import com.ssm.dao.ConcernDao;
import com.ssm.pojo.Concern;
import com.ssm.pojo.Product;
import com.ssm.service.ConcernService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("concernService")
public class ConcernServiceImpl implements ConcernService {

    @Resource
    private ConcernDao concernDao;

    @Override
    public void deleteMyConcern(Integer mid) {
        concernDao.deleteMyConcern(mid);
    }

    @Override
    public Concern getMyproduct(int id, String uid) {
        return concernDao.MyConert(id,uid);
    }

    @Override
    public List<Product> getMyConcern(String uid) {
        return concernDao.getMyConcern(uid);
    }

    @Override
    public void addMyconert(int id, String uid) {
        concernDao.addMyconert(id,uid);
    }
}
