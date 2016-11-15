<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
li{
 	list-style: none;   
 	margin: 0px;
    padding: 0px;
    border: 1px solid black;
    color: white; 
    background-color: #2d2d2d; 
    /* float: left;               */
    line-height: 30px;        /*   글씨가 가운데로 오도록 설정하기 위해 한줄의 높이를 30px로 설정 */
    vertical-align: middle;   /* 세로 정렬을 가운데로 설정(위의 line-height와 같이 설정 필요함) */
    text-align: center;  

 }
</style>
</head>
<body>
<h3>본부장</h3>
<ul>
    <li><a href=""><h4>관리과</h4></a>
        <ul>
            <li><a href="">총무팀</a></li>
            <li><a href="">총무팀</a></li>
            <li><a href="">총무팀</a></li>
        </ul>
    </li>
    <li><a href=""><h4>도로건설과</h4></a>
        <ul>
            <li><a href="">간선도로팀</a></li>
            <li><a href="">지방도로팀</a></li>
            <li><a href="">도로시설팀</a></li>
            <li><a href="">도로환경개선팀</a></li>
            <li><a href="">품질시험팀</a></li>
        </ul>
    </li>
 </ul>   
    <select>
    	<option style="background-color: red;">테s스트</option>
    	<option  style="background-image:url(images/a1.jpg);">테스트</option>
    </select>
.......
.......
									<div class="row">
											<form action="" class="form-inline ">
										 <div class="form-group">
												<select class="form-control input-sm">
													<option>이름</option>
													<option>회사명</option>
													<option>메일</option>
												</select>
													</div>
													 <div class="form-group">	
												<div class="input-group">
													<input type="text" class="form-control input-sm" name="s" />
													<span class="input-group-btn">
														<button class="btn btn-default input-sm" type="submit">
															<span class="fa fa-search"></span>
														</button>
													</span>
												</div>
												</div>
											</form>
									</div>
</body>
</html>