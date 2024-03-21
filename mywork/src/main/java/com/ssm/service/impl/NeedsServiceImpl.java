package com.ssm.service.impl;

import com.ssm.dao.NeedsDao;
import com.ssm.pojo.Needs;
import com.ssm.service.NeedsService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("needsService")
public class NeedsServiceImpl implements NeedsService {

    @Resource
    private NeedsDao needsDao;


    @Override
    public void addNeed(Needs needs) {
        needsDao.addNeed(needs);
    }

    @Override
    public List<Needs> getNeedProduct() {
        return needsDao.getNeedProduct();
    }

    @Override
    public List<Needs> getAllNeeds() {
        return needsDao.getAllNeeds();
    }

    @Override
    public void deleteNeed(int nid) {
        needsDao.deleteNeed(nid);
    }

    @Override
    public void deleteNeeds(int nid) {
        needsDao.deleteNeeds(nid);
    }
}
