package com.ln.service;

import com.ln.dao.DepartmentDao;
import com.ln.dao.DoctorDao;
import com.ln.entity.Department;
import com.ln.entity.Doctor;
import com.ln.util.PageUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    DepartmentDao departmentDao;
@Autowired
    DoctorDao doctorDao;
    @Override
    public Map<String, Object> queryByPage(Integer page, Integer rows) {
        System.out.println("department service");
        Map<String, Object> map = new HashMap<>();
        Integer records = departmentDao.getLevelsCount(1);
        Integer total = records % rows == 0 ? records / rows : records / rows + 1;
        Integer start = (page - 1) * rows;
        List<Department> departments = departmentDao.queryByPage(1,start, rows);
        map.put("total", total);
        map.put("records", records);
        map.put("page", page);
        map.put("rows", departments);
        return map;
    }

    @Override
    public List<Department> findAllDepartment() {
        return departmentDao.findAllDepartment();
    }

    @Override
    public List<Department> findDepartment1(String departmentId) {

        return departmentDao.findAllDepartment();
    }

    @Override
    public List<Department> findDepartment2ByDepartment1(String departmentId) {

        return departmentDao.findAllDepartment2ByDepartment1Id(departmentId);
    }

    @Override
    public void addDepartment(Department department) {
        department.setId(UUID.randomUUID().toString());
        departmentDao.addDepartment(department);
    }

    @Override
    public String deleteDepartment(Department department) {

      if (department.getLevels()==1){
        List<Department> department2 = findDepartment2ByDepartment1(department.getId());
          if(department2.size()!=0){
              return  department.getDepartmentName()+"下还有二级科室，不能删除";
          }else {
              departmentDao.deleteDepartment(department.getId());
              return department.getDepartmentName()+"删除成功";
          }
      }else{
          List<Doctor> doctors = doctorDao.findDoctorByDepartment(department.getId());
          if(doctors.size()!=0){
              return  department.getDepartmentName()+"下还有医生，不能删除";
          }else{
              departmentDao.deleteDepartment(department.getId());
              return department.getDepartmentName()+"删除成功";
          }
      }


    }
}
