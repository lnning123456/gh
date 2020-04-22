package com.ln.dao;

import com.ln.entity.Admin;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.context.annotation.Primary;

@Primary
public interface AdminDao {
    @Select("select admin_id adminId,name,password from admin where name = #{name}")
     Admin queryByName(@Param("name") String name);

}
