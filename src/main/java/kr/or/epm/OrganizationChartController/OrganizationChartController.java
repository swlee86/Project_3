package kr.or.epm.OrganizationChartController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.OrganizationChartService;
import kr.or.epm.VO.Contact;
import kr.or.epm.VO.Emp_contact;
import kr.or.epm.VO.Organization;

/*
 * 작성자 : 이상원
 * 작성일 : 2016-11-22
 * 목   적 : 조직도 관련 컨트롤러
 */

@Controller
public class OrganizationChartController {
	
	   @Autowired
	   private OrganizationChartService organizationchart;
	   
	   @Autowired
	   private View jsonview;

		// SideBar(aside.jsp) 조직도 > 부서인원 클릭시 구동
		@RequestMapping("/team_member.do")
		public String teammemberview(Model model) {
			//최초에 모든 사원정보를 불러와서 modal 창 id를 구성시킴
			List<Organization> elist = null;
			try{
				elist = organizationchart.selectEmpInfoAll();				
			}catch(Exception e){
				e.getMessage();
			}finally{
				model.addAttribute("elist", elist);
			}
			return "organization_chart.team_member";
		}
		
	   
	   //1.업무 등록시 조직도 modal에 사용
	   @RequestMapping("/oranicChartFirst.do")
	   public View deptTree(Model model){
	      List<Organization> list = null;
	      list = organizationchart.selectChartDept();
	      model.addAttribute("dept", list);
	      return jsonview;
	   }
	   
		
	   //2.업무 등록시 조직도 지점 클릭시 부서 띄워줘야함
	   @RequestMapping(value="/deptOrganicChart.do", method=RequestMethod.GET)
	   public View downDeptTree(String branch_no, Model model){
	      List<Organization> list = null;
	      list=organizationchart.selectChartdeptname(branch_no);
	      model.addAttribute("deptname", list);
	      return jsonview;
	   }
	
	   //3.업무 등록시 조직도 부서 클릭시 하위부서 출력
	   @RequestMapping("/low_deptOrgaicChart.do")
	   public View downlowDeptTree(String dept_no, Model model){
	      List<Organization> list = null;
	      list = organizationchart.selectChartlowDept(dept_no);
	      model.addAttribute("low_dept", list);
	      return jsonview;
	   }
	   
	   //4.업무 등록시 조직도 하위 부서 클릭시 사원 정보 출력
	   @RequestMapping("/empChartMember.do")
	   public View downEmpTree(String low_dept_no, Model model){
	      List<Organization> list = null;
	      list = organizationchart.selectEmpInfo(low_dept_no);
	      String msg=null;
	      if(list.size()==0){
	    	  msg="해당 부서에서 조회된 사원 데이터가 없습니다.";
	    
	      }
	      //하위부서 대표 뽑기
	      Organization master = organizationchart.selectEmpMaster(low_dept_no);
	      
	      model.addAttribute("master", master);
	      model.addAttribute("emp", list);
	      model.addAttribute("count", list.size());
	      model.addAttribute("msg", msg);
	      return jsonview;
	   }

	   
		//주소록 추가  > 외부인 등록 처리 
		@RequestMapping(value = "/addContact.do",method = RequestMethod.POST)
		public String addContact(Contact contact, Model model,HttpServletRequest request) {

			HttpSession session = request.getSession();
			String emp_no = (String) session.getAttribute("emp_no");
			
			contact.setGroup_no("1");

			int result = organizationchart.insertContactFromOrganization(contact); //주소록 테이블에 삽입 => 현재 글번호리턴

			if(result > 0){  //개인주소록 추가될때 
				Emp_contact emp_contact = new Emp_contact();
				emp_contact.setEmp_no(emp_no);
				emp_contact.setContact_no(String.valueOf(result));				
				organizationchart.insertPrivateContact(emp_contact); //개인주소록 테이블 삽입
			}		
			return "organization_chart.team_member";
		}

}


