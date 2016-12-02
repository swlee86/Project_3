package kr.or.epm.AjaxController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.View;

import kr.or.epm.Service.AdminService;
import kr.or.epm.VO.Branch;
import kr.or.epm.VO.Dept;
import kr.or.epm.VO.DeptJoinBonus;
import kr.or.epm.VO.LowDeptJoin;
import kr.or.epm.VO.Low_dept;
import kr.or.epm.VO.PositionJoin;
import kr.or.epm.VO.Set_homepage;
import kr.or.epm.VO.Set_time;
import net.sf.json.JSONArray;

/*
 * 작성자 : 박성준
 * 작성일 : 2016-11-17
 * 사용목적 : 관리자 아작스 컨트롤러
 * 
 */

@Controller
public class AdminAjaxController {

	@Autowired
	private View jsonview;
	@Autowired
	private AdminService adminservice;
	
	//지점 선택후 조회 클릭 했을시 지점 상세정보 출력
	@RequestMapping("/selectBranchList.do")
	public View branchList(String selectBranchName , Model model){	
		System.out.println("넘어온 데이타 : "+selectBranchName);
		Branch dto = adminservice.chooseBranch(selectBranchName);
		System.out.println("어드민 아작스 : "+dto.toString());
		model.addAttribute(dto);
		return jsonview;
	}
	
	//지점 추가
	@RequestMapping("/branchAdd.do")
	public View branchAdd(Branch dto, Model model){
		System.out.println("지점추가 controller : "+dto.toString());
		int result = adminservice.addBranch(dto);
		System.out.println("결과 : "+result);
		model.addAttribute("result", result);
		return jsonview;
	}
	
	
	//지점 정보 수정
	@RequestMapping("/branchModify.do")
	public View branchModify(Branch dto, Model model){
		System.out.println("정보 수정 dto: "+dto.toString());
		int result = adminservice.branchModify(dto);
		System.out.println("지점 정보 수정  결과: "+result);
		model.addAttribute("result", result);
		return jsonview;
	}
	
	
	//부서 페이지 - 부서에서 - > 지점 선택시 부서 select 에 뿌려주는 함수
	@RequestMapping("/departMentSelect.do")
	public View departMentSelect(String branch_name, Model model){
		List<Dept> list = adminservice.listDept(branch_name);
		model.addAttribute("deptlist", list);
		return jsonview;
	}
	
	//부서 관리 > 부서 등록하기
	@RequestMapping("/deptAdd.do")
	public View DeptAdd(DeptJoinBonus dto, Model model){
		int result = adminservice.addBranch(dto);
		
		if(result >= 2){
			System.out.println("성공");
			model.addAttribute("result", "성공");
		}else{
			System.out.println("실패 ");
			model.addAttribute("result", "실패");
		}
		
		return jsonview;
	}
	
	//부서관리> 부서 조회하기
	@RequestMapping("/selectDeptList.do")
	public View selectDeptList(String dept_no, Model model){
	    DeptJoinBonus dept = adminservice.selectChooseDept(dept_no);
		model.addAttribute("dept", dept);
		return jsonview;
	}
	
	//부서관리 > 정보 수정
	@RequestMapping("/modifyDept.do")
	public View modifyDept(DeptJoinBonus mydata, Model model){
	
	    int result =adminservice.insert_re_Dept(mydata);
		
	    if(result >= 3){
			System.out.println("성공");
			model.addAttribute("result", "성공");
		}else{
			System.out.println("실패 ");
			model.addAttribute("result", "실패");
		}
		
		return jsonview;
	}
	
	//하위 부서  > 조회 > 하위 부서 selectbox
	@RequestMapping("/lowDeptSelect.do")
	public View lowDeptSelect(String dept_name, Model model){
		List<Low_dept> list = adminservice.select_lowdept_name(dept_name);
		model.addAttribute("lowdeptlist", list);
		return jsonview;
	}
	
	//하위부서 > 조회하기 버튼 클릭시
	@RequestMapping("/search_low_dept.do")
	public View search_low_dept(String low_dept_no, Model model){
		LowDeptJoin low_dept = adminservice.selectLow_dept_detail(low_dept_no);
	    model.addAttribute("low_dept", low_dept);
		return jsonview;
	}
	
	// 하위부서 > 등록하기
	@RequestMapping("/add_lowDept.do")
	public View add_lowDept(LowDeptJoin lowDeptJoin, Model model){
	   int result =adminservice.insertLow_dept(lowDeptJoin);
	   if(result >= 3){
			System.out.println("성공");
			model.addAttribute("result", "성공");
		}else{
			System.out.println("실패 ");
			model.addAttribute("result", "실패");
		}
       return jsonview;
	}
	
	//하위 부서 > 수정하기
	@RequestMapping("/low_dept_Modify.do")
	public View low_dept_Modify(){
		
		
		return jsonview;
	}
	
	//직위 정보 조회 > selectBox 선택시
	@RequestMapping(value="/adminGradeSelect.do", method=RequestMethod.GET)
	public View adminSelect(String choose, Model model){
		System.out.println("셀렉트 선택한 값 : "+choose);
		PositionJoin position = adminservice.dtoPosition(choose);
		model.addAttribute("position", position);
		return jsonview;
	}
	
	//직위 들록시 사용
	@RequestMapping("/insertPosition.do")
	public View addNewPosition(PositionJoin position){
		
		int result = adminservice.positionInsert(position);
		if(result >= 3 ){
			System.out.println("성공!!");
		}else{
			System.out.println("실패야....................");
		}
		return jsonview;
	}
	
	//직위 권한 업데이트
	@RequestMapping("/positionModifyStep.do")
	public View StepModify(HttpServletRequest request, @RequestBody String json, Model model){
		List<Map<String, Object>> resultMap = new ArrayList<Map<String, Object>>();
		resultMap = JSONArray.fromObject(json);
		//업데이트 된 상태 !!
		adminservice.positionUpdateDragAndDrop(resultMap);
		
		//여기서 업데이트 된 것 새로 받아줌
		List<PositionJoin> list = adminservice.listPosition();
		model.addAttribute("modifylist",list);
		return jsonview;
	}
	
}
