package kr.or.epm.OrganizationChartController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.OrganizationChartService;
import kr.or.epm.VO.Organization;

@Controller
public class OrganizationChartController {
	
	   @Autowired
	   private OrganizationChartService organizationchart;
	   
	   @Autowired
	   private View jsonview;

		// SideBar(aside.jsp) 조직도 > 부서인원 클릭시 구동
		@RequestMapping("/team_member.do")
		public String teammemberview(Model model) {
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
	   public View downDeptTree(String branch_name, Model model){
		  System.out.println("지점 클릭 시작함");
	      System.out.println("컨트롤러 ");
	      List<Organization> list = null;
	      list=organizationchart.selectChartdeptname(branch_name);
	      model.addAttribute("deptname", list);
	      return jsonview;
	   }
	
	   //3.업무 등록시 조직도 부서 클릭시 하위부서 출력
	   @RequestMapping("/low_deptOrgaicChart.do")
	   public View downlowDeptTree(String dept_name, Model model){
	      List<Organization> list = null;
	      list = organizationchart.selectChartlowDept(dept_name);
	      for(int i =0; i < list.size(); i++){
	         System.out.println("하위 부서 : " +list.get(i).getLow_dept_name());
	      }
	      model.addAttribute("low_dept", list);
	      return jsonview;
	   }
	   
	   //4.업무 등록시 조직도 하위 부서 클릭시 사원 정보 출력
	   @RequestMapping("/empChartMember.do")
	   public View downEmpTree(String low_dept_name, Model model){
	      System.out.println("이엠피 정보 컨트롤러");
	      List<Organization> list = null;
	      list = organizationchart.selectEmpInfo(low_dept_name);
	      for(int i =0; i < list.size(); i++){
	         System.out.println("사원정보: " +list.get(i).getEmp_name()+"/ 사번: "+list.get(i).getEmp_no());
	      }
	      model.addAttribute("emp", list);
	      return jsonview;
	   }


}


