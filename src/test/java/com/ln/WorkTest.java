package com.ln;

import com.ln.dao.WorkDao;
import com.ln.entity.Work;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@SpringBootTest(classes = GhApplication.class)
@RunWith(SpringRunner.class)
public class WorkTest {
    @Autowired
    WorkDao workDao;
    @Test
    public  void queryWorkByDoctorId(){
        List<Work> works = workDao.queryWorkByDoctorId("2");
        for (Work work : works) {
            System.out.println("work = " + work);
            Date time = work.getTime();
            SimpleDateFormat ft = new SimpleDateFormat("yyyy-MM-dd a");
            System.out.printf("全部日期和时间信息：%tc%n",time);
            System.out.println("ft = " + ft.format(time));
        }
    }
    @Test
    public  void dateTest(){
        final Calendar c = Calendar.getInstance();
    }
}
