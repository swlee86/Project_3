<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<aside id="menu">
    <div id="navigation">
        <div class="profile-picture">
            <a href="${pageContext.request.contextPath}/index.do">
                <img src="${pageContext.request.contextPath}/images/profile.jpg" class="img-circle m-b" alt="logo">
            </a>

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
                </div>
            </div>
        </div>
        
		<!-- <span class="label label-success pull-right">버튼달고 싶으면 여기에 메세지 입력</span> -->
        <ul class="nav" id="side-menu">
            <li class="active">
                <a href="index.html"> <span class="nav-label">Main</span> <span class="label label-success pull-right"></span> </a>
            </li>
            <li>
                <a href="private_memo.do"> <span class="nav-label">개인메모</span><span class="label label-warning pull-right"></span> </a>
            </li>
            <li>
                <a href="contacts.do"> <span class="nav-label">주소록</span><span class="label label-warning pull-right"></span> </a>
            </li>
            <li>
                <a href="#"><span class="nav-label">개인 일정 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="registration_schedule.do">일정 등록</a></li>
                    <li><a href="calendar_schedule.do">일정 보기</a></li>
                </ul>
            </li>
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
                <a href="#"><span class="nav-label">전자 결재</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                	<li><a href="sanction_write.do">요청 등록</a></li>
                	<li><a href="CommuteWrite.do">휴가/외박 신청</a></li>
                	<li><a href="sanction_list.do">요청한 결재</a></li>
                	<li><a href="sanction_approve.do">결재대기함</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">업무관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                	<li><a href="taskWrite.do">업무 등록</a></li>
                    <li><a href="taskRequest.do">업무 요청</a></li>
                    <li><a href="taskInform.do">업무 보고</a></li>
                    <li><a href="taskLog_rec.do">업무 일지</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">프로젝트 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="project_list.do">전체 프로젝트</a></li>
                    <li><a href="projects.do">진행중인 프로젝트</a></li>
                    <li><a href="projectApprove.do">프로젝트 승인 대기함</a></li> 
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
           			<li><a href="CommuteOther.do">각기다른 근태보기</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">급여 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                	<li><a href="salarySetting.do">급여 항목 설정</a></li>
                    <li><a href="#">급여 마감 관리</a></li>
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
                    <li><a href="adminDepartWidget.do">부서관리</a></li>
                    <li><a href="adminGrade.do">직위관리</a></li>
                    <li><a href="adminSalaryView.do">급여관리</a></li>
                    <li><a href="adminCommute.do">시간 정보 관리</a></li>
                    <li><a href="adminSalesList.do">매출 관리</a></li>
                    <li><a href="client.do">거래처</a></li>
                </ul>
            </li>
            <li>
            	&nbsp;
            </li>
        </ul>
    </div>
</aside>