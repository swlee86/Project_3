package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.weaver.ast.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.OrganizationDAO;
import kr.or.epm.DAO.TaskDAO;
import kr.or.epm.DAO.Task_peopleDAO;
import kr.or.epm.VO.Organization;
import kr.or.epm.VO.Task;
import kr.or.epm.VO.Task_people;

@Service
public class TaskService {

   @Autowired
   private SqlSession sqlsession;
   
   //업무 페이지 처음 들어올때 히든에 task_no 넣어줌
   public String selectTask_No(){
      String task_No = "";
      Task_peopleDAO taskDAO = sqlsession.getMapper(Task_peopleDAO.class);
      task_No = taskDAO.selectTask_No();
      int taskNumber = Integer.parseInt(task_No);
      taskNumber += 1;
      task_No = String.valueOf(taskNumber);
      return task_No;
   }
   
   //업무 등록시 / 모달->지점 이름 트리 구조
   public List<Organization> selectDept(){
      List<Organization> list = null;
      OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
      list = organizationDAO.selectBranch();
      
      for(int i = 0; i < list.size(); i++){
         System.out.println("부서 이름 : " +list.get(i).getDept_name());
         System.out.println("하위부서  이름 : "+list.get(i).getLow_dept_name());
         System.out.println("지점 이름 : "+list.get(i).getBranch_name());
      }
      
      return list;
   }
   //업무 등록시 / 모달 -> 부서 이름 트리 구조
   public List<Organization> selectdeptname(String branch_name){
      System.out.println("부서 이름 뽑으러 서비스 타러 왔음");
      System.out.println("입력된 branch_name : " + branch_name);
	   List<Organization> list = null;
      OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
      list = organizationDAO.selectDept(branch_name);
      System.out.println("서비스단에서 나온 데이터 : " + list.size());
      return list;
   }
   //업무 등록시 / 모달 -> 하위 부서 이름 트리 구조
   public List<Organization> selectlowDept(String dept_name){
      List<Organization> list = null;
      OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
      
      System.out.println("서비스 : "+dept_name);
      
      list=organizationDAO.selectlowDept(dept_name);
      return list;
   }
   
   
   //업무 등록시 / 모달 -> 사원 정보 이름 트리 구조
      public List<Organization> selectEmpInfo(String low_dept_name){
         System.out.println("서비스 selectEmpInfo : "+low_dept_name);
         List<Organization> list = null;
         OrganizationDAO organizationDAO = sqlsession.getMapper(OrganizationDAO.class);
      
         list=organizationDAO.selectEmpInfo(low_dept_name);
         for(int i = 0; i < list.size(); i++){
            System.out.println("이름 : "+list.get(i).getEmp_name() + " / 사번 : "+list.get(i).getEmp_no());
         }
         
         return list;
      }
   
      //업무등록 submit 버튼 클릭시
      public int TaskInsert(Task task){
         int result = 0;
         
         System.out.println("서비스 : "+task.toString());
         
         //업무 등록 관련 Task인터페이스
         TaskDAO taskDAO = sqlsession.getMapper(TaskDAO.class);
         int insertResult = taskDAO.insertTask(task);
         System.out.println("인설트 결과 : "+insertResult);
         return result;
      }
      //업무 등록시 참조자 insert
      public int insertTask_people(List<Task_people> taskpeople){
         int result =0;
         Task_peopleDAO dao = sqlsession.getMapper(Task_peopleDAO.class);
         int peopleresult = dao.insertTask_people(taskpeople);
         System.out.println("업무 참여자 인설트 결과"+peopleresult);
         return result;
      }
   
}