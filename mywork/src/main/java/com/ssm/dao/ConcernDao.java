package com.ssm.dao;

import com.ssm.pojo.Concern;
import com.ssm.pojo.Product;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ConcernDao {

   void addMyconert(@Param("pid") int id, @Param("user_id") String uid);

    Concern MyConert(@Param("pid")int id, @Param("user_id") String uid);

    List<Product> getMyConcern(String uid);

    void deleteMyConcern(Integer mid);
}
