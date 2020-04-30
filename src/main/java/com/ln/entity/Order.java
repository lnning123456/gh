package com.ln.entity;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Order {
    String orderId;
    String userId;
    String workId;
    String status;
    Date createTime;
    Work work;
}
