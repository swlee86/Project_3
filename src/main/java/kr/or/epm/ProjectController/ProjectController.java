package kr.or.epm.ProjectController;

import java.security.Principal;
import java.util.List;

import javax.swing.text.View;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.epm.Service.ProjectDetailService;
import kr.or.epm.Service.ProjectService;
import kr.or.epm.VO.Contact;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Pjd;
import kr.or.epm.VO.Pjd_Command;
import kr.or.epm.VO.Pjd_people;
import kr.or.epm.VO.Pjdd;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 박성준
 * 사용 목적 : 프로젝트 관련 프로젝트 
 * 
 * 수정일 : 2016-11-23
 * 작성자 : 김주희
 */

@Controller
public class ProjectController {
	@Autowired
	private ProjectService projectservice;
	@Autowired
	private ProjectDetailService projectdetailservice;
	
	//프로젝트 승인대기함 페이지 이동
	@RequestMapping("/projectApprove.do")
	public String  projectApprove(Model mv, Principal principal, String pg, String f , String q ){
		System.out.println("projectApprove() 컨트롤 탐");	
		
		String id= principal.getName();
		System.out.println("id : "+id);
		Emp emp = projectservice.selectInfoSearch(id); 
		
		String emp_no = emp.getEmp_no();//사번
		
		int totalcount = 0;
		int cpage = 1;
		int pagecount = 0;
		int pagesize = 4;
		
		
		String field = "emp_no";
		String query ="%%";
		
		
		if(pg != null && !pg.equals("")){
			cpage = Integer.parseInt(pg);
		}
		if(f != null && !f.equals("")){
			field = f;
		}
		if(q != null && !q.equals("")){
			query = q;
		}
		
		
		totalcount = projectservice.selectApprovalCount(emp_no, field, query);  //전체 갯수 구하는 함수
		System.out.println("cpage:"+cpage+"/ field:"+field+"/ query:"+query+ "/ totalcount:"+totalcount);
		
		 if(totalcount % pagesize == 0){       
		    pagecount = totalcount/pagesize;
	     }else{
	        pagecount = (totalcount/pagesize) + 1;
	      }
		 
		 System.out.println("pagecount : " + pagecount);
		 
		 //projectservice.selectPj_rec(cpage, pagesize, field, query, emp_no);
		 
		 //mv.addAttribute(arg0, arg1);
		 
		return "project.projectApproveList";
	}

	
	//프로젝트 상세상세 페이지 추가하기
	@RequestMapping("/project_detail_plus.do")
	public String  project_detail_plus(){
		System.out.println("project_detail_plus() 컨트롤 탐");	
		return "project/projectDetailPlus";
	}
	
	//프로젝트 상세상세 처리
	@RequestMapping(value="project_detail_plus_try.do", method=RequestMethod.POST)
	public String  project_detail_plus_try(Principal principal, Pjd_Command pjd_Command, String pjd_count){
		System.out.println("project_detail_plus_try() 컨트롤 탐");
		System.out.println("pjd_Command : " + pjd_Command.toString());
		System.out.println("pjd_Command : " + pjd_Command.getPjd());
		
		String id= principal.getName();
		System.out.println("id : "+id);
		Emp emp = projectservice.selectInfoSearch(id);  //사번,이름 가져가기	
		
		
		String url = "redirect:project_list.do"; 
		List<Pjd> list = pjd_Command.getPjd();
			for(Pjd pjd : list){
				pjd.setEmp_no(emp.getEmp_no());
				System.out.println("시작일:"+pjd.getPjd_start()+"/종료일:"+ pjd.getPjd_end()+"/제목:" + pjd.getPjd_title()+"/보낸사람 사번" + pjd.getEmp_no()+"/받는사람 사번 :"+pjd.getRec_emp_no()+"/내용:" + pjd.getPjd_content());
				String[] rec_people = pjd.getRec_emp_no().split(",");
				System.out.println("선택된 참여자 인원 : " + rec_people.length);
			}	
			
			System.out.println("pj : "+pj2.toString());
			try{
				url = projectservice.insertPj(pj2,pjd_Command); 
			}catch (Exception e) {
				System.out.println("project_detail_plus_try() 컨트롤러 트랜잭션 오류 : "+ e.getMessage());
			}finally{
				pj2 = null;
			}
			
		return url;
	}	
		
