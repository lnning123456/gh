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
   /* @Override
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
    }*/

    @Override
    public List<Department> findAllDepartment() {
        return departmentDao.findAllDepartment();
    }

    @Override
    public List<Department> findAllDepartment1() {

        return departmentDao.findAllDepartment1();
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
    public String deleteDepartment(String departmentId) {
        System.out.println("departmentId = " + departmentId);
        List<Doctor> doctors = doctorDao.findDoctorByDepartment(departmentId);
        Department department= departmentDao.findByDepartmentId(departmentId);
        System.out.println("department = " + department);
        List<Department> departments = findDepartment2ByDepartment1(departmentId);
          if(departments.size()!=0){
              return  department.getDepartmentName()+"下还有"+departments.size()+"个二级科室，不能删除";
          }else {
              if(doctors.size()!=0){
                  return  department.getDepartmentName()+"科室下还有"+doctors.size()+"名医生，不能删除";
              }else{
                  departmentDao.deleteDepartment(departmentId);
                  return department.getDepartmentName()+"删除成功";
              }
          }
    }

    @Override
    public Department findByDepartmentName(String departmentName) {
        return departmentDao.findByDepartmentName(departmentName);
    }
}
