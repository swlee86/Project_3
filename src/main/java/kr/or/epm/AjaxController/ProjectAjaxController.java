package kr.or.epm.AjaxController;


import java.lang.reflect.Array;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.method.P;
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
import sun.print.resources.serviceui;

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
		
		String id= principal.getName();
		String emp_no = commonservice.selectEmp_no(id);
		List<Pj> result = projectservice.selectPjlist_ctg(select_ctg, emp_no);
		model.addAttribute("project", result);
		
		return jsonview; 
	}
	
	//참여자 자세히 보기(modal)
	@RequestMapping("/pjd_people.do")
	public View pjd_people(String emp_no, Model model){
			
		Pjd_people result = projectdetailservice.pjd_people(emp_no);

		model.addAttribute("data",result);
		
		return jsonview; 
	}
	
	//주소록 추가  > 외부인 등록 처리 
		@RequestMapping(value = "/addContact_pjd.do",method = RequestMethod.POST)
		public View addContact(Principal principal, Contact contact, Model model) {
				
			String id= principal.getName();
			Emp emp = projectdetailservice.selectInfoSearchEmp(id);  //사번,이름 가져가기
			
			String emp_no = emp.getEmp_no();//사번
			System.out.println("emp_no:"+emp_no);
			
			contact.setGroup_no("1");
			/*contact.setGroup_name("회사");*/
			
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
	public View updatePjd(String pjd_no, String pjd_title, String pjd_content, String pj_step_no, String pjd_start, String pjd_end, Model model){
		int result = 0;
		int result_pjdd = 1; // 0이 되면 상세의 상세가 완료되지 않는게 있기 때문에 완료로 없데이트 처리 해줄수없음

		
		if(pj_step_no.equals("4")){
			//완료선택했을때 아래의 상세의 상세가 모두 체크되어있는지 확인
			List<Pjdd> pjddlist = projectdetailservice.selectPjddList(pjd_no);
			
			if(pjddlist.size()==0){
				result = 9999; // 완료를 누르고 상세의 상세 size가 0 일때 alert창을 띄우기위해
				result_pjdd=0;
			}
			
			for(int i = 0; i< pjddlist.size() ; i++){
				if(pjddlist.get(i).getFin_check().equals("0")){ // 체크상태가 false(0)인게 있다면 완료상태로 설정할 수 없음
					result_pjdd=0;
					result = 8888;
					break;
				}
			}
			
		}
		
		if(result_pjdd==1){
			result = projectdetailservice.updatePjd(pjd_no, pjd_title, pjd_content,pj_step_no,pjd_start,pjd_end);
		}
		model.addAttribute("result", result);
		return jsonview;
	}
	
	// 검색하기
	@RequestMapping(value = "/project_search_list.do")
	public View project_list_search(HttpServletRequest request,  Model model) {


		String key = request.getParameter("selectSearch");
		String value = request.getParameter("input");



		// 목록 가져오기
		List<Pj> list = projectservice.searchPj(key,value);

		model.addAttribute("project", list);

		return jsonview;
	}
	
	//프로젝트의 진행 단계 업데이트
	@RequestMapping(value="/updatePj_step_state.do")
	public View updatePj_step_state(HttpServletRequest request, Model model){
		
		
		String pjd_no = request.getParameter("pjd_no");
		
		//pjd_no가 들어간 pj_no가져와서 pj_no에 포함된 모든 pjd의 진행상황 가져오기
		List<String> pjstepno = projectservice.selectPjstepno_Of_includePjdno(pjd_no);
		
		String pj_step_no = "2";
		int[] pjstepno_count = new int[]{0,0,0,0,0};
		//1 : 진행 , 2 : 미진행 , 3 : 보류 , 4 : 완료 , 5 : 중단
		
		for(int i = 0; i < pjstepno.size(); i++){
			int index =  Integer.parseInt(pjstepno.get(i));
			pjstepno_count[index-1]++;
		
		}
		
		//if 가져온 진행상황들 중 중단이 있는지 확인 - 중단(5)이 있으면 pj의 진행상황을 중단으로
		if(pjstepno_count[4]!=0){
			pj_step_no="5";
		}
		
		//else if 가져온 진행상황들 중 보류가 있는지 확인 - 보류(3)가 있으면 pj의 진행상황을 보류로
		else if(pjstepno_count[2]!=0){
			pj_step_no="3";
		}
		//else if 가져온 진행상황들 모두가 완료 상태이면 - pj의 진행상황을 완료로
		else if(pjstepno_count[0]==0 && pjstepno_count[1]==0 && pjstepno_count[2]==0 && pjstepno_count[4]==0 && pjstepno_count[3]!=0){
			pj_step_no="4";
		}
		//else if 가져온 진행상황들 중 진행이 있는지 확인 - 진행이 있으면 pj의 진행상황을 진행으로
		else if(pjstepno_count[0]!=0){
			pj_step_no="1";
		}
			
		//else if  else는 보류도 없고, 중단도 없고, 완료도 없고, 진행도 없을 때  - pj의 진행상황을 미진행으로
		else{
			pj_step_no="2";
		}
		
		//pj의 상태를 업데이트
		int result = projectservice.updatePjstepno(pjd_no, pj_step_no);
		
		return jsonview;
		
	}
}
