package kr.or.epm.AdminController;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-14
 * 목  적 : 관리자 전용 컨트롤러 
 */

@Controller
public class AdminController {

	//관리자 개발.
	@RequestMapping(value="/adminDepart_depart.do",method=RequestMethod.GET)
	@ResponseBody
	public List<TestAdminDTO> departMent(String depart){
		System.out.println("넘어온 부서이름 : "+depart);
		List<TestAdminDTO> list = new ArrayList<TestAdminDTO>();
		list.add(new TestAdminDTO(depart, "20"));
		list.add(new TestAdminDTO("박성준", "28"));
		list.add(new TestAdminDTO("테스트", "25"));
		return list;
	}
	
	//사원 등록 페이지
	@RequestMapping("/adminMakeMember.do")
	public String makeNewMember(){
		return "admin.adminNewMember";
	}
	
	//직위 관리 페이지
	@RequestMapping("/adminGrade.do")
	public String adminGrade(){
		return "admin.adminGradeView";
	}
	
	//시간 정보 관리 페이지 이동
	@RequestMapping("/adminTimeInfo.do")
	public String timeInfo(){
		return "admin.adminTimeInfo";
	}
	//매출 관리 페이지 이동
	@RequestMapping("/adminSales.do")
	public String salesInfo(){
		return "admin.adminSales";
	}
	
}
