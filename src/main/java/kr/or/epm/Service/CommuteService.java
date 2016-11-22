package kr.or.epm.Service;


import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.CommuteDAO;
import kr.or.epm.VO.Commute;
import kr.or.epm.VO.Set_time;



@Service
public class CommuteService {

	@Autowired
	private SqlSession sqlsession;
	

	//현재 로그인한 계정의 근태 내역을 뿌려줌
	public List<Commute> selectCommute(String id){
		
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		List<Commute> list= dao.selectCommute();
		
		return list;
	}
	
	//insert 출근시간
	public int insertCommute_in(String in_time,String emp_no){
		
		System.out.println("commute service들어옴");
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		//근태테이블에 이미 출근했는지 조회
		String commute_no = dao.selectMyCommute_no(emp_no);
		
		//없으면 insert
		int result = 0;
		if(commute_no==null){
			HashMap map = new HashMap();
			map.put("in_time", in_time);
			map.put("emp_no", emp_no);
			result = dao.insertCommute_in(map);
		}
		//있으면 작업 X
		
		return result;
	}
	
	//update 퇴근시간
	public int updateCommute_out(String out_time,String emp_no){
		System.out.println("updateCommute_out들어옴");
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		//근태테이블에서 출근했는지 조회
		String commute_no = dao.selectMyCommute_no(emp_no);
		
		//있으면 update
		int result = 0;
		if(commute_no!=null){
			HashMap map = new HashMap();
			map.put("out_time", out_time);
			map.put("commute_no", commute_no);
			result = dao.updateCommute_out(map);
			
		}
		//없으면 작업 X
		
		return result;
	}
	
	//오늘 근무시간 업데이트
	public int updateCommute_time(String commute_time,String emp_no){
		System.out.println("updateCommute_time들어옴");
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		//근태테이블에서 출근했는지 조회
		String commute_no = dao.selectMyCommute_no(emp_no);
		//있으면 update
		int result = 0;
		if(commute_no!=null){
			HashMap map = new HashMap();
			map.put("commute_time", commute_time);
			map.put("commute_no", commute_no);
			result = dao.updateCommute_time(map);
			
		}
		//없으면 작업 X
	
		return 0;
	}
	
	
	//오늘의 근태정보 조회
	public Commute selectCommute_today(String emp_no){
		System.out.println("selectCommute_today들어옴");
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		//근태테이블에서 출근했는지 조회
		String commute_no = dao.selectMyCommute_no(emp_no);
		
		Commute commute = null;
		if(commute_no!=null){
			//commute_no로 오늘의 근태 정보 가져오기
			commute = dao.selectCommute_commuteno(commute_no);
		}
		
		return commute;
	}
	
	//추가시간 업데이트
	public int updateCommute_add(String emp_no){
		System.out.println("updateCommute_add들어옴");
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		String commute_no = dao.selectMyCommute_no(emp_no);
		Commute commute =null;
		int result = 0;
		if(commute_no!=null){
			Set_time set_time = dao.selectSetTime(emp_no);
			
			String out_time_dept = set_time.getOut_time();
			
			int out_time_dept_h = Integer.parseInt(out_time_dept.substring(0,2));
			int out_time_dept_m = Integer.parseInt(out_time_dept.substring(3,5));
			
			
			commute = dao.selectCommute_commuteno(commute_no);
			
			String out_time_emp = commute.getOut_time();
			
			int out_time_emp_h = Integer.parseInt(out_time_emp.substring(0,2));
			int out_time_emp_m = Integer.parseInt(out_time_emp.substring(3,5));
			
			//추가시간 계산
			Date date_dept = new Date();
			Date date_emp = new Date();
			date_dept.setHours(out_time_dept_h);
			date_dept.setMinutes(out_time_dept_m);
			date_emp.setHours(out_time_emp_h);
			date_emp.setMinutes(out_time_emp_m);
			
			long date_add = date_emp.getTime()-date_dept.getTime();
			
			String add_time = "0:0";
			if(date_add > 0){
				int date_add_hour = (int)(date_add/ 60000 / 60);
	
				int tempHour = 60*date_add_hour;
			
				int date_add_min = (int)((date_add / 60000)-tempHour);
				
				String date_add_min_str=String.valueOf(date_add_min);
				if(date_add_min < 10){
					date_add_min_str = "0"+date_add_min_str;
				}
				add_time = date_add_hour+":"+date_add_min_str;
				
			}
			
			HashMap map = new HashMap();
			map.put("add_time", add_time);
			map.put("commute_no", commute_no);
			
			result = dao.updateCommute_addtime(map);
		}
		return result;
	}
}
