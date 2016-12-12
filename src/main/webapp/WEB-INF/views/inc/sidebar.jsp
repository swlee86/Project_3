<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
    
<aside id="menu">
     
    <div id="navigation">
        <div class="profile-picture">
            
            <a href="${pageContext.request.contextPath}/index.do">
                <img src="${pageContext.request.contextPath}/img/upload/${Emp.pic}" style="width:128px;height: 128px;" class="img-circle m-b" alt="logo">
            </a>
			<div class="stats-label text-color">
                <span class="font-extra-bold font-uppercase"><i class="fa fa-user"></i> ${Emp.emp_name}님 환영합니다</span>
					
			</div>
        </div>
    </div>
        
		<!-- <span class="label label-success pull-right">버튼달고 싶으면 여기에 메세지 입력</span> -->
        <ul class="nav" id="side-menu">
            <!-- <li class="active">
                <a href="index.do"> <span class="nav-label">Main</span> <span class="label label-success pull-right"></span> </a>
            </li> -->
            <li>
                <a href="private_memo.do"> <span class="nav-label">개인메모</span><span class="label label-warning pull-right"></span> </a>
            </li>
            <li>
                <a href="contacts.do"> <span class="nav-label">주소록</span><span class="label label-warning pull-right"></span> </a>
            </li>
       
            <li>
                <a href="#"><span class="nav-label">메일 서비스</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="mailbox.do">메일 읽기</a></li>
                    <li><a href="mailbox_compose.do">메일 쓰기</a></li>
                    <li><a href="mailbox_send.do">보낸 메일함 </a></li>
                   <!--  <li><a href="#">스팸 메일 관리</a></li>
                    <li><a href="mailbox_trash.do">휴지통</a></li> -->
                </ul>
            </li>
        <!--     <li>
                <a href="#"><span class="nav-label">회의</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li style="text-align: center;">
				   <div class="g-hangout" data-render="createhangout"
						data-initial_apps="[{ app_id : 'cultivated-pen-150602', start_data : 'dQw4w9WgXcQ', 'app_type' : 'ROOM_APP' }]" 
						data-invites="[{ id : 'airless86@gmail.com', invite_type : 'EMAIL' },
                       						{ id : 'stpark89@gmail.com', invite_type : 'EMAIL' },
                       						{ id : 'gifmgo01@gmail.com', invite_type : 'EMAIL' }]">
					</div>
                    </li>
                    
                </ul>
            </li> -->
            <li>
                <a href="#" ><span class="nav-label">전자 결재</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                	<li><a href="draftWrite.do">결재 등록</a></li>
                	<li><a href="draft_rec.do">수신함</a></li>
                	<li><a href="draft.do">송신함</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">업무</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                	<li><a href="taskWrite.do">업무 등록</a></li>
                    <li><a href="taskRequest.do">요청</a></li>
                    <li><a href="taskInform.do">보고</a></li>
                    <li><a href="taskLog.do">일지</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">프로젝트 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="project_list.do">전체 프로젝트</a></li>
                    <li><a href="projectApprove.do">프로젝트 대기함</a></li>
                    <li><a href="projectMake.do">프로젝트 작성</a></li>
                </ul>
            </li>
            <li>
                <a href="team_member.do"><span class="nav-label">조직도</span></a>
            </li>
            <li>
                <a href="#"><span class="nav-label">근태 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                	<li><a href="Commute.do">일일 근태 등록</a></li>
           			<li><a href="CommuteMonth.do">월별 근태 조회</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">급여 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="salarySearch.do">급여 조회</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">게시판 서비스</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                 	<li><a href="info_board_list.do">회사정보 게시판</a></li>
                 	<li><a href="media_board_list.do">언론 게시판</a></li>
                 	<li><a href="business_board_list.do">업무정보공유 게시판</a></li>
                 	<li><a href="free_board_list.do">자유 게시판</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">회원 정보 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    
                    <li><a href="editMyinfo.do">내정보수정</a></li>
                    <li><a href="withdrawal.do">회원탈퇴</a></li>
                </ul>
            </li>
              <se:authorize access="hasRole('ROLE_ADMIN')">
              <li>
                <a href="#"><span class="nav-label">관리자</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="adminEmp_list.do">사원관리</a></li>
                    <li><a href="adminDepartWidget.do">부서관리</a></li>
                    <li><a href="adminGrade.do">직위관리</a></li>
                    <li><a href="adminSalaryView.do">급여관리</a></li>
                    <li><a href="CommuteAdmin.do">근태관리</a></li>
                </ul>
            </li>
            </se:authorize>
            <li>
            	<a href="#" onClick="javascript:window.open('http://192.168.43.52:3000/?id=${Emp.emp_name}', 'popup','scrollbars=no, width=500px,height=600px,resizable=no')">Node 채팅</a>
            </li>
            <li>
            	&nbsp;
            </li>
        </ul>

</aside>