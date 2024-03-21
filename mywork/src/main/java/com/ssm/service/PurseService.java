package com.ssm.service;

import com.ssm.pojo.Purse;

public interface PurseService {
    Purse getPurseByUserId(String user_id);

    void updatePurse(Purse purse);

    Purse selectPurseByuid(String user_id);

    void addPurse(Purse purse);
}
