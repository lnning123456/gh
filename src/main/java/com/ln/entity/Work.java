package com.ln.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Work {
    String workId;
    Date time;
    String doctorId;
    Double price;
    Integer remain;
    Integer userCount;
}
