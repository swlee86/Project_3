package kr.or.epm.Contact;

import java.io.File;
import java.io.IOException;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.ContactService;
import kr.or.epm.VO.C_group;
import kr.or.epm.VO.Contact;
import kr.or.epm.VO.Emp;
import kr.or.epm.VO.Emp_contact;

/*
 * 작성자 : 박지은
 * 작성일 : 2016-11-21
 * 목  적 : 주소록 기능을 위한 컨트롤러 
 */


@Controller
public class ContactController {
	
	@Autowired
	private ContactService contactService; 
	@Autowired
	private View jsonview;
	
	//주소록 사원 등록시 검색해서 부르는 함수
	@RequestMapping(value = "/contact_insert_search.do", method=RequestMethod.POST)
	public View  contact_insert_search(Principal principal, String field,String query, Model model){
		String id= principal.getName();
		List<Emp>  emp = contactService.contact_insert_search(field,query,id);	
		model.addAttribute("emp", emp);
		return jsonview;
	}
	
	//주소록 클릭시 이동하는 함수
	@RequestMapping(value = "/contacts.do")
	public String contacts(HttpServletRequest request, String pg , String f , String q , Model model, String tapno, String group){
		HttpSession session = request.getSession();
		String emp_no = (String)session.getAttribute("emp_no");
		
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
		
		String group_result = null;
		
		if(group == null || group.equals("")){
			group_result = group;
			group = " like '%%' ";
		}else{
			group_result = group;
			group = " = '"+group+"' ";
		}
	
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
		
		totalcount = contactService.selectCount(emp_no, field, query, start, end, group);  

	    if(totalcount % pagesize == 0){       
	    	pagecount = totalcount/pagesize;
        }else{
        	pagecount = (totalcount/pagesize) + 1;
        }
		
		list = contactService.selectList(cpage, pagesize, field, query, emp_no,start,end, group);
		
		//주소록 그룹
		List<C_group> grouplist = contactService.selectEmpGroup_list(emp_no);
		
		model.addAttribute("grouplist", grouplist);	
		model.addAttribute("grouplistsize", grouplist.size());
		model.addAttribute("group",group_result);
		
		model.addAttribute("field",field);
		model.addAttribute("query",query);
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
		Contact contact = contactService.selectContact_detail(contact_no);	
		return contact;
	}

	//주소록 > 주소록 추가 페이지 이동
	@RequestMapping(value = "/enroll.do",method = RequestMethod.GET)
	public String enroll(HttpServletRequest request, Model model) {
		HttpSession session = request.getSession();
		String emp_no = (String)session.getAttribute("emp_no");
		List<C_group> list = contactService.selectEmpGroup_list(emp_no);
		
		model.addAttribute("grouplist", list);
		return "contacts.enroll";
	}
	
	//주소록 추가  > 외부인 등록 처리 
	@RequestMapping(value = "/enroll.do",method = RequestMethod.POST)
	public String enroll(@RequestParam("uploadfile") MultipartFile file, HttpServletRequest request, Contact contact, Model model) {	
		HttpSession session = request.getSession();
		String emp_no = (String) session.getAttribute("emp_no");

		String path = request.getRealPath("/img/upload/");
		File cFile = new File(path, file.getOriginalFilename()+"_"+emp_no+".png");

		contact.setPic(file.getOriginalFilename()+"_"+emp_no+".png");
		
		if(!contact.getEmpimg().equals("")){
			contact.setPic(contact.getEmpimg());
		}else if(contact.getEmpimg().equals("")){		
			try {
				file.transferTo(cFile);
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}	
		}
		
		int result = contactService.insertContact(contact); //주소록 테이블에 삽입 => 현재 글번호리턴
		
		if(result > 0){  //개인주소록 추가될때 
			Emp_contact emp_contact = new Emp_contact();
			emp_contact.setEmp_no(emp_no);
			emp_contact.setContact_no(String.valueOf(result));
			emp_contact.setGroups(contact.getGroup_no()); //추가
			contactService.insertEmpContact(emp_contact);  //개인주소록 테이블 삽입
		}

		return "redirect:contacts.do";
	}
	
	//주소록 추가> 사내사원 정보불러오기 
	@RequestMapping(value = "/contact_fam_insert.do", method = RequestMethod.POST)
	public @ResponseBody Emp contact_fam_insert(String emp_no){
		Emp emp = contactService.selectEmpInfo(emp_no);	
		return emp;
	}
		
