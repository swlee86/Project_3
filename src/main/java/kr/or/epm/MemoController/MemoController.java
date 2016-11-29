package kr.or.epm.MemoController;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.or.epm.Service.MemoService;
import kr.or.epm.VO.Memo;
import kr.or.epm.VO.Memocolor;

@Controller
public class MemoController {

	@Autowired
	private MemoService memoservice;

	// SideBar(aside.jsp) 개인 메모 클릭시 구동
	@RequestMapping(value="/private_memo.do", method=RequestMethod.GET)
	public String memoview(Model mv, Principal principal, String memo_no) {
		System.out.println("메모 서비스 주소값 : " + memoservice.toString());
		String id = principal.getName();
		List<Memo> memolist = null;
		Memo first_memo = null;

		String emp_no = memoservice.selectMemoEmpno(id);
		if ((memo_no == null || memo_no.equals("null") || memo_no.equals(""))) {
			memo_no = memoservice.selectMaxNo(emp_no);
		}

		try {
			first_memo = memoservice.selectMemo_detail(memo_no);
			memolist = memoservice.selectMemo(emp_no);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			mv.addAttribute("list", memolist);
			mv.addAttribute("first_memo", first_memo);
			mv.addAttribute("memo_no_chk", memo_no);
		}
		return "memo.private_memo";
	}
	
	//메모를 업데이트 하는 함수
	@RequestMapping(value="/private_memo.do", method=RequestMethod.POST)
	public String updateMemo(Memo dto, String update_memo_no, String memo_content){
		System.out.println("업데이트할 메모 번호 : " + update_memo_no);
		Memo updatememo = new Memo();
		updatememo.setMemo_content(memo_content);
		updatememo.setMemo_no(update_memo_no);
		int result = 0;
		String link = null;
		try{
			result = memoservice.updateMemo(updatememo);
		}catch(Exception e){
			e.getMessage();
		}finally{
			System.out.println("업데이트할 내용 : " + updatememo);
			if(result>0){
				link="private_memo.do?memo_no="+updatememo.getMemo_no();
			}else{
				link="private_memo.do?memo_no="+updatememo.getMemo_no();
			}
		}
		return "memo.memo_redirect";
	}

	// 메모 추가(+) 눌렀을 때 뜨는 페이지
	@RequestMapping(value = "/memo_write.do", method = RequestMethod.GET)
	public String memowrite(Model mv) {
		List<Memocolor> color = null;
		try{
			color = memoservice.selectMemocolorList();
		}catch(Exception e){
			e.getMessage();
		}finally{
			System.out.println(color.toString());
			mv.addAttribute("color", color);
		}
		
		return "memo.memo_write";
	}

	// 메모를 인서트 하는 컨트롤러
	@RequestMapping(value = "/memo_write.do", method = RequestMethod.POST)
	public String memowriteOk(Memo memo, Principal principal, Model mv) {
		String id = principal.getName();
		String emp_no = memoservice.selectMemoEmpno(id);
		int result = 0;
		String msg = null;
		String link = null;
		memo.setEmp_no(emp_no);
		try {
			System.out.println("인서트할 내용 : " + memo.toString());
			result = memoservice.insertMemo(memo);
		} catch (Exception e) {
			e.getMessage();
		} finally {
			if (result>0) {
				link = "private_memo.do";
			}		
				link = "private_memo.do";
		}
		mv.addAttribute("link", link);

		return "memo.memo_redirect";
	}
	
	//메모 삭제하는 컨트롤러
	@RequestMapping("/removememo.do")
	public String deletememo(String memo_no, Model mv){
		int result = 0;
		String link=null;
		try{
			result = memoservice.deleteMemo(memo_no);
		}catch(Exception e){
			e.getMessage();
		}finally{
			if(result>0){
				link="private_memo.do";
			}else{
				link="private_memo.do";
			}
			mv.addAttribute("link", link);
		}
		return "memo.memo_redirect";
	}
	
	

}
