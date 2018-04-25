package com.toinfra.Service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import com.toinfra.DTO.*;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.toinfra.DAO.CommuteDAO;
import com.toinfra.DAO.DeptDAO;
import com.toinfra.DAO.EmpDAO;
import com.toinfra.DAO.Low_deptDAO;
import com.toinfra.DAO.PayDAO;
import com.toinfra.DAO.PositionDAO;
import com.toinfra.DTO.UserDto;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;


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
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		//근태테이블에 이미 출근했는지 조회
		String commute_no = dao.selectMyCommute_no(emp_no);
		
		//없으면 insert
		int result = 0;
		if(commute_no==null){
			
			//출근시간을 퇴근전에 했는지 검사
			Set_time set_time = dao.selectSetTime(emp_no);
			String out_time_dept = set_time.getOut_time();
			
			int out_time_dept_h = Integer.parseInt(out_time_dept.substring(0,2));
			int out_time_dept_m = Integer.parseInt(out_time_dept.substring(3,5));
			
			int in_time_emp_h = Integer.parseInt(in_time.substring(0,2));
			int in_time_emp_m = Integer.parseInt(in_time.substring(3,5));
			
			//퇴근시간보다 먼저 출근했는지 시간 계산
			Date date_dept = new Date();
			Date date_emp = new Date();
			date_dept.setHours(out_time_dept_h);
			date_dept.setMinutes(out_time_dept_m);
			date_emp.setHours(in_time_emp_h);
			date_emp.setMinutes(in_time_emp_m);
			
			long date_add = date_dept.getTime()-date_emp.getTime();
	
			if(date_add < 0 ){
				return 2; // retrun이 2이면 출근시간이 부서의 퇴근시간보다 늦은 경우
			}
			
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
	
		return result;
	}
	
	//관리자용 - 근태 마감  확인 - 
	public int updateCommute_mgr_check(String commute_no, String emp_no) {
		int result=0;
		int payinsert_result=0;
		
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
	    result = dao.updateCommute_Close(commute_no);
	   
	    //업데이트 성공시 pay insert 실행합니다.
	    if(result>0){
	    	EmpDAO empdao = sqlsession.getMapper(EmpDAO.class);
	    	//1. 기본급여
	    	UserDto userDto =empdao.selectEmp(emp_no);
	    
	    	//emp_no로 emp에서 연봉 가져오기
	    	int salary = userDto.getSalary()/12;
	    	
	    	Pay pay =new Pay();
	    	//userDto > basic_pay(기본급여) 세팅하기---------------------1)
	    	pay.setBasic_pay(salary);
	    	
	    	//2.상여금
	        Low_deptDAO low_deptdao =sqlsession.getMapper(Low_deptDAO.class);
	        //emp의 low_dept_no로 dept_no 가져오기
	        LowDeptJoin lowDeptjoin =low_deptdao.selectLow_dept_detail(userDto.getLow_dept_no());
	        String dept_no =lowDeptjoin.getDept_no();
	        DeptDAO deptdao = sqlsession.getMapper(DeptDAO.class);
	        //dept_no로 상여금 지급하는 부서 가져오기
	        Set_bonus set_bonus =deptdao.select_bonus_check(dept_no);
	        
	        //상여금 있을 경우
	        if(set_bonus != null){
	        
	        //상여금 비율
	        double bonus_percent = set_bonus.getBonus_percent()/(double)100;
	        //상여금 구해서 setting----------------------------------2)
	        int bonus =	(int)(bonus_percent*pay.getBasic_pay());
	        pay.setBonus(bonus);
	        
	        //3.추가급여
	        int add_pay=add_Pay(userDto, commute_no);
	        pay.setAdd_pay(add_pay);
	        
	        //4.총급여 더하기
	        int total_pay = pay.getBasic_pay()+pay.getAdd_pay()+pay.getBonus();
	        pay.setTotal_pay(total_pay);
	        pay.setUser_id(emp_no);
	       
	        
	        
	        //bonus 없는경우
	        }else{
	        	pay.setBonus(0);
	        	//3. 추가급여
	        	
	        	int add_pay=add_Pay(userDto, commute_no);
	        	pay.setAdd_pay(add_pay);
	        	
	        	//4. 총급여
	        	int total_pay = pay.getBasic_pay()+pay.getAdd_pay()+pay.getBonus();
	        	pay.setTotal_pay(total_pay);
	        	pay.setUser_id(emp_no);
		      	
	        }
	    	
	    	PayDAO paydao = sqlsession.getMapper(PayDAO.class);
	    	
	    	//급여 insert 결과
	    	payinsert_result = paydao.insertPay(pay);
	    	
	    }
	    
		return payinsert_result;
		
	}
	
	//추가급여
	public int add_Pay(UserDto userDto, String commute_no){
		int result = 0;
		//1.추가급여
        //emp의 직위번호로 set_add_pay에서 추가급여 구하기
        PositionDAO positiondao =sqlsession.getMapper(PositionDAO.class);
        PositionJoin positionjoin= positiondao.selectOptionJoin(userDto.getPosition_no());
        //추가급여
        int add_pay_cost = positionjoin.getAdd_pay();
        
        //2. commute_no로 최대 누적 초과근무시간 구하기
        CommuteDAO commutedao = sqlsession.getMapper(CommuteDAO.class);
        Commute commute = commutedao.selectCommute_commuteno(commute_no);
        String acc_add_time = commute.getAcc_add_time();
        
        if(acc_add_time.equals("0")){
        	result=0;
        }else{	
        //시간 환산하기
        String[] time=acc_add_time.split(":");
        if(time[0].startsWith("0")){
        		if(time[1].startsWith("0")){
        			int hour =Integer.parseInt(time[0].substring(0));
        			double minute = Integer.parseInt(time[1].substring(0))/(double)60;
        			double add_time =hour+minute;
            		result = (int)(add_time * add_pay_cost);
            		
        		}else{
        			int hour =Integer.parseInt(time[0].substring(0));
        			double minute = Integer.parseInt(time[1])/(double)60;
            		double add_time =Integer.parseInt(time[0])+minute;
            		result = (int)(add_time * add_pay_cost);
            		
        		}
        }else{
        	if(time[1].startsWith("0")){
        		int hour = Integer.parseInt(time[0]);
        		double minute = Integer.parseInt(time[1].substring(0))/(double)60;
        		double add_time =hour+minute;
        		result = (int)(add_time * add_pay_cost);
        		
        	}else{
        		//분을 시간으로 환산하기
        		double minute = Integer.parseInt(time[1])/(double)60;
        		double add_time =Integer.parseInt(time[0])+minute;
        		result = (int)(add_time * add_pay_cost);
        		
        	}
         }
        }
		return result;
	}
	
	
	
	//오늘의 근태정보 조회
	public Commute selectCommute_today(String emp_no){
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
			
			String add_time = "00:00";
			if(date_add > 0){
				int date_add_hour = (int)(date_add/ 60000 / 60);
	
				int tempHour = 60*date_add_hour;
			
				int date_add_min = (int)((date_add / 60000)-tempHour);
				
				String date_add_min_str=String.valueOf(date_add_min);
				String date_add_hour_str=String.valueOf(date_add_hour);

				if(date_add_min < 10){
					date_add_min_str = "0"+date_add_min_str;
				}
				if(date_add_hour < 10){
					date_add_hour_str = "0"+date_add_hour_str;
				}
				add_time = date_add_hour_str+":"+date_add_min_str;
				
			}
			
			HashMap<String, String> map = new HashMap<String, String>();
			map.put("add_time", add_time);
			map.put("commute_no", commute_no);
			
			result = dao.updateCommute_addtime(map);
		}
		return result;
	}
	
	
	//누적시간 업데이트
	public int updateCommute_acc(String emp_no){
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		String commute_no = dao.selectMyCommute_no(emp_no);
		Commute commute_pre =null;
		Commute commute_post =null;

		int result = 0;
		if(commute_no!=null){
			commute_pre = dao.selectCommute_yesterday(emp_no);
			String acc_commute_time_pre = null;
			String acc_add_time_pre = null;
			if(commute_pre !=null){
				if(commute_pre.getAcc_add_time() != null && commute_pre.getAcc_commute_time() != null){
					acc_commute_time_pre = commute_pre.getAcc_commute_time();
					acc_add_time_pre = commute_pre.getAcc_add_time();
				}else{
					acc_commute_time_pre ="00:00";
					acc_add_time_pre = "00:00";
				}
			}else{
				acc_commute_time_pre ="00:00";
				acc_add_time_pre = "00:00";
			}
	
			String arrtemp1[] = acc_commute_time_pre.split(":");	
			String acc_commute_time_pre_h =arrtemp1[0];
			String acc_commute_time_pre_m =arrtemp1[1];

			String arrtemp2[] = acc_add_time_pre.split(":");
			String acc_add_time_pre_h =arrtemp2[0];
			String acc_add_time_pre_m =arrtemp2[1];
			
			
			commute_post = dao.selectCommute_commuteno(commute_no);

			String acc_commute_time_post = null;
			String acc_add_time_post = null;
			if(commute_post.getAdd_time() == null && commute_post.getCommute_time() == null){
				return 0;
			}else{
				acc_commute_time_post = commute_post.getCommute_time();
				acc_add_time_post = commute_post.getAdd_time();
			}
			
			String arrtemp3[] = acc_commute_time_post.split(":");
			String acc_commute_time_post_h =arrtemp3[0];
			String acc_commute_time_post_m =arrtemp3[1];

		
			String arrtemp4[] = acc_add_time_post.split(":");
			String acc_add_time_post_h =arrtemp4[0];
			String acc_add_time_post_m =arrtemp4[1];

		
			String commute_time_str = "00:00";
			String add_time_str = "00:00";

			
			if(!(acc_commute_time_pre.equals("00:00")&&acc_commute_time_post.equals("00:00"))){
								
				int commute_time_h = Integer.parseInt(acc_commute_time_post_h) + Integer.parseInt(acc_commute_time_pre_h);				
				int commute_time_m = Integer.parseInt(acc_commute_time_post_m) + Integer.parseInt(acc_commute_time_pre_m);				
				
				if(commute_time_m >= 60){
					commute_time_m = commute_time_m-60;
					commute_time_h++;
				}
				
				String commute_time_h_str = String.valueOf(commute_time_h);
				String commute_time_m_str = String.valueOf(commute_time_m);
				if(commute_time_m < 10){
					commute_time_m_str = "0"+commute_time_m_str;
				}
				if(commute_time_h < 10){
					commute_time_h_str = "0"+commute_time_h_str;
				}
				commute_time_str = commute_time_h_str+":"+commute_time_m_str;
			}
			
			if(!(acc_add_time_pre.equals("00:00")&&acc_add_time_post.equals("00:00"))){
				int add_time_h = Integer.parseInt(acc_add_time_post_h) + Integer.parseInt(acc_add_time_pre_h);	
				int add_time_m = Integer.parseInt(acc_add_time_post_m) + Integer.parseInt(acc_add_time_pre_m);
				
				if(add_time_m >= 60){
					add_time_m = add_time_m-60;
					add_time_h++;
				}
				
				String add_time_h_str = String.valueOf(add_time_h);
				String add_time_m_str = String.valueOf(add_time_m);
				if(add_time_m < 10){
					add_time_m_str = "0"+add_time_m_str;
				}
				if(add_time_h < 10){
					add_time_h_str = "0"+add_time_h_str;
				}
				add_time_str = add_time_h_str+":"+add_time_m_str;			
			}
			
			HashMap map = new HashMap();
			map.put("acc_commute_time", commute_time_str);
			map.put("acc_add_time", add_time_str);
			map.put("commute_no", commute_no);
			
			result = dao.updateCommute_acctime(map);
		}
		return result;
	}
	
	
	//월별 근태 내역조회
	
	public List<Commute> selectCommute_month(String emp_no, String select_month, String select_year){
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		List<Commute> list = null;
	
		
		HashMap map = new HashMap();
		map.put("select_month", select_month);
		map.put("select_year", select_year);
		map.put("emp_no", emp_no);
		
		list = dao.selectCommute_month(map);
		return list;
		
	}
	
	
	
	//회원정보
	public Commute selectempinfo(String emp_no){
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		Commute commute = null;
		commute = dao.selectempinfo(emp_no);
		return commute;
		
	}
	
	//아이디로 회원정보가져오기
	public UserDto selectInfoSearch(String id) {
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		UserDto userDto =  dao.selectInfoSearch(id);
		return userDto;
	}
	
	//근태 마감 관리 리스트 - > 서비스
	public List<PayList> selectCommute_all_Close(String dTime){
		
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class); 
		List<PayList> list = dao.selectCommute_all_Close(dTime);
		
		return list;
	}

	//차트에 이용하는 근무시간, 추가근무시간
	public JSONObject selectChartCommute(String emp_no){
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		List<Commute> chartcommutelist = null;
		chartcommutelist = dao.selectChartCommute(emp_no);
		
		JSONObject jsonObject = new JSONObject();
		JSONArray array = new JSONArray();
		
		for(int i = 0; i < chartcommutelist.size(); i++){
			String c_time = chartcommutelist.get(i).getCommute_time();
			String a_time = chartcommutelist.get(i).getAdd_time();
			
			if(c_time != null && a_time != null){
				String c_time_h = c_time.substring(0,2);
				String c_time_m = c_time.substring(3,5);
				int c_time_parse_min = (Integer.parseInt(c_time_h)*60) + Integer.parseInt(c_time_m);
				
				String a_time_h = a_time.substring(0,2);
				String a_time_m = a_time.substring(3,5);
				int a_time_parse_min = (Integer.parseInt(a_time_h)*60) + Integer.parseInt(a_time_m);
				
				int c_time_result = c_time_parse_min-a_time_parse_min;
				
				JSONObject obj = new JSONObject();
				obj.put("regdate", chartcommutelist.get(i).getRegdate());
				obj.put("c_time", c_time_result);
				obj.put("a_time", a_time_parse_min);
				
				array.add(obj);
			}
		
			
		}
		
		jsonObject.put("chartlist", array);
		return jsonObject;
	}
}
