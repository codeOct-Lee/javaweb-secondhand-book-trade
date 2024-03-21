package com.ssm.service;

import com.ssm.pojo.Comments;

import java.util.List;

public interface CommentsService {


    void addComments(Comments comments);

    List<Comments> getProductComments(int pid);

    void deleteComments(int id);
}
