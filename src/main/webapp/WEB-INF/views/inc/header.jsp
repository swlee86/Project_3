<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 구글 로그인 api Start -->
<!-- 행아웃 필요 스크립트 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<script src="vendor/jquery/dist/jquery.min.js"></script>

<script>

    if ( document.location.protocol == 'http:' ) {
        if ( document.location.port == '443' ) {
            document.location.href = document.location.href.replace('http:', 'https:');
        };
    };
         
$(function(){
	$('#sidebar').click(function(){
		
		$.ajax({
				url:"/views/inc/rightsidebar.jsp",
				success:function(result) {
					$("#header").html(result);
				}
			});
	});
	
	$('#logo').click(function(){
		location.href="index.do";
	});
	
});
</script>
<meta name="google-signin-client_id" content="279959715456-km9o7eijb5j8sr8kn9i98dtmitu5l1tt.apps.googleusercontent.com">
<!-- 구글 로그인 api End -->
<!-- Header -->
<div id="header">
    <div class="color-line">
    </div>
    <%--
    <div id="logo" class="light-version"
    	 style="background: url('img/Logo.png');
    	 		background-size: 60%;
    	 		background-repeat: no-repeat;
    	 		background-position: center center;">

    </div>
    --%>
    <div id="logo" class="light-version">
        ToInfra
    </div>
    <nav role="navigation">
        <div class="header-link hide-menu">
        	&nbsp;<i class="fa fa-bars"></i></div>
        <div class="small-logo">
            <span class="text-primary">ToInfra</span>
        </div>
        <form role="search" class="navbar-form-custom" method="post" action="#">
            <div class="form-group">
                <input type="text" placeholder="" class="form-control" name="search">
            </div>
        </form>
        <div class="mobile-menu">
            <button type="button" class="navbar-toggle mobile-menu-toggle" data-toggle="collapse" data-target="#mobile-collapse">
                <i class="fa fa-chevron-down"></i>
            </button>
            <div class="collapse mobile-navbar" id="mobile-collapse">
                <ul class="nav navbar-nav">
					<c:if test="${empty pageContext.request.userPrincipal}">
						<li>
							<%--<a href="${pageContext.request.contextPath}/login.do">Login</a>--%>
                            <%--<a href="#layer2" class="btn-login">Login</a>--%>
						</li>
					</c:if>
					<c:if test="${not empty pageContext.request.userPrincipal}">
						<li>
							<a href="${pageContext.request.contextPath}/logout" id="logout">Logout</a>
						</li>
					</c:if>
					<li>
                        <a class="" href="profile.html">Profile</a>
                    </li>
                </ul>
            </div>
        </div>
        <div class="navbar-right">
            <ul class="nav navbar-nav no-borders">
                <!-- <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                        <i class="pe-7s-speaker"></i>
                    </a>
                    <ul class="dropdown-menu hdropdown notification animated flipInX">
                        <li>
                            <a>
                                <span class="label label-success" id="birthDay">이달의 생일자</span>
                            </a>
                        </li>
                        <li>
                            <a>
                                <span class="label label-warning">WAR</span> There are many variations.
                            </a>
                        </li>
                        <li>
                            <a>
                                <span class="label label-danger">ERR</span> Contrary to popular belief.
                            </a>
                        </li>
                        <li class="summary"><a href="#">See all notifications</a></li>
                    </ul>
                </li> -->
                <li class="dropdown">
                    <a class="dropdown-toggle" href="#" data-toggle="dropdown">
                        <i class="pe-7s-keypad"></i>
                    </a>

                    <div class="dropdown-menu hdropdown bigmenu animated flipInX">
                        <table>
                            <tbody>
                            <tr>
                                <td>
                                    <a href="project_list.do">
                                        <i class="pe pe-7s-portfolio text-info"></i>
                                        <h5>전체 프로젝트</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="mailbox.do">
                                        <i class="pe pe-7s-mail text-warning"></i>
                                        <h5>E-mail</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="contacts.do">
                                        <i class="pe pe-7s-users text-success"></i>
                                        <h5>주소록</h5>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="taskRequest.do">
                                    	<i class="pe-7s-note2 text-warning2"></i>
                                      <!--   <i class="pe pe-7s-comment "></i> -->
                                        <h5>업무 요청</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="team_member.do">
                                    	<i class="pe-7s-network text-danger"></i>
                                        <!-- <i class="pe pe-7s-graph1 "></i> -->
                                        <h5>조직도</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="draft_rec.do">
                                     	<i class="pe-7s-pen text-primary"></i>
                                       <!--  <i class="pe pe-7s-box1 "></i> -->
                                        <h5>전자결재 수신함</h5>
                                    </a>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </div>
                </li>
                <li class="dropdown">
                    <a class="dropdown-toggle label-menu-corner" href="#" data-toggle="dropdown">
                        <i class="pe-7s-mail"></i>
                        <span class="label label-success" id="pushcount">${sessionpushcount}</span>
                    </a>
                    <ul class="dropdown-menu hdropdown animated flipInX">
                        <div class="title">
                            You have <span id="pushcount2">${sessionpushcount}</span> new works
                        </div>
                        <li class="summary" style="width: 340px;">프로젝트</li>
                        <c:choose>
                        <c:when test="${sessionprojectcount eq 0}">
                        <li>진행 중인 프로젝트가 없습니다.</li>
                    	</c:when>
                    	<c:otherwise>
                    	<li  style="width: 340px;"><a style="padding-left: 0px;" href="project_list.do">진행 중인 프로젝트는<span id="projectcount">${sessionprojectcount}</span>건입니다.</a></li>
                    	</c:otherwise>
                    	</c:choose>
                    	<c:choose>
                    	<c:when test="${sessionApprovalcount eq 0}">
                    	<li>승인 확인이 필요한 프로젝트가 없습니다.</li>
                    	</c:when>
                    	<c:otherwise>
                    	<li><a href="projectApprove.do">승인 처리 하실 프로젝트는<span id="approveprojectcount">${sessionApprovalcount}</span>건입니다.</a></li>                    	
                    	</c:otherwise>
                    	</c:choose>
                    	<li class="summary">업무</li>
                    	<c:choose>
                    	<c:when test="${sessiontaskcount eq 0}">
                    	<li>확인이 필요한 업무가 없습니다.</li>
                    	</c:when>
                    	<c:otherwise>
                    	<li>미확인 하신 업무는<span id="taskcount">${sessiontaskcount}</span>건입니다.</li>                    	
                    	</c:otherwise>
                    	</c:choose>
                    	<c:choose>
                    	<c:when test="${sessiontaskApprovalcount eq 0}">
                    	<li>승인 확인이 필요한 업무가 없습니다.</li>
                    	</c:when>
                    	<c:otherwise>
                        <li>승인 처리 하실 업무는 <span id="taskApprovalcount">${sessiontaskApprovalcount}</span>건입니다.</li>                    	
                    	</c:otherwise>
                    	</c:choose>
                    	
                    	<li class="summary">전자 결재</li>
                    	 <c:choose>
	                    	<c:when test="${empty sessionDraftcount}">
	                    		<li>참조된 전자결재가 없습니다.</li>
	                    	</c:when>
	                    	<c:otherwise>
	                    		<li>참조된 전자결재는 <span id="sanctionApprovalcount">${sessionDraftcount}</span>건 입니다.</li>
	                    	</c:otherwise>
                    	</c:choose> 
                        <li class="summary"><a href="#">See All Messages</a></li>
                    </ul>
                </li>
                <!-- <li>
                    <a href="#" id="sidebar" class="right-sidebar-toggle">
                        <i class="pe-7s-upload pe-7s-news-paper"></i>
                    </a>
                </li> -->
                
                <c:if test="${empty pageContext.request.userPrincipal}">
					<li>
						<%--<a href="${pageContext.request.contextPath}/login.do">--%>
                        <a href="#layer2" class="btn-login">
							<i class="pe-7s-upload pe-rotate-90"></i>
						</a>
                            <div class="dim-layer">
                                <div class="dimBg"></div>
                                <div id="layer2" class="pop-layer">
                                    <div class="pop-container">
                                        <div class="pop-conts">
                                            <!--content //-->
                                            <div class="text-center m-b-md">
                                                <h3>로그인</h3>
                                                <small>WelCome ToInfra!
                                                    <c:if test="${param.error != null}">
                                                        <div>
                                                            로그인실패<br>
                                                            <c:if test="${SPRING_SECURITY_LAST_EXCEPTION != null}">
                                                                이유 : <c:out value="${SPRING_SECURITY_LAST_EXCEPTION.message}" />
                                                            </c:if>
                                                        </div>
                                                    </c:if>
                                                </small>
                                            </div>
                                            <div class="hpanel">
                                                <div class="panel-body">
                                                    <form action="${pageContext.request.contextPath}/login" id="loginForm" method="POST" name="f">
                                                        <div class="form-group">
                                                            <label class="control-label" for="username" style="color: black;">아이디</label>
                                                                <input type="text" title="Please enter you username" required="" value="" name="username" id="username" class="form-control">
                                                            <span class="help-block small">Your unique username to app</span>
                                                        </div>
                                                        <div class="form-group">
                                                            <label class="control-label" for="password" style="color:black;">비밀번호</label>
                                                            <input type="password" title="Please enter your password" placeholder="******" required="" value="" name="password" id="password" class="form-control">
                                                            <span class="help-block small">Your strong password</span>
                                                        </div>
                                                        <div class="checkbox">
                                                            <input type="checkbox" class="i-checks" checked>
                                                            <label style="color: black;">로그인상태 유지</label>
                                                            <p class="help-block small">(if this is a private computer)</p>
                                                        </div>
                                                        <div style="text-align: center;">
                                                            <div class="g-signin2" data-onsuccess="onSignIn" style="display: block;"></div>
                                                        </div>
                                                        <hr>
                                                        <input type="hidden" name="loginRedirect" value="${loginRedirect}" />
                                                        <a class="btn btn-default btn-block" href="#" id="googlelogout" onClick="javascript:window.open('https://accounts.google.com/logout','popup','scrollbars=no, resizable=no, width=500px,height=800px')">구글 로그아웃</a>
                                                        <input type="submit" class="btn btn-success btn-block" value="로그인" id="loginSubmitBtn">
                                                        <a class="btn btn-default btn-block" href="addMember.do">회원가입</a>
                                                        <a class="btn btn-default btn-block" href="findId.do">아이디 찾기</a>
                                                        <a class="btn btn-default btn-block" href="findPw.do">비밀번호 찾기</a>

                                                    </form>
                                                </div>
                                            </div>
                                            <div class="btn-r">
                                                <a href="#" class="btn-layerClose">Close</a>
                                            </div>
                                            <!--// content-->
                                        </div>
                                    </div>
                                </div>
                            </div>
					</li>
				</c:if>
				<c:if test="${not empty pageContext.request.userPrincipal}">
					<li>
						<a href="${pageContext.request.contextPath}/logout">
							<i class="pe-7s-upload pe-rotate-90"></i>
						</a>
					</li>
				</c:if>
            </ul>
        </div>
    </nav>
