package com.toinfra.MemoController;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.toinfra.Service.CreateLogService;
import com.toinfra.Service.MemoService;
import com.toinfra.VO.CreateLog;
import com.toinfra.VO.Memo;
import com.toinfra.VO.Memocolor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.toinfra.Service.CreateLogService;
import com.toinfra.Service.MemoService;
import com.toinfra.VO.CreateLog;
import com.toinfra.VO.Memo;
import com.toinfra.VO.Memocolor;
/*
 * 작성자 : 이상원
 * 작성일 : 2016-11-20
 * 목  적 : 메모기능 구현 컨트롤러 
 * 
 * 수정일 : 2016-12-01
 * 작성자 : 박지은
 */

@Controller
public class MemoController {

	@Autowired
	private MemoService memoservice;
	
	@Autowired
	private CreateLogService logservice;

	//개인 메모 클릭시 구동
	@RequestMapping(value="/private_memo.do", method=RequestMethod.GET)
	public String memoview(Model mv, HttpServletRequest request, String pg, String memo_no, String q,String ps) {
		HttpSession session = request.getSession();
		String emp_no = (String)session.getAttribute("emp_no");

		List<Memo> memolist = null;
		Memo first_memo = null;
		
		int totalcount = 0;
		int cpage = 1;
		int pagecount = 0;
		int pagesize = 5;
		String query ="%%";
		
		if(pg != null && !pg.equals("")){
			cpage = Integer.parseInt(pg);
		}
		if(q != null && !q.equals("")){
			query = q;
		}
		if(ps != null && !ps.equals("")){
			pagesize = Integer.parseInt(ps);
		}
		
		totalcount = memoservice.selectCount(emp_no,query); 
		
		if(totalcount % pagesize == 0){       
	    	pagecount = totalcount/pagesize;
        }else{
        	pagecount = (totalcount/pagesize) + 1;
        }

		memolist = memoservice.selectMemo(cpage, pagesize, emp_no,query);
		
		if(memolist.size() != 0){
			first_memo = memolist.get(0);	
		}
		
		mv.addAttribute("list", memolist);
		mv.addAttribute("first_memo", first_memo);
		mv.addAttribute("pagecount", pagecount);
		mv.addAttribute("pg",cpage);
		mv.addAttribute("totalcount",totalcount);
		mv.addAttribute("q", query);
		mv.addAttribute("ps", pagesize);
		
		CreateLog log = new CreateLog();
		log.setIp((String)session.getAttribute("clientIP"));
		log.setPage(request.getRequestURI());
		log.setId((String)session.getAttribute("customerId"));
		log.setEmp_no((String)session.getAttribute("emp_no"));
		log.setResult("메모페이지_진입");
		
		logservice.BasicLog(log);
		
		return "memo.private_memo";
	}
		
	//메모를 업데이트 하는 함수
	@RequestMapping(value="/private_memo_update.do", method=RequestMethod.POST)
	public @ResponseBody void updateMemo(String update_memo_no, String memo_content,String memo_title){
		memoservice.updateMemo(update_memo_no, memo_content, memo_title);
	}
	
	// 메모 추가(+) 눌렀을 때 뜨는 페이지 비동기로
	@RequestMapping(value = "/memo_write.do", method = RequestMethod.GET)
	public String memowrite(Model mv, HttpServletRequest request) {
		HttpSession session = request.getSession();
		List<Memocolor> color = memoservice.selectMemocolorList();
		mv.addAttribute("color", color);
		
		CreateLog log = new CreateLog();
		log.setIp((String)session.getAttribute("clientIP"));
		log.setPage(request.getRequestURI());
		log.setId((String)session.getAttribute("customerId"));
		log.setEmp_no((String)session.getAttribute("emp_no"));
		log.setResult("메모작성_진입");
		
		logservice.BasicLog(log);
		
		return "memo/memo_write";
	}
	
	//메모 비동기로 보여주는 함수
	@RequestMapping(value = "/private_memo_detail.do", method=RequestMethod.POST)
	public  String private_memo_detail(String memo_no, Model model){
		Memo memo = memoservice.selectMemo_detail(memo_no);	
		model.addAttribute("memo", memo);
		return "memo/memo_detail";
	}

	// 메모를 인서트 하는 컨트롤러
	@RequestMapping(value = "/memo_write.do", method = RequestMethod.POST)
	public String memowriteOk(Memo memo, HttpServletRequest request, Model mv) {
		HttpSession session = request.getSession();
		String emp_no = (String)session.getAttribute("emp_no");
		memo.setEmp_no(emp_no);

		CreateLog log = new CreateLog();
		log.setIp((String)session.getAttribute("clientIP"));
		log.setPage(request.getRequestURI());
		log.setId((String)session.getAttribute("customerId"));
		log.setEmp_no((String)session.getAttribute("emp_no"));

		
		try{
			memoservice.insertMemo(memo);
		}catch(Exception e){
			System.err.println(e.getMessage());
			log.setResult("메모작성_실패");
			logservice.BasicLog(log);
		}
		
		
		log.setResult("메모작성_성공");
		logservice.BasicLog(log);
		
		return "redirect:private_memo.do";
	}
	
	//메모 삭제하는 컨트롤러
	@RequestMapping("/removememo.do")
	public String deletememo(String memo_no, Model mv){
		memoservice.deleteMemo(memo_no);
		return "redirect:private_memo.do";
	}
}
