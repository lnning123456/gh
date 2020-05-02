package com.ln.util;

import com.ln.dao.Doctor2Dao;
import com.ln.dao.PageDao;
import com.ln.entity.Doctor;
import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Component
public class PageUtil extends PageDao{
    public Map<String,Object> page(PageDao pageDao,Integer page,Object object){
        HashMap<String, Object> map = new HashMap<>();
      /*  System.out.println("This is PageUtil"+ pageDao.count(object));
        Integer start = (page - 1) * 10;
        List<Object> query =  pageDao.query(object,start);
        Integer sum=pageDao.count(object);
        Integer total = sum % 10 == 0 ? sum / 10 : sum / 10+ 1;
        map.put("query",query);
        map.put("sum",sum);
        map.put("total",total);
        map.put("page",page);*/
        return map;
    }
    public  Integer count(Doctor2Dao doctor2Dao,Doctor doctor){
        System.out.println("pageDao = " + doctor2Dao.getClass());
        System.out.println("Object = " + doctor.getClass());
        Integer count = doctor2Dao.count(doctor);
        return  count;
    }
}
