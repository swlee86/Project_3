package com.toinfra.DAO;

import java.util.List;

import com.toinfra.DTO.*;

public interface PushDAO {
   //Emp_detail 에서 아이디를 토대로 사원번호 뽑아오기
   String selectEmp_no(String username);
   
   //업무 테이블에서 읽지 않은 리스트 가지고 오기
   String taskCount(String user_id);
   
   //내가 작성한 프로젝트 개수 구하기
   //String projectMyCount(String emp_no);
   String myprojectCount(String user_id);
   
   List<Task> selecttasklist(String user_id, int start, int end);
   
   List<Task> selectmytasklist(String user_id);
   
   List<Pj> selectPj_rec(String user_id, int start, int end);
   
  
   List<Commute> commutelist(String user_id, String startData, String endData);
   
   //평균 근무시간 - 부서
   String selectavgcommute_dept(String user_id);
   
   //평균 근무시간 - 내것
   String selectavgcommute_my(String user_id);
   
   Emp_detail selectLogin_Emp(String user_id);

   Emp_detail selectLogin_Emp_Detail(String user_id);
   
   //전자결재 참조 숫자 구하는 것.
   String selectDraftCount(String user_id);
   
   //업무 - 내가 승인 해야 할 것 !!
   String taskApproval(String user_id);
   
   //프로젝트 - 내가 승인 해야 할 프로젝트 
   String projectApproval(String user_id);
   
}