package com.ln.util;

import com.ln.dao.Doctor2Dao;
import com.ln.dao.PageDao;
import com.ln.entity.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.List;

@Component
public class PageServiceImpl implements PageService {

    @Override
    public List<Object> query(Object object, Integer start) {

        return null;
    }

    @Override
    public Integer count(Doctor2Dao pageDao, Doctor doctor) {
        Integer count = pageDao.count(doctor);
        System.out.println(" count = " + count);
        return null;
    }
}
