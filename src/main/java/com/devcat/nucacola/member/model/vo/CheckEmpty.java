package com.devcat.nucacola.member.model.vo;

import java.lang.reflect.Array;
import java.util.List;
import java.util.Map;

// mybatis 동적 sql문 for문을 사용할때, 배열 null체크확인으로 사용하는 vo
public class CheckEmpty {
	public static boolean isEmpty(Object obj){
        if( obj instanceof String ) return obj==null || "".equals(obj.toString().trim());
        else if( obj instanceof List ) return obj==null || ((List)obj).isEmpty();
        else if( obj instanceof Map ) return obj==null || ((Map)obj).isEmpty();
        else if( obj instanceof Object[] ) return obj==null || Array.getLength(obj)==0;
        else return obj==null;
    }
      
}
