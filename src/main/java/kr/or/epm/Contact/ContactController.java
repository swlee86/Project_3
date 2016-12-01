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
	public String contacts(Principal principal, String pg , String f , String q , Model model, String tapno, String group){
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
		
		String group_result = null;
		
		if(group == null || group.equals("")){
			group_result = group;
			group = " like '%%' ";
		}else{
			group_result = group;
			group = " = '"+group+"' ";
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
		
		totalcount = contactService.selectCount(emp_no, field, query, start, end, group);  //전체 갯수 구하는 함수

		System.out.println("cpage:"+cpage+"/ field:"+field+"/ query:"+query+ "/ totalcount:"+totalcount);
		
	    if(totalcount % pagesize == 0){       
	    	pagecount = totalcount/pagesize;
        }else{
        	pagecount = (totalcount/pagesize) + 1;
        }
		
	    System.out.println("pagecount : " + pagecount);
		
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
		System.out.println("contact.empimg : " + contact.getEmpimg());
		System.out.println("contact.tostirng() : "+contact.toString());
		System.out.println("contact.getEmpimg() null아니지?(사내):"+(contact.getEmpimg() != null) +"/ null 이니?(외부):"+(contact.getEmpimg() == null)+"공백이란 같아?:"+(contact.getEmpimg().equals(""))+" 길이:"+(contact.getEmpimg().length()));
		
		
		String id= principal.getName();
		System.out.println("id : "+id);
		Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
		
		String emp_no = emp.getEmp_no();//사번
		System.out.println("emp_no:"+emp_no);
		
		
		String path = request.getRealPath("/img/upload/");
		System.out.println("=====> path : "+path);
		File cFile = new File(path, file.getOriginalFilename()+"_"+emp_no+".png");
		
		
		System.out.println("@@@file.getOriginalFilename()_번호 :"+ file.getOriginalFilename()+"_"+emp_no+".png");
		contact.setPic(file.getOriginalFilename()+"_"+emp_no+".png");
		
		if(!contact.getEmpimg().equals("")){
			System.out.println("if문 탐 / 사내 정보사진");
			contact.setPic(contact.getEmpimg());
		}else if(contact.getEmpimg().equals("")){
			System.out.println("if문 안탐 / 외부사진");			
			try {
				file.transferTo(cFile);
				System.out.println("getAbsolutePath : " +cFile.getAbsolutePath());
				System.out.println("getPath : " +cFile.getPath());
			} catch (IllegalStateException e1) {
				e1.printStackTrace();
			} catch (IOException e1) {
				e1.printStackTrace();
			}	
		}

		System.out.println("@@@contact.getpic() : " + contact.getPic());
		
		System.out.println("@@@@contact.tostring() : "+contact.toString());
		
		int result = contactService.insertContact(contact); //주소록 테이블에 삽입 => 현재 글번호리턴
		

		if(result > 0){  //개인주소록 추가될때 
			System.out.println("최고글번호 :" + result);
			Emp_contact emp_contact = new Emp_contact();
			emp_contact.setEmp_no(emp_no);
			emp_contact.setContact_no(String.valueOf(result));
			emp_contact.setGroups(contact.getGroup_no()); //추가
			System.out.println("@emp_contact : " + emp_contact.getGroups());
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
			
			String url = null;
			int result = contactService.selectContact_count(emp_no);
			System.out.println("가지고 있는 주소록 수 : "+result);
			
			if(result > 0){
				List<C_group> list = contactService.selectEmpGroup_list(emp_no);
				model.addAttribute("grouplist", list);	
				model.addAttribute("grouplistsize", list.size());
				url="contacts.contacts_group";
			}else{
				System.out.println("주소록 가지는 사람이 없어서 안되!!");
				url="redirect:contacts.do";
			}
			
			return url;
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
		public String contacts_group_update(Principal principal, String group_name, String pre_group_no, Model model){
			System.out.println("contacts_group_update() 컨트롤 탐");
			System.out.println("group_name : "+group_name + " pre_group_no : "+pre_group_no);
			
			String id= principal.getName();
			System.out.println("id : "+id);
			Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
			
			String emp_no = emp.getEmp_no();//사번
			System.out.println("emp_no:"+emp_no);	
			
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
		public String contacts_group_delete(Principal principal, String group_no, Model model){
			System.out.println("contacts_group_delete() 컨트롤 탐");
			System.out.println("삭제할 group_no : "+group_no );
			
			String id= principal.getName();
			System.out.println("id : "+id);
			Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
			
			String emp_no = emp.getEmp_no();//사번
			System.out.println("emp_no:"+emp_no);	
			
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
		public String contacts_delete(Principal principal, String contact_no, Model model){
			System.out.println("contacts_delete() 컨트롤 탐");
			System.out.println("@삭제할 contact_no : "+contact_no );
			
			String id= principal.getName();
			System.out.println("id : "+id);
			Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
			
			String emp_no = emp.getEmp_no();//사번
			System.out.println("emp_no:"+emp_no);	
			
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
		public String contacts_update(Principal principal, String contact_no, Model model){
			System.out.println("contacts_update 컨트롤탐");
			System.out.println("contact_no : "+contact_no);			
			
			Contact contact = contactService.selectContact_detail(contact_no);
			
			String id= principal.getName();
			System.out.println("id : "+id);
			Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
			
			String emp_no = emp.getEmp_no();//사번
			System.out.println("emp_no:"+emp_no);
			List<C_group> list = contactService.selectEmpGroup_list(emp_no);
			
			model.addAttribute("contact",contact);
			model.addAttribute("grouplist", list);
			return "contacts.contacts_update";
		}
		
		//주소록 > 주소록 수정 처리
		@RequestMapping( value="/contacts_update.do", method = RequestMethod.POST)
		public String contacts_update(@RequestParam("uploadfile") MultipartFile file,Principal principal, Contact contact, Model model, HttpServletRequest request){
			System.out.println("contacts_update 처리 컨트롤 탐");
			System.out.println("contact.empimg : " + contact.getEmpimg());
			System.out.println("contact.tostirng() : "+contact.toString());
			System.out.println("contact.getEmpimg() null아니지?(사내):"+(contact.getEmpimg() != null) +"/ null 이니?(외부):"+(contact.getEmpimg() == null)+"공백이란 같아?:"+(contact.getEmpimg().equals(""))+" 길이:"+(contact.getEmpimg().length()));
			
			
			String id= principal.getName();
			System.out.println("id : "+id);
			Emp emp = contactService.selectInfoSearch(id);  //사번,이름 가져가기
			
			String emp_no = emp.getEmp_no();//사번
			System.out.println("emp_no:"+emp_no);
			
			
			String path = request.getRealPath("/img/upload/");
			System.out.println("=====> path : "+path);
			File cFile = new File(path, file.getOriginalFilename()+"_"+emp_no+".png");
			System.out.println("@@@file.getOriginalFilename()_번호 :"+ file.getOriginalFilename()+"_"+emp_no+".png");
			contact.setPic(file.getOriginalFilename()+"_"+emp_no+".png");
			
	
			
			if(!contact.getEmpimg().equals("")){
				System.out.println("if문 탐 / 사내 정보사진");
				contact.setPic(contact.getEmpimg());
			}else if(contact.getEmpimg().equals("")){
				System.out.println("if문 안탐 / 외부사진");			
				try {
					file.transferTo(cFile);
					System.out.println("getAbsolutePath : " +cFile.getAbsolutePath());
					System.out.println("getPath : " +cFile.getPath());
				} catch (IllegalStateException e1) {
					e1.printStackTrace();
				} catch (IOException e1) {
					e1.printStackTrace();
				}	
			}

			System.out.println("@@@contact.getpic() : " + contact.getPic());
			
			System.out.println("@@@@contact.tostring() : "+contact.toString());
			
			int result = contactService.updateContact(contact); 
			System.out.println("결과 : "+result);
			
			return "redirect:contacts.do";
		}
		
		

}
