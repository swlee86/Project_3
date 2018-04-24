package com.toinfra.DAO;

import java.util.HashMap;
import java.util.List;

import com.toinfra.VO.*;
import com.toinfra.VO.Contact;
import com.toinfra.VO.Emp;
import com.toinfra.VO.Emp_contact;
import com.toinfra.VO.Pjd;
import com.toinfra.VO.Pjd_people;
import com.toinfra.VO.Pjdd;

/*
 * 작성일 : 2016-11-18
 * 작성자 : 백승아
 * 사용 목적 : 상세프로젝트에 대한 DAO interface
*/

public interface PjdDAO {

	// 큰 프로젝트에 대한 프로젝트 상세 조회하기
	public List<Pjd> selectPjd(String pj_no);

	// 프로젝트 상세 등록하기
	public int insertPjd();

	// 프로젝트 상세 수정하기 : TODO리스트
	public int updatePjd(HashMap map);

	// 진행 단계 처리하기
	public int updatePjd_step(HashMap map);

	// 진행률 계산하기
	public int updatePjd_progress();

	// 상세의 참여자 사진 조회하기
	public List<Pjd_people> selectPeople(String pjd_no);

	// 참여자 상세정보보기 ( modal)
	public Pjd_people selectPeople_info(String emp_no);

	// 프로젝트 상세 조회하기 ( 단일)
	public Pjd selectPjd_Detail(String pjd_no);

	// 등록인 정보 구하기
	public Emp selectInfoSearch(String id);

	// 주소록테이블 등록
	public int insertContact(Contact contact);

	// 현재 최고 글번호
	public int selectMaxContact_No(String name);

	// 개인 주소록 테이블 등록
	public int insertEmpContact(Emp_contact emp_contact);

	// 상세의 상세내역
	public List<Pjdd> selectPjdd(String pjd_no);

	// 상세의 상세내역 추가
	public int insertPjdd(Pjdd pjdd);

	// 상세의 상세 업데이트
	public int updatePjdd(HashMap map);

	// 상세의 진행률 업데이트
	public int updatePjdProgress(HashMap map);

	// 프로젝트 진행률 업데이트
	public int updatePjProgress(String pjd_no);

}
