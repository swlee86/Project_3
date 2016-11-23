package kr.or.epm.Contact;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.or.epm.Service.ContactService;
import kr.or.epm.VO.C_group;
import kr.or.epm.VO.Contact;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_contact;

/*
 * 작성자 : 박지은
 * 작성일 : 2016-11-21
 * 목  적 : ContactController 컨트롤러 
 */

/*
  	//주소록 > 주소록 수정페이지 이동
	@RequestMapping("/contacts_update.do")
	public String contacts_update(){			
		return "contacts.contacts_update";
	}
	
 */
@Controller
public class ContactController {
	
	@Autowired
	private ContactService contactService; 
	
	// SideBar(aside.jsp) 주소록 클릭시 구동
	@RequestMapping(value = "/contacts.do")
	public String contacts(Principal principal, String pg , String f , String q , Model model, String tapno){
		System.out.println("contacts() 컨트롤러 탐");
		
		String id= principal.getName();
		System.out.println("id : "+id);
		Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
		
		String emp_no = emp.getEmp_no();//사번
		 
		System.out.println("----------------------------\n tapno: "+ tapno);
		
		String start = "0";
		String end = "힣";
		
		if(tapno !=null && !tapno.equals("")){
			if(tapno.equals("2")){
				start = "가";
				end = "나";
			}else if(tapno.equals("3")){
				start = "나";
				end = "다";
			}else if(tapno.equals("4")){
				start = "다";
				end = "라";
			}else if(tapno.equals("5")){
				start = "라";
				end = "마";
			}else if(tapno.equals("6")){
				start = "마";
				end = "바";
			}else if(tapno.equals("7")){
				start = "바";
				end = "사";
			}else if(tapno.equals("8")){
				start = "사";
				end = "아";
			}else if(tapno.equals("9")){
				start = "아";
				end = "자";
			}else if(tapno.equals("10")){
				start = "자";
				end = "차";
			}else if(tapno.equals("11")){
				start = "차";
				end = "카";
			}else if(tapno.equals("12")){
				start = "카";
				end = "타";
			}else if(tapno.equals("13")){
				start = "타";
				end = "파";
			}else if(tapno.equals("14")){
				start = "파";
				end = "하";
			}else if(tapno.equals("15")){
				start = "하";
				end = "힣";
			}else if(tapno.equals("16")){
				start = "A";
				end = "z";
			}else if(tapno.equals("17")){
				start = "0";
				end = "9";
			}	
		}
		
		System.out.println("start : "+start +"/  end:"+end);

		
		int totalcount = 0;
		int cpage = 1;
		int pagecount = 0;
		int pagesize = 4;
		
		String field = "name";
		String query ="%%";
		
		List<Contact> list = null;	
		
		if(pg != null && !pg.equals("")){
			cpage = Integer.parseInt(pg);
		}
		if(f != null && !f.equals("")){
			field = f;
		}
		if(q != null && !q.equals("")){
			query = q;
		}
		
		totalcount = contactService.selectCount(emp_no, field, query, start, end);  //전체 갯수 구하는 함수

		System.out.println("cpage:"+cpage+"/ field:"+field+"/ query:"+query+ "/ totalcount:"+totalcount);
		
	    if(totalcount % pagesize == 0){       
	    	pagecount = totalcount/pagesize;
        }else{
        	pagecount = (totalcount/pagesize) + 1;
        }
		
	    System.out.println("pagecount : " + pagecount);
		
		list = contactService.selectList(cpage, pagesize, field, query, emp_no,start,end);
		
		model.addAttribute("f",field);
		model.addAttribute("q",query);
		model.addAttribute("pagecount", pagecount);
		model.addAttribute("pg",cpage);
		model.addAttribute("totalcount",totalcount);
		model.addAttribute("list", list);
		model.addAttribute("tapno",tapno);
		model.addAttribute("listsize",list.size());
		
		return "contacts.contacts";
	}
	
	
	//비동기를 이용한 주소록 상세
	@RequestMapping(value = "/contact_detail.do")
	public @ResponseBody Contact contact_detail(String contact_no){
		System.out.println("contact_detail() 컨트롤 탐");	
		Contact contact = contactService.selectContact_detail(contact_no);	
		return contact;
	}
	
	
	//주소록 > 주소록 추가 페이지 이동
	@RequestMapping(value = "/enroll.do",method = RequestMethod.GET)
	public String enroll(Principal principal, Model model) {
		System.out.println("enroll() 컨트롤 탐");
		
		String id= principal.getName();
		System.out.println("id : "+id);
		Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
		
		String emp_no = emp.getEmp_no();//사번
		System.out.println("emp_no:"+emp_no);
		List<C_group> list = contactService.selectEmpGroup_list(emp_no);
		
		model.addAttribute("grouplist", list);
		//주소록 그룹 부르는 컨트롤러
		return "contacts.enroll";
	}
	
