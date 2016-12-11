/*
 * 작성자 : 백승아
 * 작성일 : 2016-12-09
 * 목  적 : 사원관리 전용 js 
 */

// 시간 딜레이 함수
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
// 뒤로가기 함수
function back() {
	history.back();
}

$(function() {
	// 지점이 변경되었을 때
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
	
	// 부서가 변경되었을 때
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
	
	// 사원 등록버튼을 눌렀을 때
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

	// 탈퇴 요청자에서 tr을 눌렀을 때
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
	
	// 사원 이력보기 버튼을 눌렀을 떄
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
				table += "<th>이력변경일</th>";
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
					if(index == 0) {
						table += "<td>" + data.list[index].regdate + "</td>";
					} else if(data.list[index].his_no == data.list[index-1].his_no) {
						table += "<td></td>";
					} else {
						table += "<td>" + data.list[index].regdate + "</td>";
					}
					table += "</tr>";
				});
				table += "</tbody>";
				
				$("#dataTable").append(table);
				
				backBtn = "<input type='button' class='pull-right btn btn-default btn-md' value='돌아가기' onclick='window.location.reload()'>";
				$("#page_panel").append(backBtn);
			}
		});
	});
	
	// 탈퇴 요청자에서 삭제버튼을 눌렀을 때
	$(".deleteBtn").click(function() {
		// var emp_no = $(this).contents(":eq(0)").text();
		var emp_no = $(this).parent().parent().contents(":eq(0)").text();
		console.log(emp_no);
		alert("찍히긴해?  : " + emp_no);
		
		swal({
            title: emp_no,
            text: "정말 삭제하시겠습니까?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#DD6B55",
            confirmButtonText: "삭제",
            cancelButtonText: "취소",
            closeOnConfirm: false,
            closeOnCancel: false },
        function (isConfirm) {
            if (isConfirm) {
            	$.ajax({
        			url		: "adminEmp_delete.do",
        			type	: "post",
        			data	: {
        						emp_no : emp_no
        					  },
        			success	: function() {
                        swal("삭제", "삭제되었습니다", "success");
        			}
        		})
            } else {
                swal("취소", "취소되었습니다", "error");
            }
        });
	});
	
	// 권한 부여에서 직위의 적용 버튼을 눌렀을 때
	$(".applyBtn").click(function() {
		var position_no = $(this).parent().prev().contents(":eq(1)").val();
		var checklist = new Array();
		
		$(this).parent().find("input[name=checklist]:checked").each(function(i) {
			var check = $(this).parent().find("input[name=checklist]:checked").val();
			checklist.push(check);
		});
		
		var param = JSON.stringify(checklist);
		
		$.ajax({
			url		: "adminEmp_authority.do",
			type	: "post",
			data	: {
						position_no : position_no,
						param : param
					  },
			success	: function(data) {
				swal({
                    title: "권한부여",
                    text: "권한부여에 성공하였습니다",
                    type: "success"
                });	
				
				wait(2000);
				window.location.reload();
			}
		})
	});
	
	// 상세보기 버튼을 눌렀을 때
	$(".detailBtn ").click(function() {
		var position_no = $(this).parent().prev().contents(":eq(1)").val();
		var url = "adminAuthority_detail.do?position_no="+position_no;
		
		$(location).attr("href", url);
	});
	
	// 드래그앤드롭 적용
	$(".sortable").sortable({
        forcePlaceholderSize: true,
        opacity: 0.8
	});
	
	// 드롭하는 영역
	$(".dragarea").droppable({
		drop: function(event, ui) {
			
        }
	})
});