</div>

<!--생일자 관련 모달-->
<div id="birthModal" class="modal fade" role="dialog">
  <div class="modal-dialog">

    <!-- Modal content-->
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">이달의 생일자</h4>
        <small>축하합니다!!</small>
      </div>
      <div class="modal-body">
        
        <ul style="list-style:none; padding-left:0px;">
        	<li><a href="#"><i class="fa fa-heart"></i> 박성준</a></li>
        	<li><a href="#"><i class="fa fa-heart"></i> 홍길동</a></li>
        </ul>
        
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
      </div>
    </div>

  </div>
</div>
<script src="vendor/jquery/dist/jquery.min.js"></script>
<script>

$(function(){
	$('#logout').click(function(){
		var auth2 = gapi.auth2.getAuthInstance();
	    auth2.signOut().then(function () {
	    });
	});
});

$('#birthDay').click(function(){
	$('#birthModal').modal();
});	

		var pushcount;
		var webSocket;
		webSocket = new WebSocket("ws://192.168.0.128:8090/toinfra/broadsocket.do");
		
		//호출 시점  :  send() 메세지 호출 > broadsocket > handleTextMessage > json 넘어와서 
        webSocket.onmessage = function (message){
			
			var text = "";
	    	var msg = JSON.parse(message.data);
	    	//pushcount - > 총 알람 개수
	    	//pushcount2 - > 총 알람 수인데  메세지 모양 클릭했을때 뜨는 작은 모달?의 제일 상단.
			var resultpushCount = Number(msg.alarm)+Number(document.getElementById("pushcount").innerText);
			var divpushcount = document.getElementById("pushcount");
			var divpushcount2 = document.getElementById("pushcount2");
			//실질적으로 숫자를 넣어준다 
			divpushcount.innerHTML = resultpushCount;
			divpushcount2.innerHTML = resultpushCount;
			
			
			//span 태그 id 값들 뽑아서 그곳에 값 넣어준다. 숫자를 
			var resulttaskCount = Number(msg.work)+Number(document.getElementById("taskcount").innerText);			
			var divtaskcount = document.getElementById("taskcount");
			divtaskcount.innerHTML = resulttaskCount;
			/////////////////////////////////////////////
			
			var resultprojectCount = Number(msg.project)+Number(document.getElementById("projectcount").innerText);			
			var divprojectcount = document.getElementById("projectcount");
			divprojectcount.innerHTML = resultprojectCount;

			/* 미승인 프로젝트 추가시 개수*/
			var projectApprovalCount = Number(msg.projectApproval)+Number(document.getElementById("approveprojectcount").innerText);			
			var divapprovalcount = document.getElementById("approveprojectcount");
			divapprovalcount.innerHTML = projectApprovalCount;
			
			/*미승인 업무 개수                                    요거  broadsocket 에서 생성 한 것 모르겠으면 broadsocket ㄱㄱ*/
			var taskApprovalCount = Number(msg.workapproval)+Number(document.getElementById("taskApprovalcount").innerText);			
			var divtaskapprovalcount = document.getElementById("taskApprovalcount");
			divtaskapprovalcount.innerHTML = taskApprovalCount;
			
			/*참조된 전자 결재*/
			
			//최종 보스 allData - > 위에 선언한 데이터들의 값들을 뽑아서 넘겨준다. pollingchk.do 로 감  (PushController 로 이동 )
			var allData = { "pushcount" : resultpushCount, "projectcount" : resultprojectCount, "taskcount" : resulttaskCount, "taskApproval":taskApprovalCount, "projectApproval":projectApprovalCount};
			$(function(){
				
			$.ajax({
    			url : "pollingchk.do",
    			data : allData,
    			success : function(data) {
    				
    					}
    				});
    			})
        };
		
		//각 메뉴에서 수신자 선택하고 글쓰기 버튼 클릭시 send 붙여놓으면 수신자를 뽑아온다. 수신자와, 메뉴이름은 버튼위에 hidden 으로 셋팅해놈.
		//broadsocket.java  >  handleTextMessage 메서드로 들어감
		function send() {
			var msg = 
				 	{
				   	 type : "message",
					 emp_no : document.getElementById("hiddenEmp_no").value,
	   				 menuname : document.getElementById("hiddenMenuName").value
	   			  	}
			webSocket.send(JSON.stringify(msg));
		}
	
		webSocket.onclose = function(e) {
			console.log("연결 닫힘: " + e.reason);
		}
		
		

</script>
    