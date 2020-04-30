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
    @Test
    public  void compare(){
        Work work = new Work();
        List<Work> works = workDao.queryWork(work, 0, "1");
        System.out.println(new Date());
        for (Work work1 : works) {
            System.out.println("work1 = " + work1);
        }
    }
    @Test
    public  void getWorkCount(){
        Work work = new Work();
        Integer workCount = workDao.getWorkCount(work, "1");
        System.out.println("workCount = " + workCount);
    }
    @Test
    public  void followingWork(){
        List<Work> works = workDao.followingWork("1");
        for (Work work : works) {
            System.out.println("work = " + work);
        }
    }
}
