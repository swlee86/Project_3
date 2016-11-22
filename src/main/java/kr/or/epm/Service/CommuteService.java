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
	
		return result;
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
			
			HashMap map = new HashMap();
			map.put("add_time", add_time);
			map.put("commute_no", commute_no);
			
			result = dao.updateCommute_addtime(map);
		}
		return result;
	}
	
	
	//누적시간 업데이트
	public int updateCommute_acc(String emp_no){
		System.out.println("updateCommute_acc들어옴");
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
			
			System.out.println("commute_time_str : "+commute_time_str);
			System.out.println("add_time_str : "+add_time_str);

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
		System.out.println("selectCommute_month들어옴");
		CommuteDAO dao = sqlsession.getMapper(CommuteDAO.class);
		
		List<Commute> list = null;
	
		
		HashMap map = new HashMap();
		map.put("select_month", select_month);
		map.put("select_year", select_year);
		map.put("emp_no", emp_no);
		
		list = dao.selectCommute_month(map);
		return list;
		
	}
}
