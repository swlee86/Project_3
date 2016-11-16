<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!--직위 관리 페이지-->
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
					<li><a href="index.do">Dashboard</a></li>
					<li><span>Tables</span></li>
					<li class="active"><span>DataTables</span></li>
				</ol>
			</div>
			<h2 class="font-light m-b-xs">직위 관리</h2>
			<small>직위 정보 등록</small>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-6">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-inbox"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<h2>지점</h2>
						
									<h4 id="1" draggable="true" ondragstart="drag(event)">첫번째</h4>
									<h4 id="2" draggable="true" ondragstart="drag(event)">두번째</h4>
							
								<div id="div1" class="form-group" ondrop="drop(event)" ondragover="allowDrop(event)" style="border: 1px solid black; width: 100%; height: 50px;">
									<input type="button" class="btn btn-success" value="삭제">
								</div>
								<div id="div2" ondrop="drop(event)" ondragover="allowDrop(event)" style="border: 1px solid black; width: 100%; height: 50px;"></div>
								
								
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-lg-6">
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-inbox"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<h4>기본급여</h4>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="hpanel">
				<div class="v-timeline vertical-container animate-panel"
					data-child="vertical-timeline-block" data-delay="1">
					<div class="vertical-timeline-block">
						<div class="vertical-timeline-icon navy-bg">
							<i class="fa fa-inbox"></i>
						</div>
						<div class="vertical-timeline-content">
							<div class="p-sm">
								<h4>추가급여</h4>
							</div>
							<div class="panel-footer"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<script>
function allowDrop(ev) {
    ev.preventDefault();
}

function drag(ev) {
    ev.dataTransfer.setData("text", ev.target.id);
}

function drop(ev) {
    ev.preventDefault();
    var data = ev.dataTransfer.getData("text");
    ev.target.appendChild(document.getElementById(data));
}
</script>