	//주소록  > 주소록 그룹 관리 페이지 이동
	@RequestMapping( value="/contacts_group.do", method = RequestMethod.GET)
	public String contacts_group(HttpServletRequest request, Model model){
		HttpSession session = request.getSession();
		String emp_no = (String) session.getAttribute("emp_no");

		String url = null;
		int result = contactService.selectContact_count(emp_no);

		if(result > 0){
			List<C_group> list = contactService.selectEmpGroup_list(emp_no);
			model.addAttribute("grouplist", list);	
			model.addAttribute("grouplistsize", list.size());
			url="contacts.contacts_group";
		}else{
			url="redirect:contacts.do";
		}	
		
		return url;
	}
		
		//주소록 > 주소록 그룹 추가 처리
		@RequestMapping( value="/contacts_group_insert.do", method = RequestMethod.POST)
		public String contacts_group_insert(HttpServletRequest request, String group_name, Model model){
			HttpSession session = request.getSession();
			String emp_no = (String)session.getAttribute("emp_no");
			String url ="redirect:contacts_group.do";
			
			try{
				url = contactService.selectGroupCheck_name(group_name, emp_no); //트랜잭션  (1:존재 ->그룹번호뽑기 /0:존재x->그룹추가 => groups에 추가 )
			}catch (Exception e) {
				System.out.println("contacts_group_insert() 컨트롤러 트랜잭션 오류 : "+ e.getMessage());
			}
			
			return url;
		}
		
		//주소록 > 주소록 그룹 수정 처리
		@RequestMapping( value="/contacts_group_update.do", method = RequestMethod.POST)
		public String contacts_group_update(HttpServletRequest request, String group_name, String pre_group_no, Model model){

			HttpSession session = request.getSession();
			String emp_no = (String) session.getAttribute("emp_no");		
			String url ="redirect:contacts_group.do";
			
			try{
				url = contactService.selectGroupCheck_name(group_name, emp_no, pre_group_no); 
			}catch (Exception e) {
				System.out.println("contacts_group_update() 컨트롤러 트랜잭션 오류 : "+ e.getMessage());
			}
			
			return url;
		}
		
		//주소록 > 주소 그룹 삭제 처리
		@RequestMapping( value="/contacts_group_delete.do", method = RequestMethod.GET)
		public String contacts_group_delete(HttpServletRequest request, String group_no, Model model){
			HttpSession session = request.getSession();	
			String emp_no = (String) session.getAttribute("emp_no");	
			String url ="redirect:contacts_group.do";
			
			try{
				url = contactService.updateGroups_delete_change(emp_no, group_no);
			}catch (Exception e) {
				System.out.println("contacts_group_delete() 컨트롤러 트랜잭션 오류 : "+ e.getMessage());
			}
			
			return url;
		}
		
		//주소록 > 주소록 정보 삭제 
		@RequestMapping( value="/contacts_delete.do")
		public String contacts_delete(HttpServletRequest request, String contact_no, Model model){	
			HttpSession session = request.getSession();
			String emp_no = (String)session.getAttribute("emp_no");	
			String url ="redirect:contacts.do";
			
			try{
				url = contactService.deleteEmpContact(contact_no, emp_no);
			}catch (Exception e) {
				System.out.println("contacts_delete() 컨트롤러 트랜잭션 오류 : "+ e.getMessage());
			}
			
			return url;
		}
		
		//주소록 > 주소록 수정 페이지이동
		@RequestMapping( value="/contacts_update.do", method = RequestMethod.GET)
		public String contacts_update(HttpServletRequest request, String contact_no, Model model){
			HttpSession session = request.getSession();
			String emp_no = (String)session.getAttribute("emp_no");
			Contact contact = contactService.selectContact_detail(contact_no);

			List<C_group> list = contactService.selectEmpGroup_list(emp_no);
			
			model.addAttribute("contact",contact);
			model.addAttribute("grouplist", list);
			return "contacts.contacts_update";
		}
		
		//주소록 > 주소록 수정 처리
		@RequestMapping( value="/contacts_update.do", method = RequestMethod.POST)
		public String contacts_update(@RequestParam("uploadfile") MultipartFile file,HttpServletRequest request, Contact contact, Model model){
			HttpSession session = request.getSession();
			String emp_no = (String)session.getAttribute("emp_no");
	
			String path = request.getRealPath("/img/upload/");
			File cFile = new File(path, file.getOriginalFilename()+"_"+emp_no+".png");	
			contact.setPic(file.getOriginalFilename()+"_"+emp_no+".png");

			if(!contact.getEmpimg().equals("")){
				contact.setPic(contact.getEmpimg());
			}else if(contact.getEmpimg().equals("")){		
				try {
					file.transferTo(cFile);
				} catch (IllegalStateException e1) {
					e1.printStackTrace();
				} catch (IOException e1) {
					e1.printStackTrace();
				}	
			}
			
			contactService.updateContact(contact); 
			
			return "redirect:contacts.do";
		}
}
