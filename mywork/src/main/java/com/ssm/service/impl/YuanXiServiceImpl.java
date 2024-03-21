package com.ssm.service.impl;

import com.ssm.dao.YuanXiDao;
import com.ssm.pojo.YuanXi;
import com.ssm.service.YuanXiService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("yuanXiService")
public class YuanXiServiceImpl implements YuanXiService{
    @Resource
    private YuanXiDao yuanXiDao;

    @Override
    public List<YuanXi> getAll(){return yuanXiDao.getAll();}
}
//public class PurseServiceImpl implements PurseService {
//
//
//    @Resource
//    private PuresDao puresDao;
//
//    @Override
//    public Purse getPurseByUserId(String user_id) {
//        return puresDao.getPurseByUserId(user_id);
//    }
//
//    @Override
//    public Purse selectPurseByuid(String user_id) {
//        return puresDao.selectPurseByuid(user_id);
//    }
//
//    @Override
//    public void addPurse(Purse purse) {
//        puresDao.addPurse(purse);
//    }
//
//    @Override
//    public void updatePurse(Purse purse) {
//
//        puresDao.updatePurse(purse);
//
//
//    }
//}
