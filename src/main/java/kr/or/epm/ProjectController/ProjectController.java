package kr.or.epm.ProjectController;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/*
 * 작성일 : 2016-11-16
 * 작성자 : 박성준
 * 사용 목적 : 프로젝트 관련 프로젝트 
 */

@Controller
public class ProjectController {
	
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
