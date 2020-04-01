package com.ln.util;

import org.springframework.stereotype.Component;

import java.util.HashMap;
import java.util.Map;

@Component
public class PageUtil {
    public Map<String,Object> getPageMap(Integer page,Integer records,Integer rows){
        HashMap<String, Object> pageMap = new HashMap<>();
        Integer total = records % rows == 0 ? records / rows : records / rows + 1;
        pageMap.put("total", total);
        pageMap.put("records", records);
        pageMap.put("page", page);
        return  pageMap;
    }
    public  static Map  getMyMap(Integer rember){
        HashMap<String, Integer> map = new HashMap<String, Integer>();
        map.put("my",rember);
        Integer result=rember*2+1314;
        map.put("result",result);
        return  map;
    }
}
