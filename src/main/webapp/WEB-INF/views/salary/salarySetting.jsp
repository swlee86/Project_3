<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="normalheader transition animated fadeIn">
	<div class="hpanel">
		<div class="panel-body">
			<a class="small-header-action" href="">
				<div class="clip-header">
					<i class="fa fa-arrow-up"></i>
				</div>

			</a>
			<div class="row">
				<div class="form-group col-sm-4">
					<h2 class="font-light m-b-xs">급여 항목 설정</h2>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-sm-4">
					<label class="col-sm-4 control-label">사업장</label> <select
						class="form-control m-b" name="account">
						<option>회사명</option>
					</select>
				</div>
				<div class="form-group col-sm-4">
					<label class="col-sm-4 control-label">지급공제</label> <select
						class="form-control m-b" name="account">
						<option>지급</option>
						<option>공제</option>
					</select>
				</div>
				<div class="form-group col-sm-4">
					<br /> <input type="button"
						class="col-sm-offset-8 btn btn-default" value="검색"
						style="margin-top: 5px;">
				</div>
			</div>
		</div>
		<div class="panel-footer">

			<p>
				<i class="pe-7s-attention"></i><span class="font-icon-name"></span>
				&nbsp;계산식 정보에 조회되는 항목은 급여 항목설정에서 계산항목으로 선택된 항목이 조회됩니다.
			</p>
			<p>
				<i class="pe-7s-attention"></i><span class="font-icon-name"></span>
				&nbsp; 계산식은 항목정보1, 항목정보2, 연산자정보, 숫자정보를 선택해 조합해서 작성하면 됩니다 예)수당일때 :
				P01항목에 209로 나누고 T01을 곱한 값에 1.5를 곱하는 경우 ((P01/209)*T01)*1.5
			</p>
		</div>
	</div>
</div>


<div class="content animate-panel">
	<div class="row">
		<div class="col-lg-4">
			<div class="hpanel">
				<div class="panel-body">
					<h4>
						<i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;항목정보
					</h4>
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1" class="table">
							<tr>
								<th>첫번째</th>
								<th>두번째</th>
							</tr>
							<tr>
								<td>테스트</td>
								<td>테스트2</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-8">
			<div class="hpanel">

				<div class="panel-body">
					<h4>
						<i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;항목정보
					</h4>
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1" class="table">
							<tr>
								<th>첫번째</th>
								<th>두번째</th>
							</tr>
							<tr>
								<td>테스트</td>
								<td>테스트2</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
			<div class="hpanel">

				<div class="panel-body">
					<h4>
						<i class="pe-7s-angle-right"></i><span class="font-icon-name"></span>&nbsp;&nbsp;&nbsp;계산식 정보
					</h4>
					<div class="table-responsive">
						<table cellpadding="1" cellspacing="1" class="table">
							<tr>
								<th>항목명</th>
								<th>계산식</th>
							</tr>
							<tr>
								<td>테스트</td>
								<td>테스트2</td>
							</tr>
						</table>
					</div>
				</div>
		</div>	
	</div>		
</div>