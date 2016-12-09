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
				swal({
                    title: "사원 등록",
                    text: "사원 등록에 성공하였습니다"
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
				alert("다녀왔습니다.");
				console.log(data.detail);
				
				
				
				
			}
		});
	});
});