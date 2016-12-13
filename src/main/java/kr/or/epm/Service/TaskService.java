package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.ApprovalDAO;
import kr.or.epm.DAO.OrganizationDAO;
import kr.or.epm.DAO.TaskDAO;
import kr.or.epm.DAO.Task_peopleDAO;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Organization;
import kr.or.epm.VO.Task;
import kr.or.epm.VO.Task_people;

@Service
public class TaskService {

	@Autowired
	private SqlSession sqlsession;

	
	public int selectCount_parti(String emp_no,  String field_parti, String query_parti) {
		TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
		int totalcount = 0;
		totalcount = dao.selectCount_parti(emp_no,field_parti, query_parti);
		return totalcount;
	}

	//수신 갯수구하는 함수
	public int selectCount_rec(String emp_no, String cg_no ,String field, String query) {
		TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
		int totalcount = 0;
		totalcount = dao.selectCount_rec(emp_no, cg_no, field, query);
		return totalcount;
	}

	//송신 갯수 구하는 함수
	public int selectCount_song(String emp_no, String cg_no, String field, String query) {
		TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
		int totalcount = 0;
		totalcount = dao.selectCount_song(emp_no, cg_no, field, query);
		return totalcount;
	}
	
	
	
	// 업무 요청, 보고, 일지 > 수신 리스트 불러오기
		// 사용
		public List<Task> selectTask_rec(String emp_no, String cg_no, String field_rec, String query_rec, int cpage_rec, int pagesize){
			
			
			String cg_name = "";
			if(cg_no.equals("1")) { cg_name = "업무 요청"; }
			else if(cg_no.equals("2")) { cg_name = "업무 보고"; }
			else if(cg_no.equals("3")) { cg_name = "업무 일지"; }
			else { cg_name = "'cg_no'에 잘못된 값이 넘어온 것같습니다"; };
			
			TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
			
			List<Task> list = dao.selectTask_rec(emp_no, cg_no,field_rec,query_rec,cpage_rec,pagesize);
			return list; 
		}
	
		
		// 업무 요청, 보고, 일지 > 송신 리스트 불러오기
		// 사용
		public List<Task> selectTask(String emp_no, String cg_no, String field_song, String query_song, int cpage_song, int pagesize){
			
			
			String cg_name = "";
			if(cg_no.equals("1")) { cg_name = "업무 요청"; }
			else if(cg_no.equals("2")) { cg_name = "업무 보고"; }
			else if(cg_no.equals("3")) { cg_name = "업무 일지"; }
			else { cg_name = "'cg_no'에 잘못된 값이 넘어온 것같습니다"; };
			
			TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
			
			List<Task> list = dao.selectTask_song(emp_no, cg_no,field_song,query_song,cpage_song,pagesize);
			return list;
		}		
		
		
		// 업무 요청 > 참여 리스트 불러오기
		public List<Task> selectTask_people(String emp_no, String field_parti, String query_parti, int cpage_parti, int pagesize) {
			
			
			TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
			List<Task> list = dao.selectTask_people(emp_no,field_parti,query_parti,cpage_parti,pagesize);
			return list;
		}
		
		
		
	// 업무 등록시 / 모달->지점 이름 트리 구조
	// 사용
	public List<Organization> selectDept() {
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		list = organizationDAO.selectBranch();

		for (int i = 0; i < list.size(); i++) {
				}

		return list;
	}

	// 업무 등록시 / 모달 -> 부서 이름 트리 구조
	// 사용
	public List<Organization> selectdeptname(String branch_name) {
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
		list = organizationDAO.selectDept(branch_name);
		return list;
	}

