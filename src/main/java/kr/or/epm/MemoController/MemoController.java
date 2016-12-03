package kr.or.epm.MemoController;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.epm.Service.MemoService;
import kr.or.epm.VO.Contact;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Memo;
import kr.or.epm.VO.Memocolor;
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

	
	
	
	// SideBar(aside.jsp) 개인 메모 클릭시 구동
	@RequestMapping(value="/private_memo.do", method=RequestMethod.GET)
	public String memoview(Model mv, Principal principal, String pg, String memo_no, String q,String ps) {
		System.out.println("@@@@메모 서비스 주소값 : " + memoservice.toString());
		String id = principal.getName();
		List<Memo> memolist = null;
		Memo first_memo = null;

		String emp_no = memoservice.selectMemoEmpno(id);
		if ((memo_no == null || memo_no.equals("null") || memo_no.equals(""))) {
			memo_no = memoservice.selectMaxNo(emp_no);
		}
		
		
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
		
		totalcount = memoservice.selectCount(emp_no,query);  //전체 갯수 구하는 함수
		
		if(totalcount % pagesize == 0){       
	    	pagecount = totalcount/pagesize;
        }else{
        	pagecount = (totalcount/pagesize) + 1;
        }
		
		System.out.println("@@@@@totalcount : "+totalcount+"/ pagecount:"+pagecount);
		
		
		
		try {
			first_memo = memoservice.selectMemo_detail(memo_no);
			memolist = memoservice.selectMemo(cpage, pagesize, emp_no,query);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			mv.addAttribute("list", memolist);
			mv.addAttribute("first_memo", first_memo);
			mv.addAttribute("memo_no_chk", memo_no);
			mv.addAttribute("pagecount", pagecount);
			mv.addAttribute("pg",cpage);
			mv.addAttribute("totalcount",totalcount);
			mv.addAttribute("q", query);
			mv.addAttribute("ps", pagesize);
		}
		return "memo.private_memo";
	}
	
	
	//메모를 업데이트 하는 함수
	@RequestMapping(value="/private_memo_update.do", method=RequestMethod.POST)
	public @ResponseBody void updateMemo(String update_memo_no, String memo_content,String memo_title){
		System.out.println("업데이트할 메모 번호 : " + update_memo_no);
		//Memo updatememo = new Memo();
		//updatememo.setMemo_content(memo_content);
		//updatememo.setMemo_no(update_memo_no);
		int result = 0;
		result = memoservice.updateMemo(update_memo_no, memo_content, memo_title);
		System.out.println("result : " + result);
		
	}

	
	// 메모 추가(+) 눌렀을 때 뜨는 페이지 비동기로
	@RequestMapping(value = "/memo_write.do", method = RequestMethod.GET)
	public String memowrite(Model mv) {
		List<Memocolor> color = memoservice.selectMemocolorList();	
		System.out.println(color.toString());
		mv.addAttribute("color", color);
		return "memo/memo_write";
	}
	//메모 비동기로 보여주는 함수
	@RequestMapping(value = "/private_memo_detail.do", method=RequestMethod.POST)
	public  String private_memo_detail(String memo_no, Model model){
		System.out.println("private_memo_detail() 컨트롤 탐");	
		Memo memo = memoservice.selectMemo_detail(memo_no);	
		System.out.println("memo : "+memo.toString());
		model.addAttribute("memo", memo);
		return "memo/memo_detail";
	}

	// 메모를 인서트 하는 컨트롤러
	@RequestMapping(value = "/memo_write.do", method = RequestMethod.POST)
	public String memowriteOk(Memo memo, Principal principal, Model mv) {
		System.out.println("memowriteOk 컨트롤러");
		String id = principal.getName();
		String emp_no = memoservice.selectMemoEmpno(id);
		int result = 0;
		memo.setEmp_no(emp_no);
		
		System.out.println("인서트할 내용 : " + memo.toString());
		result = memoservice.insertMemo(memo);
		System.out.println("result : " + result);
		return "redirect:private_memo.do";
	}
	
	//메모 삭제하는 컨트롤러
	@RequestMapping("/removememo.do")
	public String deletememo(String memo_no, Model mv){
		int result = 0;
		result = memoservice.deleteMemo(memo_no);
		System.out.println("result : " + result);
		return "redirect:private_memo.do";
	}
	
	

}
