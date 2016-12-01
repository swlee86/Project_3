<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 구글 로그인 api Start -->
<!-- 행아웃 필요 스크립트 -->
<script src="https://apis.google.com/js/platform.js" async defer></script>
<meta name="google-signin-client_id" content="279959715456-km9o7eijb5j8sr8kn9i98dtmitu5l1tt.apps.googleusercontent.com">
<!-- 구글 로그인 api End -->
<!-- Header -->
<div id="header">
    <div class="color-line">
    </div>
    <div id="logo" class="light-version" >
    	<a href="index.do">
	        <span>
	            2PM
	        </span>
		</a>
    </div>
    <nav role="navigation">
        <div class="header-link hide-menu">
        	&nbsp;<i class="fa fa-bars"></i></div>
        <div class="small-logo">
            <span class="text-primary">HOMER APP</span>
        </div>
        <form role="search" class="navbar-form-custom" method="post" action="#">
            <div class="form-group">
                <input type="text" placeholder="Search something special" class="form-control" name="search">
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
							<a href="${pageContext.request.contextPath}/login.do">Login</a>
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
                <li class="dropdown">
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
                </li>
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
                                        <h5>Projects</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="mailbox.do">
                                        <i class="pe pe-7s-mail text-warning"></i>
                                        <h5>Email</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="contacts.do">
                                        <i class="pe pe-7s-users text-success"></i>
                                        <h5>Contacts</h5>
                                    </a>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <a href="free_board_list.do">
                                        <i class="pe pe-7s-comment text-info"></i>
                                        <h5>Forum</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="analytics.do">
                                        <i class="pe pe-7s-graph1 text-danger"></i>
                                        <h5>Refund</h5>
                                    </a>
                                </td>
                                <td>
                                    <a href="file_manager.html">
                                        <i class="pe pe-7s-box1 text-success"></i>
                                        <h5>Files</h5>
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
                    	<li>진행 중인 프로젝트는<span id="projectcount">${sessionprojectcount}</span>건입니다.</li>
                    	<li>승인 확인을 하셔야 하는 프로젝트는<span id="approveprojectcount">0</span>건입니다.</li>
                    	<li>미확인 하신 업무는<span id="taskcount">${sessiontaskcount}</span>건입니다.</li>
                        <li class="summary"><a href="#">See All Messages</a></li>
                    </ul>
                </li>
                <li>
                    <a href="#" id="sidebar" class="right-sidebar-toggle">
                        <i class="pe-7s-upload pe-7s-news-paper"></i>
                    </a>
                </li>
                
                <c:if test="${empty pageContext.request.userPrincipal}">
					<li>
						<a href="${pageContext.request.contextPath}/login.do">
							<i class="pe-7s-upload pe-rotate-90"></i>
						</a>
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

$('#birthDay').click(function(){
	$('#birthModal').modal();
});	

		var pushcount;
		var webSocket;
		webSocket = new WebSocket("ws://192.168.0.142:8090/epm/broadsocket.do");
		
        webSocket.onmessage = function (message){
			console.log("#########message : " + message.data);
			
			var text = "";
	    	var msg = JSON.parse(message.data);
	    	console.log("parsemsg______________ : " +msg);
			
			var resultpushCount = Number(msg.alarm)+Number(document.getElementById("pushcount").innerText);
			var divpushcount = document.getElementById("pushcount");
			var divpushcount2 = document.getElementById("pushcount2");
			divpushcount.innerHTML = resultpushCount;
			divpushcount2.innerHTML = resultpushCount;
			
			console.log("###########################msg.work : " + msg.work);
			
			var resulttaskCount = Number(msg.work)+Number(document.getElementById("taskcount").innerText);			
			console.log('#################"업무 결과값 "###########' + resulttaskCount)
			var divtaskcount = document.getElementById("taskcount");
			divtaskcount.innerHTML = resulttaskCount;
			
			
			
			
			var resultprojectCount = Number(msg.project)+Number(document.getElementById("projectcount").innerText);			
			var divprojectcount = document.getElementById("projectcount");
			divprojectcount.innerHTML = resultprojectCount;

			
			
			var allData = { "pushcount" : resultpushCount, "projectcount" : resultprojectCount, "taskcount" : resulttaskCount };
			$(function(){
				
    		$.ajax({
    			url : "pollingchk.do",
    			data : allData,
    			success : function(data) {
    				
    						}
    				})
    			})
        };
		
		function send() {
			var msg = 
				 	{
				   	 type : "message",
					 emp_no : document.getElementById("hiddenEmp_no").value,
	   				 menuname : document.getElementById("hiddenMenuName").value
	   			  	}
				 	
			console.log("메세지를 봅시다 : " +msg);
			webSocket.send(JSON.stringify(msg));
		}
	
		webSocket.onclose = function(e) {
			console.log("연결 닫힘: " + e.reason);
		}
		
	/* 	
		//기본 폴링방식
        $(function () {
            window.setInterval(function () {
                $.get("${pageContext.request.contextPath}/pollingchk.do", function (data) {

                });
            }, 15000);
            
        });
         
 */  
 /* 
        $(function () {
            
            (function longPolling() {
                $.ajax({
                    url: "${pageContext.request.contextPath}/pollingchk.do",
                    timeout: 10000,
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        if (textStatus == "timeout") { // 요청
                                longPolling(); // 재귀적 호출
                            // 기타 버그, 오류 등 같은 네트워크
                            } else { 
                                longPolling();
                            }
                        },
                    success: function (data, textStatus) {
                        if (textStatus == "success") { // 요청 성공
                            longPolling();
                        }
                    }
                });
            })();
            
        });
    */
</script>
    