package kr.or.epm.Service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.epm.DAO.BusinessBoardDAO;
import kr.or.epm.DAO.MemoDAO;
import kr.or.epm.VO.Memo;
import kr.or.epm.VO.Memocolor;

@Service
public class MemoService {

	@Autowired
	private SqlSession sqlSession;
	
	//메모 화면에서 리스트를 불러오는 서비스 함수
	public List<Memo> selectMemo(String emp_no){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		List<Memo> list = memodao.selectMemo(emp_no);
		return list;
	};
	
	//사원 아이디를 토대로 사번 정보를 불러오는 서비스 함수
	public String selectMemoEmpno(String id){
		System.out.println("메모에서 번호를 가져 옵니다");
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		String memo = memodao.selectMemoEmpno(id);
		return memo;
	}
	
	//메모 detail 데이터를 불러오는 서비스 함수
	public Memo selectMemo_detail(String memo_no){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		Memo memo = memodao.selectMemo_detail(memo_no);
		return  memo;
	}
	
	//해당 사번이 가진 메모 가운데 가장 큰 메모 번호를 가져옴
	public String selectMaxNo(String emp_no){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		String max_no = memodao.selectMaxNo(emp_no);
		return max_no;
	}
	
	//메모를 인서트 하는 서비스 함수
	public int insertMemo(Memo dto){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		int result = memodao.insertMemo(dto);
		return result;
	}
	
	//메모 컬러 리스트를 모두 뽑아오는 서비스 함수
	public List<Memocolor> selectMemocolorList(){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		List<Memocolor> color = memodao.selectMemocolorList();
		System.out.println(color.toString());
		return color;
	}
	
	//메모를 수정하는 서비스 함수
	public int updateMemo(Memo dto){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		int result = memodao.updateMemo(dto);
		return result;
	}
	
	//메모를 삭제하는 서비스 함수
	public int deleteMemo(String memo_no){
		MemoDAO memodao = sqlSession.getMapper(MemoDAO.class);
		int result = memodao.deleteMemo(memo_no);
		return result;
	}
}
