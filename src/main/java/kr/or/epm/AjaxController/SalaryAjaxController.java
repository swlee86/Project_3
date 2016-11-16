package kr.or.epm.AjaxController;
import org.springframework.beans.factory.annotation.Autowired;
/*
 *급여 페이지 ajax controller 
 * 
 * 
 * */
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.View;

@Controller
public class SalaryAjaxController {

	@Autowired
	private View jsonview;
	
	//월별 급여 조회
		@RequestMapping("/MonthlysalSearch.do")
		public View MonthlysalarySearch(String date, String option, Model model){
			System.out.println("월별 date :"+date+ "/ select: "+option );
			model.addAttribute("date", date);
			return jsonview;
		}
		//연도별 급여 조회
		@RequestMapping("/YearlysalSearch.do")
		public View YearlysalarySearch(String date, String option, Model model){
			System.out.println("연도별 date :"+date+ "/ select: "+option );
			model.addAttribute("date", date);
			return jsonview;
		}
		
		//퇴직금 조회
		@RequestMapping("/sevSearch.do")
		public View sevSearch(String select, String date, Model model){
			System.out.println("select :"+select +"/date: "+date);
			model.addAttribute("select", select);
			return jsonview;
		}
	
	
}
