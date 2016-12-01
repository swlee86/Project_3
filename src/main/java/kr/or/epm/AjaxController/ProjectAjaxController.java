package kr.or.epm.AjaxController;


import java.lang.reflect.Array;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.CommonService;
import kr.or.epm.Service.ProjectDetailService;
import kr.or.epm.Service.ProjectService;
import kr.or.epm.VO.Contact;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_contact;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Pjd_people;
import kr.or.epm.VO.Pjdd;
import kr.or.epm.VO.Task;

/*
 * 작성자 : 김주희
 * 작성일 : 2016-11-23
 * 사용목적 : Project 관련 ajax 컨트롤러
 * 
 */

@Controller
public class ProjectAjaxController {

	@Autowired
	private View jsonview;
	@Autowired
	private ProjectService projectservice;
	@Autowired
	private ProjectDetailService projectdetailservice;
	@Autowired
	private CommonService commonservice; 
	//리스트에서 선택한 옵션으로 view 동기화시키기
	@RequestMapping("/select_pjlist.do")
	public View select_pjlist(String select_ctg, Principal principal,  Model model){	
		System.out.println("select_pjlist Start");
		
		String id= principal.getName();
		System.out.println("id : "+id);
		String emp_no = commonservice.selectEmp_no(id);
		System.out.println("select_ctg : " + select_ctg);
		List<Pj> result = projectservice.selectPjlist_ctg(select_ctg, emp_no);
		model.addAttribute("project", result);
		
		return jsonview; 
	}
	
	//참여자 자세히 보기(modal)
	@RequestMapping("/pjd_people.do")
	public View pjd_people(String emp_no, Model model){
		System.out.println("pjd_people");
			
		Pjd_people result = projectdetailservice.pjd_people(emp_no);

		model.addAttribute("data",result);
		
		return jsonview; 
	}
	
	//주소록 추가  > 외부인 등록 처리 
		@RequestMapping(value = "/addContact_pjd.do",method = RequestMethod.POST)
		public View addContact(Principal principal, Contact contact, Model model) {
			System.out.println("addContact()처리 컨트롤 탐");
				
			String id= principal.getName();
			System.out.println("id : "+id);
			Emp emp = projectdetailservice.selectInfoSearchEmp(id);  //사번,이름 가져가기
			
			String emp_no = emp.getEmp_no();//사번
			System.out.println("emp_no:"+emp_no);
			
			contact.setGroup_no("1");
			/*contact.setGroup_name("회사");*/
			
			System.out.println("contact.tostring() : "+contact.toString());
			int result = projectdetailservice.insertContactFromPjd(contact); //주소록 테이블에 삽입 => 현재 글번호리턴
			
			int last_result=0;

			if(result > 0){  //개인주소록 추가될때 
						
				Emp_contact emp_contact = new Emp_contact();
				emp_contact.setEmp_no(emp_no);
				emp_contact.setContact_no(String.valueOf(result));
							
				last_result=projectdetailservice.insertPrivateContact(emp_contact); //개인주소록 테이블 삽입
			}
				
			model.addAttribute("last_result",last_result);

			return jsonview;
		}
		
		
		
	// 프로젝트 상세의 상세내용 추가
	@RequestMapping(value = "/insert_pjdd.do")
	public View insertpjdd(String pjd_no, String pjdd_content){
		
		int result = 0;
		Pjdd pjdd = new Pjdd();
		pjdd.setPjd_no(pjd_no);
		pjdd.setPjdd_content(pjdd_content);
		
		result = projectdetailservice.insertPjdd(pjdd);
		
		return jsonview;
	}
	
	// 상세의 상세 테이블 갱신
	@RequestMapping(value="/updatepjddtable.do")
	public View updatepjddtable(String pjd_no, Model model){
		
		List<Pjdd> pjddlist = projectdetailservice.selectPjddList(pjd_no);
		model.addAttribute("data",pjddlist);
		return jsonview;
	}
	
	//상세의 상세 수정
	@RequestMapping(value="/update_pjdd.do")
	public View updatepjdd(String pjdd_no,String pjdd_content,String fin_check){
		
		int result = 0;
		
		result = projectdetailservice.updatePjdd(pjdd_no,pjdd_content,fin_check);
		
		return jsonview;
		
	}
	
	//상세의 진행률 업데이트
	@RequestMapping(value="/update_pjdprogress.do")
	public View updatepjdprogress(String pjd_no,String pjd_progress){
		int result = 0;
		
		result = projectdetailservice.updatePjdProgress(pjd_no,pjd_progress);
		
		if(result==1){
			result = projectdetailservice.updatePjProgress(pjd_no);
		}
		return jsonview;
	}
	
	//상세의 진행단계 업데이트
	@RequestMapping(value="/update_pjd_pjstepno.do")
	public View updatepjdpjstepno(String pjd_no,String pj_step_no){
		int result = 0;
		
		result = projectdetailservice.updatePjdPjstepno(pjd_no,pj_step_no);
		
		return jsonview;
	}
	
	//상세 내용 수정(updatePjd)
	@RequestMapping(value="/updatePjd.do")
	public View updatePjd(String pjd_no, String pjd_title, String pjd_content, String pj_step_no, String pjd_start, String pjd_end){
		int result = 0;
		System.out.println("pjd_no"+pjd_no+"pjd_title"+pjd_title+"pjd_content"+pjd_content+"pj_step_no"+pj_step_no+"pjd_start"+pjd_start+"pjd_end"+pjd_end);
		
		result = projectdetailservice.updatePjd(pjd_no, pjd_title, pjd_content,pj_step_no,pjd_start,pjd_end);
		
		return jsonview;
	}
	
	// 검색하기
	@RequestMapping(value = "/project_list.do", method = RequestMethod.POST)
		public View project_list_search(HttpServletRequest request, Principal principal, Model model) {

			System.out.println("project 검색을 시작합니다");

			// 로그인 id
			String id = principal.getName();
			System.out.println("id : " + id);
			String emp_no = commonservice.selectEmp_no(id);
			System.out.println("로그인한 사원의 emp_no : " + emp_no);

			String key = request.getParameter("selectSearch");
			String value = request.getParameter("input");
			String cg_no = request.getParameter("cg_no");

			System.out.println("cg_no : " + cg_no);

			System.out.println("검색  기준 : " + key + " // 검색 값 : " + value);

			// 목록 가져오기
			/*List<Task> list = service.searchTask(emp_no, cg_no, key, value);

			model.addAttribute("searchList", list);
*/
			return jsonview;
		}
}
