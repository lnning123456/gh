package com.ln.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Doctor{
    String id;
    String doctorName;
    String departmentId;
    String position;
    String presentation;
    String src;
    String status;
   List<Work> works;
}
