package com.ln.dao;

import com.ln.entity.Doctor;

import java.util.List;

public abstract class   PageDao {
    List<Object> query(Object object, Integer start){
        return null;
    }
    Integer count(Object object){
        return null;
    }

}
