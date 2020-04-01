package com.ln.dao;

import com.ln.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.context.annotation.Primary;

@Primary
public interface AdminDao {
    @Select("select * from admin where name = #{name}")
    public Admin findByName(@Param("name") String name);

}