	// 업무 등록시 / 모달 -> 하위 부서 이름 트리 구조
	// 사용
	public List<Organization> selectlowDept(String dept_name) {
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);

		
		list = organizationDAO.selectlowDept(dept_name);
		return list;
	}

	// 업무 등록시 / 모달 -> 사원 정보 이름 트리 구조
	public List<Organization> selectEmpInfo(String low_dept_name) {
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);

		list = organizationDAO.selectEmpInfo(low_dept_name);
		for (int i = 0; i < list.size(); i++) {
		}

		return list;
	}

	//조직도 모달 > 자신의 정보 제외 시킬ㄹ려고 떄문에 만든거
	public List<Organization> selectEmpInfo_exclude(String low_dept_name,String id) {
		List<Organization> list = null;
		OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);

		list = organizationDAO.selectEmpInfo_modal(low_dept_name,id);
		for (int i = 0; i < list.size(); i++) {
		}

		return list;
	}
	
	
	
	// 업무 등록
	public int insertTask(Task task) {
		
		TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
		int result = dao.insertTask(task);
		
		return result;
	}

	// 업무 등록 > 참여자 등록을 위해 task_no 불러오기
	public String selectTask_no() {
		
		Task_peopleDAO dao = sqlsession.getMapper(Task_peopleDAO.class);
		String task_no = "";
		task_no = dao.selectTask_No();
		
		return task_no;
	}
	
	// 업무 등록 > 참여자 등록
	// 사용
	public int insertTask_people(String task_no, String[] peopleList) {

		int result = 0;
		
		Task_peopleDAO dao = sqlsession.getMapper(Task_peopleDAO.class);
		
		for(int i=0; i<peopleList.length; i++) {
			result = dao.insertTask_people(task_no, peopleList[i]);
		}
		
		return result;
	}
	
	
	
	// 업무 요청, 보고, 일지 > 상세
	// 사용
	public Task selectTask_detail(String task_no, String emp_no){
		
		
		TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
		Task detail = dao.selectTask_detail(task_no);
		if(detail.getRec_emp_no().equals(emp_no)){
			int result = dao.updateTask_recDate(task_no);
			if(result > 0) {
			} else {
			}
		}
		return detail;
	}

	
	
	// 업무 중요설정하기
	// 사용
	public int updateTask_sign(String task_no, String sign) {
		
		TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
		int result = dao.updateTask_sign(task_no, sign);
		
		return result;
	}
	
	// 업무 삭제하기
	// 사용
	public int deleteTask(String task_no, String RecSend) {
		
	
		TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
		int result = 0;
		
		if(RecSend.equals("Rec")) {
			dao.deleteTask_rec(task_no);
		} else if(RecSend.equals("Send")) {
			dao.deleteTask(task_no);
		}
				
		return result;
	}
	

	
	// 검색하기
	// 사용
	public List<Task> searchTask(String emp_no, String cg_no, String key, String value) {
		
		TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
		
		List<Task> searchList = dao.searchTask(emp_no, cg_no, key, value);
		
		return searchList;
	}

	// 업무 승인 처리 단계 변경하기
	// 사용
	public int approval(String approval,String task_no){
		
		
		int result = 0;
		TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
		result = dao.updateTask_approval(task_no, approval);
		
		return result;
	}

	// 업무 요청 > 송신탭 > ajaxJson 용 
	public List<Task> listTask(String emp_no, String cg_no){
		TaskDAO taskDAO = sqlsession.getMapper(TaskDAO.class);
		List<Task> list = taskDAO.selectTask(emp_no, cg_no);
		return list;
	}

	//업무 요청 > 참여 탭 > ajaxJson 용
	public List<Task_people> selectTaskRequest_Participation_people(String emp_no){
		TaskDAO taskDAO = sqlsession.getMapper(TaskDAO.class);
		List<Task_people> list = taskDAO.selectTask_people_ForMe(emp_no);
		return list;
	}
	
	// 진행상태 수정
	// 사용
	public int updateTaskRequest_participation_step(String task_no, String task_step_no) {		
		int result =0;
		TaskDAO dao = sqlsession.getMapper(TaskDAO.class);
		result = dao.updateTask_step(task_no, task_step_no);
		
		
		return result;
	}
}



