/*
 * 작성자 : 백승아
 * 작성일 : 2016-12-09
 * 목  적 : 사원관리 전용 js 
 */
function wait(msecs) {
	var start = new Date().getTime();
	var cur = start;
	
	while(cur - start < msecs) {
		cur = new Date().getTime();
	}
};

//뒤로가기 버튼
$("#backBtn").click(function() {
	history.back();
});

function back() {
	history.back();
}

$(function() {
	$("#branchlist").change(function() {
		var branch_no = $(this).val();
		var addHtml = "";
		
		if(branch_no != '0') {
			$.ajax({
				url		: "selectBranch.do",
				type	: "post",
				data	: {
							branch_no : branch_no
						  },
				success	: function(data) {
					$("#deptlist").empty();
					$("#deptlist").removeAttr("disabled");
					addHtml = "<option var='0' selected>선택 안함</option>";
					
					$.each(data.dept, function(index) {
						addHtml += "<option value='" + data.dept[index].dept_no + "'>" + data.dept[index].dept_name + "</option>";
					});
					
					$("#deptlist").append(addHtml);
				}
			});
		} else {
			$("#deptlist").empty();
			$("#deptlist").attr("disabled", "disabled");
			addHtml = "<option var='0' selected>지점을 선택해주세요</option>";
			$("#deptlist").append(addHtml);
			
			$("#low_dept_list").empty();
			$("#low_dept_list").attr("disabled", "disabled");
			var addHtml2 = "<option var='0' selected>부서를 선택해주세요</option>";
			$("#low_dept_list").append(addHtml2);
		};
	});
	
	$("#deptlist").change(function() {
		var dept_no = $(this).val();
		var addHtml = "";
		
		if(dept_no != '0') {
			$.ajax({
				url		: "selectDept.do",
				type	: "post",
				data	: {
							dept_no : dept_no
						  },
				success	: function(data) {
					$("#low_dept_list").empty();
					$("#low_dept_list").removeAttr("disabled");
					addHtml = "<option var='0' selected>선택 안함</option>";
					
					$.each(data.low_dept, function(index) {
						addHtml += "<option value='" + data.low_dept[index].low_dept_no + "'>" + data.low_dept[index].low_dept_name + "</option>";
					});
					
					$("#low_dept_list").append(addHtml);
				}
			})
		} else {
			$("#low_dept_list").empty();
			$("#low_dept_list").attr("disabled", "disabled");
			addHtml = "<option var='0' selected>부서를 선택해주세요</option>";
			$("#low_dept_list").append(addHtml);
		}
	});
	
	$("#submitBtn").click(function() {
		var form = $("#addmember").serialize();
		
		$.ajax({
			url		: "adminAdd_member_ok.do",
			type	: "post",
			data	: form,
			success : function(data) {
				// swal 창이 안뜨는것 같다 이거 한번 체크해 볼것
				swal({
                    title: "사원 등록",
                    text: "사원 등록에 성공하였습니다",
                    type: "success"
                });
				
				wait(3000);
   			 	location.href("adminEmp_list.do");
			}
		})
	});

	$(".trClick").click(function() {
		var emp_no = $(this).contents(":eq(0)").text();
		
		$.ajax({
			url		: "adminEmp_withdrawal_detail.do",
			type	: "post",
			data	: {
						emp_no : emp_no
					  },
			success	: function(data) {
				$("#detail_panel").css("visibility","visible");
				
				$("#pic").empty();
				$("#pic").attr("src", "images/a3.jpg");
				/*$("#pic").attr("src", "images/"+data.detail.pic);*/
				$("#emp_name").empty();
				$("#emp_name").append(data.detail.emp_name);
				$("#emp_no").empty();
				$("#emp_no").append(data.detail.emp_no);
				$("#attach").empty();
				$("#attach").append(data.detail.branch_name + " " + data.detail.dept_name + " " + 
									data.detail.low_dept_name + " " + data.detail.position_name);
				$("#cell_phone").empty();
				$("#cell_phone").append(data.detail.cell_phone);
				$("#emp_tel").empty();
				$("#emp_tel").append(data.detail.emp_tel);
				$("#salary").empty();
				$("#salary").append(data.detail.salary + "  만원");
				$("#regdate").empty();
				$("#regdate").append(data.detail.regdate);
				$("#birth").empty();
				$("#birth").append(data.detail.birth);
			}
		});
	});
	
	
	$(".emp_hisBtn").click(function() {
		var emp_no = $(this).parent().parent().contents(":eq(0)").text();
		var table = "";
		var backBtn = "";
		
		$.ajax({
			url		: "adminEmp_his.do",
			type	: "post",
			data 	: {
						emp_no : emp_no
					  },
			success	: function(data) {
				$("#totalcount").empty();
				$("#search_panel").empty();
				$("#addbtn_panel").empty();
				$("#dataTable").empty();
				$("#page_panel").empty();
				
				table = "<thead> <tr style='background-color:#f9fafc'>";
				table += "<th>사원번호</th>";
				table += "<th>지 점</th>";
				table += "<th>부 서</th>";
				table += "<th>하위부서</th>";
				table += "<th>직 위</th>";
				table += "<th>이 름</th>";
				table += "<th>근무상태</th>";
				table += "<th>이력</th>";
				table += "<th>권한</th>";
				table += "</tr> </thead>";
				
				table += "<tbody>";
				$.each(data.list, function(index) {
					table += "<tr id='tr'>";
					table += "<td>" + data.list[index].emp_no + "</td>";
					table += "<td>" + data.list[index].branch_name + "</td>";
					table += "<td>" + data.list[index].dept_name + "</td>";
					table += "<td>" + data.list[index].low_dept_name + "</td>";
					table += "<td>" + data.list[index].position_name + "</td>";
					table += "<td>" + data.list[index].emp_name + "</td>";
					table += "<td>" + data.list[index].cg_name + "</td>";
					table += "<td>" + data.list[index].his_cg_name + "</td>";
					table += "<td>" + data.list[index].role_name + "</td>";
					table += "</tr>";
				});
				table += "</tbody>";
				
				$("#dataTable").append(table);
				
				backBtn = "<input type='button' class='pull-right btn btn-default btn-md' value='돌아가기' onclick='window.location.reload()'>";
				$("#page_panel").append(backBtn);
			}
		});
	});
	
});