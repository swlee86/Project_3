package kr.or.epm.AdminController;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.SalesService;
import kr.or.epm.VO.Sales;

/*
 * 작성자 : 이상원
 * 작성일 : 2016-11-17
 * 목  적 : 관리자 > 매출 Controller 
 */

@Controller
public class SalesController {

	@Autowired
	private SalesService salesService;
	
	
	
	//매출 등록 페이지 이동
	@RequestMapping(value="/adminSales.do", method=RequestMethod.GET)
	public String salesInfo(){
		return "admin.adminSales";
	}
	
	//매출 등록 페이지에서 등록 누르면 작동하는 함수
	@RequestMapping(value="/adminSales.do", method=RequestMethod.POST)
	public String insertSalesInfo(Sales sales, Model mv){
		int result = 0;
		String msg = null;
		String link = null;
		try{
			result = salesService.insertSalesInfo(sales);
		}catch(Exception e){
			e.getMessage();
		}finally{
			if(result>0){
				msg="매출 입력에 성공하였습니다";
				link="adminSalesList.do";
			}else{
				msg="매출 입력에 실패하였습니다.";
				link="adminSales.do";
			}
		}
		mv.addAttribute("msg", msg);
		mv.addAttribute("link", link);
		return "admin/salesRedirect";
	}
	
	//매출 목록 페이지
	@RequestMapping("/adminSalesList.do")
	public String salesList(Model mv){
		List<Sales> list = null;
		try{
			list = salesService.selectSalesInfo();			
		}catch(Exception e){
			e.getMessage();
		}finally{
			mv.addAttribute("list", list);
		}
		return "admin.adminSalesList";
	}
	
	
	
}
