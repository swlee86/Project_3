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
		System.out.println("project_approve_try() 컨트롤 탐");	
		System.out.println("pj_no : "+pj_no +"/step_no:"+step_no);
		projectservice.project_approve_try(pj_no,step_no);	

		HttpSession session = request.getSession();
		int resultdata = 0;
		String empno = (String)session.getAttribute("emp_no");
		
		String taskcount = pushservice.taskCount(empno);
		//String projectcount = pushservice.myprojectCount(empno);
		String projectcount= pushservice.myprojectCount(empno);
		String taskApproval = pushservice.taskApproval(empno);
		String projectApproval = pushservice.projectApproval(empno);
		
		System.out.println("***************************:%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% projectcount : "+projectcount +"///////////"+projectApproval);
		
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
		System.out.println("projectApprove() 컨트롤 탐");	
/*		
		Emp emp2 = (Emp)session.getAttribute("Emp");
		String emp_no2 = emp2.getEmp_no();
		System.out.println("session으로 사번이 뽑히냐요????????????????? : "+emp_no2);
		*/
		String rec_emp_no = (String)session.getAttribute("emp_no");
		
		System.out.println(f2+"/"+q2+"/"+app_char);
		System.out.println("session으로 사번이 뽑히냐요????????????????? : "+rec_emp_no);
		
/*		String id= principal.getName();
		System.out.println("@id : "+id);
		Emp emp = projectservice.selectInfoSearch(id); 
		
		String rec_emp_no = emp.getEmp_no();//로그인사번
		System.out.println("rec_emp_no : "+rec_emp_no);*/
		
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
		System.out.println("cpage:"+cpage+"/ field:"+field+"/ query:"+query+ "/ totalcount:"+totalcount);
		
		 if(totalcount % pagesize == 0){       
		    pagecount = totalcount/pagesize;
	     }else{
	        pagecount = (totalcount/pagesize) + 1;
	      }
		 
		 System.out.println("pagecount : " + pagecount);
		 
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
			
			//System.out.println("pj : "+pj2.toString());
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
	public String projectMake(Principal principal, Pj pj, Model model, String hiddenEmp_no){
		System.out.println("projectMake 작성 컨트롤러 탐");
		System.out.println("@pj tostirng: "+pj.toString());
		String id= principal.getName();
		System.out.println("id : "+id);
		Emp emp = projectservice.selectInfoSearch(id);  //사번,이름 가져가기	
		
		pj.setEmp_no(emp.getEmp_no());
		
		//model.addAttribute("pj", pj);
		model.addAttribute("pj_start", pj.getPj_start());
		model.addAttribute("pj_end", pj.getPj_end());
		model.addAttribute("hiddenEmp_no", hiddenEmp_no);
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
		model.addAttribute("pj_no",pj_no);
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
	

	//승인대기중인 프로젝트 제목 클릭시 
	@RequestMapping(value ="/project_approve_detailview.do", method=RequestMethod.GET)
	public String project_approve_detailview(String pj_no, Model model, String pj_emp_no){
		System.out.println("pj_no : "+pj_no);
		Pj pj = projectservice.selectPj_detail(pj_no);
		List<Pjd> list = projectservice.selectPjd_detail(pj_no);
		System.out.println("list 사이즈 : " + list.size());
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
