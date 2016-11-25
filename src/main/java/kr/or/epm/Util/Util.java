package kr.or.epm.Util;

public class Util {
	    public static boolean isEmpty( Object obj ) {
		if ( "".equals(obj) || "" == obj || null == obj || obj.toString().equals( "" ) ) {
			return true;
		}else{
			return false;			
		}
    }
}