	//주소록 추가  > 외부인 등록 처리 
	@RequestMapping(value = "/enroll.do",method = RequestMethod.POST)
	public String enroll(@RequestParam("uploadfile") MultipartFile file, Principal principal, Contact contact, Model model, HttpServletRequest request) {
		System.out.println("enroll()처리 컨트롤 탐");
			
		String path = request.getRealPath("/contacts/upload/");
		System.out.println("=====> path : "+path);
		File cFile = new File(path, file.getOriginalFilename());
		
		try {
			file.transferTo(cFile);
			System.out.println("getAbsolutePath : " +cFile.getAbsolutePath());
			System.out.println("getPath : " +cFile.getPath());
		} catch (IllegalStateException e1) {
			e1.printStackTrace();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		
		System.out.println("file.getOriginalFilename() : "+ file.getOriginalFilename());
		contact.setPic(file.getOriginalFilename());


		String id= principal.getName();
		System.out.println("id : "+id);
		Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
		
		String emp_no = emp.getEmp_no();//사번
		System.out.println("emp_no:"+emp_no);
		
		System.out.println("contact.tostring() : "+contact.toString());
		
		int result = contactService.insertContact(contact); //주소록 테이블에 삽입 => 현재 글번호리턴
		

		if(result > 0){  //개인주소록 추가될때 
			
			Emp_contact emp_contact = new Emp_contact();
			emp_contact.setEmp_no(emp_no);
			emp_contact.setContact_no(String.valueOf(result));
			
			contactService.insertEmpContact(emp_contact);  //개인주소록 테이블 삽입
		}
		
		//주소록 그룹 부르는 컨트롤러
		return "redirect:contacts.do";
	}
	
	
	//주소록 추가> 사내사원 정보불러오기 
	@RequestMapping(value = "/contact_fam_insert.do", method = RequestMethod.POST)
	public @ResponseBody Emp contact_fam_insert(String emp_no){
		System.out.println("contact_fam_insert() 컨트롤 탐");	
		System.out.println("emp_no : "+ emp_no);
		
		Emp emp = contactService.selectEmpInfo(emp_no);	
		return emp;
	}
	
	
		//주소록  > 주소록 그룹 관리 페이지 이동
		@RequestMapping( value="/contacts_group.do", method = RequestMethod.GET)
		public String contacts_group(Principal principal, Model model){
			System.out.println("contacts_group() 컨트롤 탐");
			
			String id= principal.getName();
			System.out.println("id : "+id);
			Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
			
			String emp_no = emp.getEmp_no();//사번
			System.out.println("emp_no:"+emp_no);
			List<C_group> list = contactService.selectEmpGroup_list(emp_no);
			
			model.addAttribute("grouplist", list);	
			model.addAttribute("grouplistsize", list.size());
			return "contacts.contacts_group";
		}
		
		//주소록 > 주소록 그룹 추가 처리
		@RequestMapping( value="/contacts_group_insert.do", method = RequestMethod.POST)
		public String contacts_group_insert(Principal principal, String group_name, Model model){
			System.out.println("contacts_group_insert() 컨트롤 탐");
			System.out.println("group_name : "+group_name);
			
			String id= principal.getName();
			System.out.println("id : "+id);
			Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
			
			String emp_no = emp.getEmp_no();//사번
			System.out.println("emp_no:"+emp_no);
				
			String url ="redirect:contacts_group.do";
			
			try{
				url = contactService.selectGroupCheck_name(group_name, emp_no); //트랜잭션 ㄱㄱ //1:존재 ->그룹번호뽑기 /0:존재x->그룹추가 => groups에 추가 
			}catch (Exception e) {
				System.out.println("contacts_group_insert() 컨트롤러 트랜잭션 오류 : "+ e.getMessage());
			}
			
			return url;
		}
		
		//주소록 > 주소록 그룹 수정 처리
		@RequestMapping( value="/contacts_group_update.do", method = RequestMethod.POST)
		public String contacts_group_update(Principal principal, String group_name, Model model){
			System.out.println("contacts_group_update() 컨트롤 탐");
			System.out.println("group_name : "+group_name);
			
			/*String id= principal.getName();
			System.out.println("id : "+id);
			Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
			
			String emp_no = emp.getEmp_no();//사번
			System.out.println("emp_no:"+emp_no);
				
			String url ="redirect:contacts_group.do";
			
			try{
				url = contactService.selectGroupCheck_name(group_name, emp_no); //트랜잭션 ㄱㄱ //1:존재 ->그룹번호뽑기 /0:존재x->그룹추가 => groups에 추가 
			}catch (Exception e) {
				System.out.println("contacts_group_insert() 컨트롤러 트랜잭션 오류 : "+ e.getMessage());
			}
			
			return url;*/
			
			return null;
		}
}