	Pj pj2 = new Pj();
	
	//프로젝트 생성하기
	@RequestMapping(value="/projectMake.do", method=RequestMethod.POST)
	public String projectMake(Principal principal, Pj pj, Model model){
		System.out.println("projectMake 작성 컨트롤러 탐");
		System.out.println("@pj tostirng: "+pj.toString());
		
		String id= principal.getName();
		System.out.println("id : "+id);
		Emp emp = projectservice.selectInfoSearch(id);  //사번,이름 가져가기	
		
		pj.setEmp_no(emp.getEmp_no());
		
		//model.addAttribute("pj", pj);
		this.pj2 = pj;
		return "project.projectDetailMakeForm";
	}
		
	// SideBar(aside.jsp) 프로젝트 > 진행중인 프로젝트 클릭시 구동
	@RequestMapping("/project_list.do")
	public String projectview(Model model) {
		
		List<Pj> pjlist = null;
		pjlist = projectservice.selectPjlist_all();
	
		model.addAttribute("pjlist",pjlist);
		
		return "project.project_list";
	}
	
	// SideBar(aside.jsp) 프로젝트 > 진행중인 프로젝트 클릭시 구동
	@RequestMapping("/projectDetail.do")
	public String projectdetail(Model model, String pj_no) {
		
		System.out.println("들어온 pj_no : " + pj_no);
		
		List<Pjd> pjdlist= null;
		
		pjdlist = projectdetailservice.selectPjdlist(pj_no);
		List<List<Pjd_people>> peopleList = projectdetailservice.selectPjdPeople(pjdlist);
		
		model.addAttribute("pjdlist",pjdlist);
		model.addAttribute("peopleList",peopleList);
		
		return "project.projects";
	}
	
	
	
	
	// SideBar(aside.jsp) 프로젝트 > 전체 프로젝트 클릭시 구동
	@RequestMapping("/projects.do")
	public String projectlistview() {
		return "project.projects";
	}
		

		
	//프로젝트 생성하기
	@RequestMapping(value="/projectMake.do", method=RequestMethod.GET)
	public String projectMake(){
		return "project.projectMakeForm";
	}
	
	//상세보기 버튼 클릭시 사용됨.
	@RequestMapping(value="/projectDetailCheckView.do", method=RequestMethod.GET)
	public String projectDetail(String hidden){
		System.out.println("넘어온 히든 값 : "+hidden);
		return "project.projectDetailView";
	}
	

	//대기중인 프로젝트 제목 클릭시 
	@RequestMapping("/project_approve_detailview.do")
	public String project_approve_detailview(){
		return "project.projectApproveDetailView";
	}
	
	//프로젝트의 상세의 상세내용보기
	@RequestMapping("/projectdetail_detailview.do")
	public String projectdetail_detailview(Principal principal, Model model, String pjd_no){
		System.out.println("들어온pjd_no : " + pjd_no);
		
		String id= principal.getName();
		System.out.println("id : "+id);
		Emp emp = projectservice.selectInfoSearch(id);  //사번,이름 가져가기	
		String login_emp_no = emp.getEmp_no();
		
		//pjd의 데이터 가져오기
		Pjd pjd= null;
		pjd = projectdetailservice.selectPjd_detail(pjd_no);
		
		//pjd의 리스트
		List<Pjd_people> peoplelist = null;
		peoplelist = projectdetailservice.selectPjdPeopleList(pjd_no);
		
		//pjdd의 리스트
		List<Pjdd> pjddlist = null;
		pjddlist = projectdetailservice.selectPjddList(pjd_no);
		
		String pj_emp_no = projectservice.selectPjwriteempno(pjd_no);
		model.addAttribute("peoplelist",peoplelist);		
		model.addAttribute("pjd",pjd);
		model.addAttribute("pjddlist",pjddlist);
		model.addAttribute("pjd_no",pjd_no);
		model.addAttribute("login_emp_no",login_emp_no);
		model.addAttribute("pj_emp_no",pj_emp_no);
		
		return "project.projectDetailView";
	}
	
	
	
}
