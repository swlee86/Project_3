package kr.or.epm.ProjectController;

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.swing.text.View;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.epm.Service.ProjectDetailService;
import kr.or.epm.Service.ProjectService;
import kr.or.epm.Service.PushService;
import kr.or.epm.VO.Approval;
import kr.or.epm.VO.Contact;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Pj;
import kr.or.epm.VO.Pj_step;
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
 * 
 * 수정일 : 2016-11-25
 * 작성자 : 박지은
 */

@Controller
public class ProjectController {
	@Autowired
	private ProjectService projectservice;
	@Autowired
	private ProjectDetailService projectdetailservice;
	@Autowired
	private PushService pushservice;
	
	//프로젝트 승인대기함 승인 처리
	@RequestMapping(value ="/project_approve_try.do", method=RequestMethod.POST)
	public @ResponseBody Pj project_approve_try(String pj_no,String step_no, HttpServletRequest request){
		projectservice.project_approve_try(pj_no,step_no);	

		HttpSession session = request.getSession();
		int resultdata = 0;
		String empno = (String)session.getAttribute("emp_no");
		
		String taskcount = pushservice.taskCount(empno);
		String projectcount= pushservice.myprojectCount(empno);
		String taskApproval = pushservice.taskApproval(empno);
		String projectApproval = pushservice.projectApproval(empno);

		resultdata = (Integer.parseInt(taskcount))+Integer.parseInt(projectcount)+Integer.parseInt(taskApproval)+Integer.parseInt(projectApproval);	
		session.setAttribute("sessionApprovalcount", projectApproval);
		session.setAttribute("sessionpushcount", resultdata);
		
		session.setAttribute("sessionprojectcount", projectcount);
		
		System.out.println("pj_no : "+pj_no);
		Pj pj = projectservice.selectPj_detail(pj_no);
		return pj;
	}
	
	
	//프로젝트 승인대기함 페이지 이동
	@RequestMapping("/projectApprove.do")
	public String  projectApprove(Model mv, String pg, String f , String q, HttpSession session, String f2 , String q2,String app_char){

		String rec_emp_no = (String)session.getAttribute("emp_no");
		
		int totalcount = 0;
		int cpage = 1;
		int pagecount = 0;
		int pagesize = 4;
		
		String field = "emp_name";
		String query ="%%";
		
		String field2 = "emp_name";
		String query2 ="%%";
		
		if(app_char == null || app_char.equals("")){
			app_char = "1";
		}
		
		if(pg != null && !pg.equals("")){
			cpage = Integer.parseInt(pg);
		}
		if(f != null && !f.equals("")){
			field = f;
		}
		if(q != null && !q.equals("")){
			query = q;
		}
		if(f2 != null && !f2.equals("")){
			field2 = f2;
		}
		if(q2 != null && !q2.equals("")){
			query2 = q2;
		}

		totalcount = projectservice.selectApprovalCount(rec_emp_no, field, query);  //전체 갯수 구하는 함수
		
		 if(totalcount % pagesize == 0){       
		    pagecount = totalcount/pagesize;
	     }else{
	        pagecount = (totalcount/pagesize) + 1;
	      }
		 
		List<Pj> list =projectservice.selectPj_rec(cpage, pagesize, field, query, rec_emp_no);
		
		List<Pj> sendlist =projectservice.select_Send_Pj_rec(field2, query2, rec_emp_no);
		

		mv.addAttribute("field",field);
		mv.addAttribute("query",query);
		mv.addAttribute("pagecount", pagecount);
		mv.addAttribute("pg",cpage);
		mv.addAttribute("totalcount",totalcount);
		mv.addAttribute("list", list);
		mv.addAttribute("sendlist", sendlist);
		mv.addAttribute("app_char", app_char);
		
		return "project.projectApproveList";
	}

	
	//프로젝트 상세상세 페이지 추가하기
	@RequestMapping(value ="/project_detail_plus.do", method=RequestMethod.GET)
	public String  project_detail_plus(){
		return "project/projectDetailPlus";
	}
	
