<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
	a{
		border: 0px none;
	}
</style>
<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
				<div class="panel-heading">
					<form class="form-inline">
						<div class="form-group">
								<span>내가 참여한 프로젝트 : </span>
								<p class="form-control" style="background-color: #9b59b6; margin-top:5px; width:50px;height:10px;color:#9b59b6;"></p>
						</div>
						<br/>
						<div class="form-group">				
							<span>내가 작성한 프로젝트 : </span>
							<p class="form-control" style="background-color: #F0AD4E;  margin-top:5px; width:50px;height:10px;color:#F0AD4E;"></p>
						</div>
					</form>
				</div>
				<div class="panel-body">
					<div id="fullCal"></div>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="CalendarModal" tabindex="-1" role="dialog"
	aria-hidden="true">
	<div class="modal-dialog modal-sm">
		<div class="modal-content">
			<div class="color-line"></div>
			<div class="modal-header">
				<h4 class="modal-title" id="projectId">
					
				</h4>
				<small class="font-bold">Lorem Ipsum is simply dummy text.</small>
			</div>
			<div class="modal-body">
				<input type="hidden" id="hiddenCal">
				<p>책임자 : <span id="charge"></span></p>
				<p>부서   : <span id="depart"></span></p>
				<hr/>
				<p>시작일 : <span id="startDate"></span></p>
				<p>종료일 : <span id="endDate"></span></p>
				<p>총 프로젝트 기간 : <span id="playProject"></span></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" id="calendar_DetailBtn" class="btn btn-primary" onclick="goProejct()">프로젝트 보러가기</button>
			</div>
		</div>
	</div>
</div>