<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-12">
			<div class="hpanel">
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
				<p>시작일 : <span id="startDate"></span></p>
				<p>종료일 : <span id="endDate"></span></p>
				<p>총 프로젝트 기간 : <span id="playProject"></span></p>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button type="button" class="btn btn-primary">프로젝트 보러가기</button>
			</div>
		</div>
	</div>
</div>