package com.ln.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Department {
    String id;
    String departmentName;
    Integer levels;
    String parentId;
   // Department department2;
}
