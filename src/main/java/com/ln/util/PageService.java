package com.ln.util;

import com.ln.dao.Doctor2Dao;
import com.ln.dao.PageDao;
import com.ln.entity.Doctor;

import java.util.List;

public interface PageService {
    List<Object> query(Object object, Integer start);
    Integer count(Doctor2Dao pageDao, Doctor doctor);
}
