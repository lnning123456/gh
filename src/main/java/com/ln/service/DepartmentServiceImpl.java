package com.ln.service;

import com.ln.dao.DepartmentDao;
import com.ln.dao.DoctorDao;
import com.ln.entity.Department;
import com.ln.entity.Doctor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class DepartmentServiceImpl implements DepartmentService {
    @Autowired
    DepartmentDao departmentDao;
    @Autowired
    DoctorDao doctorDao;

    @Override
    public List<Department> queryAllDepartment() {
        return departmentDao.queryAllDepartment();
    }

    @Override
    public List<Department> queryAllDepartment1() {
        return departmentDao.queryAllDepartment1();
    }

    @Override
    public Map<String, Object> queryDepartment2ByDepartment1(String departmentId) {
        HashMap<String, Object> map = new HashMap<String, Object>();
        Department department = departmentDao.queryByDepartmentId(departmentId);
        List<Department> department2 = departmentDao.queryDepartment2ByDepartment1Id(departmentId);
        map.put("department1Name", department.getDepartmentName());
        map.put("department2", department2);
        return map;
    }

    @Override
    public String addDepartment(Department department) {
        Department byDepartmentName = departmentDao.queryByDepartmentName(department.getDepartmentName());
        if (byDepartmentName != null) {
            return "添加失败,该科室名已经存在，请重新输入";
        } else {
            department.setDepartmentId(new Date().getTime() + "");
            departmentDao.addDepartment(department);
            return department.getDepartmentName() + "添加成功";
        }


    }

    @Override
    public String deleteDepartment(String departmentId) {

        List<Doctor> doctors = doctorDao.queryDoctorByDepartmentId(departmentId);
        Department department = departmentDao.queryByDepartmentId(departmentId);
        List<Department> departments = departmentDao.queryDepartment2ByDepartment1Id(departmentId);
        if (departments.size() != 0) {
            return department.getDepartmentName() + "下还有" + departments.size() + "个二级科室，不能删除";

        } else {
            if (doctors.size() != 0) {
                return department.getDepartmentName() + "科室下还有" + doctors.size() + "名医生，不能删除";
            } else {
                departmentDao.deleteDepartment(departmentId);
                return department.getDepartmentName() + "删除成功";
            }
        }
    }

    @Override
    public Department queryByDepartmentName(String departmentName) {
        return departmentDao.queryByDepartmentName(departmentName);
    }
}
