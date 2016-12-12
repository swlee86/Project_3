package kr.or.epm.AjaxController;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.json.JsonArray;
import javax.servlet.http.HttpServletRequest;

import org.apache.jasper.tagplugins.jstl.core.ForEach;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.View;

import jdk.nashorn.internal.runtime.JSONFunctions;
import kr.or.epm.Service.EmployeeRoleManageService;
import kr.or.epm.VO.Emp_role;
import net.sf.json.JSONArray;

/*
 * 작성자 : 백승아
 * 작성일 : 2016-11-22
 * 사용목적 : 관리자 권한부여 Ajax 컨트롤러
 * 
 */

@Controller
public class EmployeeRoleManageAjaxController지울거야 {

	@Autowired
	private View jsonview;

	@Autowired
	private EmployeeRoleManageService employeeRoleManage;

	// 관리자 > 회원관리 > 사원 권한 부여 페이지 > 사원 권한 부여하기
	@SuppressWarnings("unchecked")
	@RequestMapping(value="/give_authority.do", method=RequestMethod.POST)
    public View adminEmployeeRoleGive(HttpServletRequest request) {
		
        System.out.println("CONTROLLER] 사원에게 권한을 부여합니다");
        
        String str = request.getParameter("param");
        str.trim();
        str.trim();
        List<Map<String,String>> map = new ArrayList<Map<String,String>>();
        map = JSONArray.fromObject(str);
        int result = 0;
        
        for(Map<String, String> m : map) {
            System.out.println(m.get("emp_no") + " : " + m.get("role_name"));
            
            try {
                result = employeeRoleManage.updateEmpRole(m.get("emp_no"), m.get("role_name"));
            } catch (Exception e) {
                e.getMessage();
            } finally {
                if (result > 0) {
                    System.out.println("사원에게 권한 부여 성공");
                } else {
                    System.out.println("ERROR");
                }
            }
        }
        return jsonview;
    }
}

