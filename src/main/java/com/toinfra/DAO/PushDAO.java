package com.toinfra.DAO;

import java.util.List;

import com.toinfra.VO.Commute;
import com.toinfra.VO.Emp;
import com.toinfra.VO.Pj;
import com.toinfra.VO.Task;
import com.toinfra.VO.Commute;
import com.toinfra.VO.Emp;
import com.toinfra.VO.Pj;
import com.toinfra.VO.Task;

public interface PushDAO {
   //Emp_detail 에서 아이디를 토대로 사원번호 뽑아오기
   String selectEmp_no(String username);
   
   //업무 테이블에서 읽지 않은 리스트 가지고 오기
   String taskCount(String emp_no);
   
   //내가 작성한 프로젝트 개수 구하기
   //String projectMyCount(String emp_no);
   String myprojectCount(String emp_no);
   
   List<Task> selecttasklist(String emp_no, int start, int end);
   
   List<Task> selectmytasklist(String emp_no);
   
   List<Pj> selectPj_rec(String emp_no, int start, int end);
   
  
   List<Commute> commutelist(String emp_no, String startData, String endData);
   
   //평균 근무시간 - 부서
   String selectavgcommute_dept(String emp_no);
   
   //평균 근무시간 - 내것
   String selectavgcommute_my(String emp_no);
   
   Emp selectLogin_Emp(String emp_no);
   
   //전자결재 참조 숫자 구하는 것.
   String selectDraftCount(String emp_no);
   
   //업무 - 내가 승인 해야 할 것 !!
   String taskApproval(String emp_no);
   
   //프로젝트 - 내가 승인 해야 할 프로젝트 
   String projectApproval(String emp_no);
   
}