	//프로젝트 상세상세 처리
	@RequestMapping(value="project_detail_plus_try.do", method=RequestMethod.POST)
	public String  project_detail_plus_try(Principal principal, Pjd_Command pjd_Command, String pjd_count){
		String id= principal.getName();
		Emp emp = projectservice.selectInfoSearch(id);  //사번,이름 가져가기	

		String url = "redirect:project_list.do"; 

		List<Pjd> list = pjd_Command.getPjd();
			
			for(Pjd pjd : list){
				pjd.setEmp_no(emp.getEmp_no());
			}	

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
	public String projectMake( HttpServletRequest request, Pj pj, Model model, String hiddenEmp_no){

		HttpSession session = request.getSession();
		String emp_no = (String)session.getAttribute("emp_no");
		pj.setEmp_no(emp_no);

		model.addAttribute("pj_start", pj.getPj_start());
		model.addAttribute("pj_end", pj.getPj_end());
		model.addAttribute("hiddenEmp_no", hiddenEmp_no);
		this.pj2 = pj;
		return "project.projectDetailMakeForm";
	}
		
	//프로젝트 > 진행중인 프로젝트 클릭시 구동
	@RequestMapping("/project_list.do")
	public String projectview(Model model) {
		
		List<Pj> pjlist = null;
		pjlist = projectservice.selectPjlist_all();
	
		model.addAttribute("pjlist",pjlist);
		
		return "project.project_list";
	}
	
	//프로젝트 > 진행중인 프로젝트 클릭시 구동
	@RequestMapping("/projectDetail.do")
	public String projectdetail(Model model, String pj_no) {
		List<Pjd> pjdlist= null;
		
		pjdlist = projectdetailservice.selectPjdlist(pj_no);
		List<List<Pjd_people>> peopleList = projectdetailservice.selectPjdPeople(pjdlist);
		
		model.addAttribute("pjdlist",pjdlist);
		model.addAttribute("peopleList",peopleList);
		model.addAttribute("pj_no",pj_no);
		return "project.projects";
	}
	
	
	//프로젝트 > 전체 프로젝트 클릭시 구동
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
		return "project.projectDetailView";
	}
	

	//승인대기중인 프로젝트 제목 클릭시 
	@RequestMapping(value ="/project_approve_detailview.do", method=RequestMethod.GET)
	public String project_approve_detailview(String pj_no, Model model, String pj_emp_no){
		Pj pj = projectservice.selectPj_detail(pj_no);
		List<Pjd> list = projectservice.selectPjd_detail(pj_no);
		int listsize =  list.size();
		
		model.addAttribute("listsize", listsize);
		model.addAttribute("list", list);
		model.addAttribute("pj", pj);
		model.addAttribute("pj_write", pj_emp_no);
		return "project.projectApproveDetailView";
	}
	
	//프로젝트의 상세의 상세내용보기
	@RequestMapping("/projectdetail_detailview.do")
	public String projectdetail_detailview(Principal principal, Model model, String pjd_no){
		String id= principal.getName();
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
		
		//pj의 시작일, 종료일 데이터 가져오기
		Pj pj_date =null; 
		pj_date= projectservice.selectPjDate(pjd_no);
		
		//pj_step의 리스트
		List<Pj_step> pj_step_list =projectservice.selectPjStepList();
		
		model.addAttribute("peoplelist",peoplelist);		
		model.addAttribute("pjd",pjd);
		model.addAttribute("pjddlist",pjddlist);
		model.addAttribute("pjd_no",pjd_no);
		model.addAttribute("login_emp_no",login_emp_no);
		model.addAttribute("pj_emp_no",pj_emp_no);
		model.addAttribute("pj_step_list",pj_step_list);
		model.addAttribute("pj_date",pj_date);
		return "project.projectDetailView";
	}
	
}
