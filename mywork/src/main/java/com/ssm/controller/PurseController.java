package com.ssm.controller;


import com.ssm.pojo.Order;
import com.ssm.pojo.Purse;
import com.ssm.service.OrderService;
import com.ssm.service.PurseService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/purse")
public class PurseController {

    @Resource
    private PurseService purseService;

    @Resource
    private OrderService orderService;

    @RequestMapping("/confirmProduct.do")
    @ResponseBody
    public Map<String,String> confirmProduct(@RequestParam(name = "uid")String uid,@RequestParam(name = "oid")String oid,HttpServletResponse response) throws IOException {
        Purse purse=purseService.getPurseByUserId(uid);
        Order order=orderService.selectOrderByOid(oid);
        String flag = "0";
        String msg = "0";
        purse.setBalance(purse.getBalance()+order.getOrder_price());
        order.setOrder_state(2);
        try {
            purseService.updatePurse(purse);
            orderService.updateOrder(order);
            flag="1";
            msg="确认成功";
        }catch (Exception e){
            flag="2";
            msg="确认失败";
        }
        Map<String, String> map =new HashMap<>();
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }

    @RequestMapping("/sellConfirmOrders.do")
    @ResponseBody
    public Map<String,String> sellConfirmOrders(@RequestParam(name = "oid")String oid){
        Order order=orderService.getOrderByOid(oid);
        String flag = "0";
        String msg = "0";
        try{
           order.setOrder_state(1);
           orderService.updateOrder(order);
            flag="1";
            msg="确认成功";
        }catch (Exception e){

            flag="2";
            msg="确认失败";
        }
        Map<String, String> map =new HashMap<>();
        map.put("flag", flag);
        map.put("msg", msg);
        return map;
    }








}
