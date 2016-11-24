package kr.or.epm.ProjectController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.ProjectService;
import kr.or.epm.VO.Pj;

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
	
	// SideBar(aside.jsp) 프로젝트 > 전체 프로젝트 클릭시 구동
	@RequestMapping("/projects.do")
	public String projectlistview() {
		return "project.projects";
	}
		
	// SideBar(aside.jsp) 프로젝트 > 진행중인 프로젝트 클릭시 구동
	@RequestMapping("/project_list.do")
	public String projectview(Model model) {
		
		List<Pj> pjlist = null;
		pjlist = projectservice.selectPjlist_all();
	
		model.addAttribute("pjlist",pjlist);
		
		return "project.project_list";
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
	
	//프로젝트 승인 처리 페이지
	@RequestMapping("/projectApprove.do")
	public String projectApprove(){
		return "project.projectApproveList";
	}
	
	//대기중인 프로젝트 제목 클릭시 
	@RequestMapping("/project_approve_detailview.do")
	public String project_approve_detailview(){
		return "project.projectApproveDetailView";
	}
	
}
