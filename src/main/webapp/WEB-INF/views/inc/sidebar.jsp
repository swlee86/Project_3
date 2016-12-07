<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside id="menu">
     
    <div id="navigation">
        <div class="profile-picture">
            
            <a href="${pageContext.request.contextPath}/index.do">
                <img src="${pageContext.request.contextPath}/images/ss.jpg" style="width:128px;height: 128px;" class="img-circle m-b" alt="logo">
            </a>
			<div class="stats-label text-color">
                <span class="font-extra-bold font-uppercase">${Emp.emp_name} 님 환영합니다.</span>
					
			</div>
			<!--  
	        <div class="stats-label text-color">
                <span class="font-extra-bold font-uppercase">Project_3</span>
				
				
                <div class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                        <small class="text-muted">Founder of App <b class="caret"></b></small>
                    </a>
                    <ul class="dropdown-menu animated flipInX m-t-xs">
                        <li><a href="contacts.html">Contacts</a></li>
                        <li><a href="profile.html">Profile</a></li>
                        <li><a href="analytics.jsp">Analytics</a></li>
                        <li class="divider"></li>
                        <li><a href="login.html">Logout</a></li>
                    </ul>
                </div>
                <div id="sparkline1" class="small-chart m-t-sm"></div>
                <div>
                    <h4 class="font-extra-bold m-b-xs">
                        $260 104,200
                    </h4>
                    <small class="text-muted">Your income from the last year in sales product X.</small>
                </div>--> 
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
       <!--      <li>
                <a href="#"><span class="nav-label">개인 일정 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="registration_schedule.do">일정 등록</a></li>
                    <li><a href="calendar_schedule.do">일정 보기</a></li>
                </ul>
            </li> -->
            <li>
                <a href="#"><span class="nav-label">메일 서비스</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="mailbox.do">메일 읽기</a></li>
                    <li><a href="mailbox_compose.do">메일 쓰기</a></li>
                    <li><a href="mailbox_send.do">보낸메일함 (수신 확인)</a></li>
                    <li><a href="#">스팸 메일 관리</a></li>
                    <li><a href="mailbox_trash.do">휴지통</a></li>
                </ul>
            </li>
            <li>
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
            </li>
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
                    <li><a href="projectApprove.do">프로젝트 승인 대기함</a></li>
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
           			<!-- <li><a href="CommuteAdmin.do">근태 마감(관리자)</a></li> -->
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">급여 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                	<li><a href="salarySetting.do">급여 항목 설정</a></li>
                    <li><a href="salaryClose.do">급여 마감 관리</a></li>
                    <li><a href="salarySearch.do">급여 조회</a></li>
                    <li><a href="severancepay.do">퇴직금 계산</a></li>
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
                    <li><a href="login.do">로그인</a></li>
                    <li><a href="addMember.do">회원가입</a></li>
                    <li><a href="editMyinfo.do">내정보수정</a></li>
                    <li><a href="withdrawal.do">회원탈퇴</a></li>
                    <li><a href="findId.do">아이디찾기</a></li>
                    <li><a href="findPw.do">비밀번호찾기</a></li>
                    <li><a href="error_one.html">Error 404</a></li>
                    <li><a href="error_two.html">Error 505</a></li>
                    <li><a href="lock.html">Lock screen</a></li>
                    <li><a href="password_recovery.html">Passwor recovery</a></li>
                </ul>
            </li>
            <li>
           		 <a href="chat_ws.do"><span class="nav-label">실시간 채팅</span></a>
            </li>
              <li>
                <a href="#"><span class="nav-label">관리자</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="adminEmployeeManage.do">사원정보관리</a></li>
                    <li><a href="adminEmployeeRoleManage.do">사원권한관리</a></li>
                    <li><a href="adminCheckWithdrawal.do">탈퇴 신청 리스트 보기</a>
                    <li><a href="adminDepartWidget.do">부서관리</a></li>
                    <li><a href="adminGrade.do">직위관리</a></li>
                    <li><a href="adminSalaryView.do">급여관리</a></li>
                    <li><a href="CommuteAdmin.do">근태관리</a></li>
                </ul>
            </li>
            <li>
            	&nbsp;
            </li>
        </ul>

</aside>