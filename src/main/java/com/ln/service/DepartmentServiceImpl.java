package com.ln.service;

import com.ln.dao.DepartmentDao;
import com.ln.dao.DoctorDao;
import com.ln.entity.Department;
import com.ln.entity.Doctor;
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
    public List<Department> queryAllDepartment() {
        return departmentDao.queryAllDepartment();
    }

    @Override
    public List<Department> queryAllDepartment1() {
        return departmentDao.queryAllDepartment1();
    }

    @Override
    public Map<String,Object> queryDepartment2ByDepartment1(String departmentId) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        Department department = departmentDao.queryByDepartmentId(departmentId);
        List<Department> department2= departmentDao.queryDepartment2ByDepartment1Id(departmentId);
        map.put("department1Name",department.getDepartmentName());
        map.put("department2",department2);
        return map;
    }

    @Override
    public Map<String,String> addDepartment(Department department) {
        HashMap<String, String> map = new HashMap<>();
        Department byDepartmentName = departmentDao.queryByDepartmentName(department.getDepartmentName());
        if (byDepartmentName!= null){
            map.put("msg","添加失败,该科室名已经存在，请重新输入");
        }else{
            department.setDepartmentId(UUID.randomUUID().toString());
            departmentDao.addDepartment(department);
            map.put("ok","ok");
            map.put("msg",department.getDepartmentName()+"添加成功");

        }

       return  map;
    }

    @Override
    public Map<String,String> deleteDepartment(String departmentId) {
        HashMap<String, String> map = new HashMap<String,String>();
        List<Doctor> doctors = doctorDao.queryDoctorByDepartmentId(departmentId);
        Department department= departmentDao.queryByDepartmentId(departmentId);
        List<Department> departments = departmentDao.queryDepartment2ByDepartment1Id(departmentId);
          if(departments.size()!=0){
               map.put("msg",  department.getDepartmentName()+"下还有"+departments.size()+"个二级科室，不能删除");
               return map;
          }else {
              if(doctors.size()!=0){
                  map.put("msg",department.getDepartmentName()+"科室下还有"+doctors.size()+"名医生，不能删除");
                  return  map;
              }else{
                  departmentDao.deleteDepartment(departmentId);
                  map.put("msg",department.getDepartmentName()+"删除成功");
                  map.put("ok","ok");
                  return map;
              }
          }
    }

    @Override
    public Department queryByDepartmentName(String departmentName) {
        return departmentDao.queryByDepartmentName(departmentName);
    }
}
