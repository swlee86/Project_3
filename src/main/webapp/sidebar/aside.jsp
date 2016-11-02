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
                    <li><a href="text_editor.html">Text editor</a></li>
                    <li><a href="12313">Wizard</a></li>
                    <li><a href="validation.html">Validation</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">메일 서비스</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="mailbox.do">메일 읽기</a></li>
                    <li><a href="mailbox_compose.do">메일 쓰기</a></li>
                    <li><a href="#">수신 확인</a></li>
                    <li><a href="#">스팸 메일 관리</a></li>
                    <li><a href="#">휴지통</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">전자 결재</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="sanction_approve.do">승인 처리</a></li>
                    <li><a href="datatables.html">Data tables</a></li>
                    <li><a href="footable.html">Foo Table</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">프로젝트 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="project_list.do">전체 프로젝트</a></li>
                    <li><a href="projects.do">진행중인 프로젝트</a></li>
                    <li><a href="project.html">Project detail</a></li>
                    <li><a href="app_plans.html">App plans</a></li>
                    <li><a href="social_board.html">Social board</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                    <li><a href="timeline.html">Timeline</a></li>
                    <li><a href="notes.html">Notes</a></li>
                    <li><a href="profile.html">Profile</a></li>
                    <li><a href="mailbox.html">Mailbox</a></li>
                    <li><a href="mailbox_compose.html">Email compose</a></li>
                    <li><a href="mailbox_view.html">Email view</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="blog_details.html">Blog article</a></li>
                    <li><a href="forum.html">Forum</a></li>
                    <li><a href="forum_details.html">Forum details</a></li>
                    <li><a href="gallery.html">Gallery</a></li>
                    <li><a href="calendar.html">Calendar</a></li>
                    <li><a href="invoice.html">Invoice</a></li>
                    <li><a href="file_manager.html">File manager</a></li>
                    <li><a href="chat_view.html">Chat view</a></li>
                    <li><a href="search.html">Search view</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">조직도</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="team_member.do">부서 인원</a></li>
                    <li><a href="projects.html">Projects</a></li>
                    <li><a href="project.html">Project detail</a></li>
                    <li><a href="app_plans.html">App plans</a></li>
                    <li><a href="social_board.html">Social board</a></li>
                    <li><a href="faq.html">FAQ</a></li>
                    <li><a href="timeline.html">Timeline</a></li>
                    <li><a href="notes.html">Notes</a></li>
                    <li><a href="profile.html">Profile</a></li>
                    <li><a href="mailbox.html">Mailbox</a></li>
                    <li><a href="mailbox_compose.html">Email compose</a></li>
                    <li><a href="mailbox_view.html">Email view</a></li>
                    <li><a href="blog.html">Blog</a></li>
                    <li><a href="blog_details.html">Blog article</a></li>
                    <li><a href="forum.html">Forum</a></li>
                    <li><a href="forum_details.html">Forum details</a></li>
                    <li><a href="gallery.html">Gallery</a></li>
                    <li><a href="calendar.html">Calendar</a></li>
                    <li><a href="invoice.html">Invoice</a></li>
                    <li><a href="file_manager.html">File manager</a></li>
                    <li><a href="chat_view.html">Chat view</a></li>
                    <li><a href="search.html">Search view</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">인사 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                	<li><a href="member_datatables.do">사원 정보(관리자)</a></li>
                    <li><a href="chartjs.html">ChartJs</a></li>
                    <li><a href="flot.html">Flot charts</a></li>
                    <li><a href="inline.html">Inline graphs</a></li>
                    <li><a href="chartist.html">Chartist</a></li>
                    <li><a href="c3.html">C3 Charts</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">게시판 서비스</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="overview.html"><span class="label label-success pull-right">Start</span> Overview </a>  </li>
                    <li><a href="transition_two.html">Columns from up</a></li>
                    <li><a href="transition_one.html">Columns custom</a></li>
                    <li><a href="transition_three.html">Panels zoom</a></li>
                    <li><a href="transition_four.html">Rows from down</a></li>
                    <li><a href="transition_five.html">Rows from right</a></li>
                </ul>
            </li>
            <li>
                <a href="#"><span class="nav-label">회원 정보 관리</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="login.htm">Login</a></li>
                    <li><a href="register.html">Register</a></li>
                    <li><a href="error_one.html">Error 404</a></li>
                    <li><a href="error_two.html">Error 505</a></li>
                    <li><a href="lock.html">Lock screen</a></li>
                    <li><a href="password_recovery.html">Passwor recovery</a></li>
                </ul>
            </li>
            <li>
                <a href="options.jsp"> <span class="nav-label">사이트 개인 설정</span></a>
            </li>
            <li>
                <a href="#"><span class="nav-label">Tables</span><span class="fa arrow"></span> </a>
                <ul class="nav nav-second-level">
                    <li><a href="tables_design.html">Tables design</a></li>
                    <li><a href="datatables.html">Data tables</a></li>
                    <li><a href="footable.html">Foo Table</a></li>
                </ul>
            </li>
            <li>
                <a href="widgets.html"> <span class="nav-label">Widgets</span> <span class="label label-success pull-right">Special</span></a>
            </li>
            <li>
                <a href="grid_system.html"> <span class="nav-label">Grid system</span></a>
            </li>
            <li>
                <a href="landing_page.html"> <span class="nav-label">Landing page</span></a>
            </li>
            <li>
                <a href="package.html"> <span class="nav-label">Package</span></a>
            </li>

        </ul>
    </div>
</aside>