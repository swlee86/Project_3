<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="normalheader transition animated fadeIn">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>
			</a>

			<div id="hbreadcrumb" class="pull-right m-t-lg">
				<ol class="hbreadcrumb breadcrumb">
					<li><a href="index.html">Dashboard</a></li>
					<li><span>App views</span></li>
					<li class="active"><span>Contacts</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">조직도</h2>
			<small>우리는 같은팀의 멤버입니다 복종하세요</small>
		</div>
	</div>
</div>

<div class="content animate-panel">

	<div class="row">
		<div class="col-md-3">
			<div class="hpanel panel-group" id="accordion" role="tablist" aria-multiselectable="true">
				<div class="panel-body">
					<a data-toggle="collapse" data-parent="#accordion" href="#organization" aria-expanded="true" id="organicSelect"> 
					<i class="fa fa-chevron-down pull-right text-muted"></i> 조직도
					</a>
					<div>
					<hr>
					<div class="panel-collapse collapse" id="organization">
					</div>
					</div>
				</div>
			</div>
		</div>

		<div class="col-md-9">
			<div class="hpanel">
			 <div class="border-top border-left border-right bg-light">
                        <div class="p-m">
						<font size="4em"><b>부서정보</b> <i class="fa fa-list-alt"></i></font><br>
                            <div>
                                <span class="font-extra-bold">부서장 : </span>
                              	 박지은
                            </div>
                            <div>
                                <span class="font-extra-bold">전화번호 : </span>
                              	031-123-1234
                            </div>
                            <div>
                                <span class="font-extra-bold">총 인원 : </span>
                                12명
                            </div>
                            <div>
                                <span class="font-extra-bold">담당업무 : </span>
                                	사회복지(아동, 노인, 장애인 등)
                            </div>
                        </div>
                    </div>
				<div class="panel-body">
					<div class="row" id="empList">

					</div>
				</div>
			</div>
		</div>
	</div>
</div>



<c:forEach var="elist" items="${elist}">
<div class="modal fade hmodal-success" id="myModal${elist.emp_no}" tabindex="-1"
	role="dialog" aria-hidden="true">
	<div class="modal-dialog  modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header text-center">
				<h4 class="modal-title">
					<img alt="logo" class="img-circle m-b" src="images/a3.jpg" style="width: 82px; height: 82px;">
				</h4>
				<br> <font class="font-bold" size="2em"> <font
					style="color: gray;">${elist.emp_name}&nbsp;${elist.emp_no}</font><br> <font
					style="color: #9d9fa2">${elist.branch_name} > <br>${elist.dept_name} > ${elist.low_dept_name}
				</font> <br> <font style="color: gray;">${elist.cell_phone}</font>
				</font>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default btn-sm"
					data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary btn-sm demo2">주소록
					등록</button>
			</div>
		</div>
	</div>
</div>
</c:forEach>