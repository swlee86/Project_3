package kr.or.epm.Service;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.epm.DAO.ApprovalDAO;
import kr.or.epm.DAO.CommuteDAO;
import kr.or.epm.DAO.PjDAO;
import kr.or.epm.DAO.Pj_stepDAO;
import kr.or.epm.VO.Approval;
import kr.or.epm.VO.Commute;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Pj_step;
import kr.or.epm.VO.Pjd;
import kr.or.epm.VO.Pjd_Command;
import kr.or.epm.VO.Pjd_people;


@Service
public class ProjectService {

	@Autowired
	private SqlSession sqlsession;
	
	//승인 처리 갯수 가져오기
	public int selectApprovalCount(String emp_no, String field, String query) {
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		System.out.println("field : " + field.equals("step_name"));
		if(field.equals("step_name")){
			selectStepName(query);
		}
		int totalcount =  dao.selectApprovalCount(emp_no,field,query);
		return totalcount;
	}
	
	//승인번호 가져오기
	public void selectStepName(String query){
		System.out.println("selectStepName() 서비스");
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		dao.selectStepName(query);
		//return 
	}
	
	//자신의 정보 가져오기 
		public Emp selectInfoSearch(String id) {
			System.out.println("selectInfoSearch() 서비스");
			PjDAO dao = sqlsession.getMapper(PjDAO.class);
			Emp emp = dao.selectInfoSearch(id);
			System.out.println("emp 사번 : "+ emp.getEmp_no());
			return emp;
		}
		
		//큰 프로젝트 작성
		public String insertPj(Pj pj, Pjd_Command pjd_Command){
			System.out.println("insertPj() 서비스 ");
			System.out.println("pj.tosting : "+pj.toString());
			PjDAO dao = sqlsession.getMapper(PjDAO.class);
			int result = 0;
			result = dao.insertPj(pj);
			if(result > 0){	
				System.out.println("pj성공" + result);
				int numrow = insertPjd(pjd_Command);
				System.out.println("\\\\\\%%%numrow : " + numrow);


				List<String> rowlist = selectMaxPjd_no(numrow);
				System.out.println("rowlist : " + rowlist.toString());
				
				
				insertPjd_people(rowlist,pjd_Command);
			}
			
			return "redirect:project_list.do";
		}
		
		private List<String> selectMaxPjd_no(int numrow) {
			System.out.println("selectMaxPjd_no 서비스");
			PjDAO dao = sqlsession.getMapper(PjDAO.class);
			List<String> rowlist = dao.selectMaxPjd_no(numrow);
			System.out.println("rowlist : " + rowlist.toString());
			return rowlist;
		}

		//상세 프로젝트 작성
		public int insertPjd(Pjd_Command pjd_Command){
			PjDAO dao = sqlsession.getMapper(PjDAO.class);
			int result = 0;
			List<Pjd> list = pjd_Command.getPjd();
			int max_no = selectMaxPj_no();
			System.out.println("max_no : "+max_no);
			String pj_no = String.valueOf(max_no);
			System.out.println("@상세 프로젝 트 추가된 갯수 : "+ list.size());
			
			for(Pjd pjd : list){
				result = 0;
				System.out.println("***pjd : "+pjd.toString());
				pjd.setPj_no(pj_no);
				result = dao.insertPjd(pjd);
				System.out.println("=> 상세 프로젝트 추가 결과  : "+result);
			}
			int row = list.size();
			return row;	
		}
		
		
		//상세프로젝트 참여자 작성
		public int insertPjd_people(List<String> rowlist, Pjd_Command pjd_Command){
			System.out.println("rowlist : "+ rowlist);
			PjDAO dao = sqlsession.getMapper(PjDAO.class);
			List<Pjd> list = pjd_Command.getPjd();
			
			int result = 0;
			int row = 0;
			
			for(Pjd pjd : list){		
				String[] rec_people = pjd.getRec_emp_no().split(",");
				System.out.println("선택된 참여자 인원 : " + rec_people.length);
				System.out.println("상세 번호 : "+ rowlist.get(row));
				
				for(int i = 0; i<rec_people.length ; i++){
					System.out.println("rec_people["+i+"] : "+rec_people[i]);
					result = 0;
					result = dao.insertPjd_people(rowlist.get(row), rec_people[i]);
					System.out.println("참여자 추가 결과 : "+result);
				}
				
				row = +1;
			}	
			return result;	
		}
		
		public int selectMaxPj_no(){
			int result = 0;
			PjDAO dao = sqlsession.getMapper(PjDAO.class);
			result = dao.selectMaxPj_no();
			System.out.println("@@@@최고글 번호 : "+result);
			return result;
		}
		
		
	// 모든 프로젝트 목록 출력
	public List<Pj> selectPjlist_all(){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		List<Pj> list = null;	
		list= dao.selectPj();		
		return list;
	}
	
	// 카테고리별 프로젝트 목록 출력 (승인된 것만 )
	public List<Pj> selectPjlist_ctg(String select_ctg,String emp_no){
		
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		List<Pj> list =null;
		
		if(select_ctg.equals("all")){
			list = dao.selectPj();
		}else if(select_ctg.equals("write")){
			list = dao.selectPj_write(emp_no);
		}else if(select_ctg.equals("include")){
			list = dao.selectPj_include(emp_no);
		}
		return list;
	}
	
	// 내가 작성한 프로젝트 , 내가 참여자인 프로젝트 목록 가져오기 (캘린더)
	public List<Pj> selectPj_callendar(String emp_no){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		List<Pj> list=null;
		
		list = dao.selectPj_callendar(emp_no);
		
		return list;
	}

	
	//프로젝트 작성한 사람의 사번가져오기
	public String selectPjwriteempno(String pjd_no){
		PjDAO dao = sqlsession.getMapper(PjDAO.class);
		
		String pj_emp_no = "";
		pj_emp_no = dao.selectPj_writeempno(pjd_no);
		return pj_emp_no;
	}
	
	//승인처리 목록 가져오기
	public List<Pj_step> selectPjStepList(){
		Pj_stepDAO dao = sqlsession.getMapper(Pj_stepDAO.class);
		
		List<Pj_step> pjstep = null;
		
		pjstep = dao.selectPj_step();
		return pjstep;
	}
}
