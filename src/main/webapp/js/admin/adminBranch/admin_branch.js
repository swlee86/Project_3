//
//작성 일 : 2016-11-29
//작성 자 : 하재현
//목   적  : 관리자 > 지점 관리 메뉴에서 사용하는 js 파일

//우편 API 사용 시 씀.
function sample6_execDaumPostcode() {
	new daum.Postcode({
		oncomplete : function(data) {
			// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

			// 각 주소의 노출 규칙에 따라 주소를 조합한다.
			// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
			var fullAddr = ''; // 최종 주소 변수
			var extraAddr = ''; // 조합형 주소 변수

			// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
			if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				fullAddr = data.roadAddress;

			} else { // 사용자가 지번 주소를 선택했을 경우(J)
				fullAddr = data.jibunAddress;
			}

			// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
			if (data.userSelectedType === 'R') {
				//법정동명이 있을 경우 추가한다.
				if (data.bname !== '') {
					extraAddr += data.bname;
				}
				// 건물명이 있을 경우 추가한다.
				if (data.buildingName !== '') {
					extraAddr += (extraAddr !== '' ? ', ' + data.buildingName
							: data.buildingName);
				}
				// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
				fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')' : '');
			}

			// 우편번호와 주소 정보를 해당 필드에 넣는다.
			document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
			document.getElementById('sample6_address').value = fullAddr;

			// 커서를 상세주소 필드로 이동한다.
			document.getElementById('sample6_address2').focus();
		}
	}).open();
}

function sample6_execDaumPostcode2() {
	new daum.Postcode(
			{
				oncomplete : function(data) {
					// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

					// 각 주소의 노출 규칙에 따라 주소를 조합한다.
					// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
					var fullAddr = ''; // 최종 주소 변수
					var extraAddr = ''; // 조합형 주소 변수

					// 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
					if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
						fullAddr = data.roadAddress;

					} else { // 사용자가 지번 주소를 선택했을 경우(J)
						fullAddr = data.jibunAddress;
					}

					// 사용자가 선택한 주소가 도로명 타입일때 조합한다.
					if (data.userSelectedType === 'R') {
						//법정동명이 있을 경우 추가한다.
						if (data.bname !== '') {
							extraAddr += data.bname;
						}
						// 건물명이 있을 경우 추가한다.
						if (data.buildingName !== '') {
							extraAddr += (extraAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
						fullAddr += (extraAddr !== '' ? ' (' + extraAddr + ')'
								: '');
					}

					// 우편번호와 주소 정보를 해당 필드에 넣는다.
					document.getElementById('sample6_re_postcode').value = data.zonecode; //5자리 새우편번호 사용
					document.getElementById('sample6_re_address').value = fullAddr;

					// 커서를 상세주소 필드로 이동한다.
					document.getElementById('sample6_re_address2').focus();
				}
			}).open();
}

//부서  -  부서 관리 페이지에서 지점 선택시
function departMentFuc() {
	var choosePosition = '';
	$("#selectbranch option:selected").each(function() {
		choosePosition = $(this).val();
	});

	$.ajax({
		url : "departMentSelect.do",
		data : {
			branch_name : choosePosition
		},
		success : function(data) {
			var option = '<option>선택</option>';
			$.each(data.deptlist, function(index) {
				option += "<option value='" + data.deptlist[index].dept_no
						+ "'>" + data.deptlist[index].dept_name + "</option>";
			});
			$('#selectDept').html(option);
			alert('성공');
		}
	});
}

//하위부서  - 하위 부서 관리 페이지에서 지점 선택시 > 부서 selectbox
function showDeptFuc() {
	var choosePosition = '';
	$("#select_Branch option:selected").each(function() {
		choosePosition = $(this).val();
	});

	$.ajax({
		url : "departMentSelect.do",
		data : {
			branch_name : choosePosition
		},
		success : function(data) {
			var option = '<option>선택</option>';
			$.each(data.deptlist, function(index) {
				option += "<option value='" + data.deptlist[index].dept_no
						+ "'>" + data.deptlist[index].dept_name + "</option>";
			});
			$('#select_Dept').html(option);
			alert('성공');
		}
	});
}

//하위부서  - 하위 부서 관리 페이지에서 지점 선택시 > 부서 selectbox
function showDeptFuc2() {
	var choosePosition = '';
	$("#select_branch_add option:selected").each(function() {
		choosePosition = $(this).val();
	});

	$.ajax({
		url : "departMentSelect.do",
		data : {
			branch_name : choosePosition
		},
		success : function(data) {
			var option = '<option>선택</option>';
			$.each(data.deptlist, function(index) {
				option += "<option value='" + data.deptlist[index].dept_no
						+ "'>" + data.deptlist[index].dept_name + "</option>";
			});
			$('#select_Dept_add').html(option);
			alert('성공');
		}
	});
}

//하위부서 > 조회 > 부서 선택시 하위부서 selectbox
function showLowDeptFuc() {
	var choosePosition = '';
	$("#select_Dept option:selected").each(function() {
		choosePosition = $(this).val();
		alert(" 선택 : " + choosePosition)
	});
	$.ajax({
		url : "lowDeptSelect.do",
		data : {
			dept_name : choosePosition
		},
		success : function(data) {
			console.log(data.lowdeptlist);
			var option = '<option>선택</option>';
			$.each(data.lowdeptlist, function(index) {
				option += "<option value='"
						+ data.lowdeptlist[index].low_dept_no + "'>"
						+ data.lowdeptlist[index].low_dept_name + "</option>";
			});
			$('#select_Low_Dept').html(option);
			alert('성공');
		}
	});

}

//지점 등록시 체크 통과하면 지점 만듬
function addBranch_Check() {

	$.ajax({
		url : "branchAdd.do",
		data : {
			branch_name : $('#addbranchName').val(),
			postcode : $('#sample6_postcode').val(),
			addr : $('#sample6_address').val(),
			addr_detail : $('#sample6_address2').val()
		},
		success : function(data) {
			console.log(data.result);
			if (data.result > 0) {
				//alert("등록 성공!");
				 toastr.warning('등록 성공');
				window.location.reload();
			} else {
				//alert("등록 실패!!");
				 toastr.warning('등록 실패');
			}
		}
	});
}

//부서 등록시 체크 통과하면 부서 만듬
function addDept_Check(){
	
    var date = dateChek();
	var DeptJoinBonus = {
		branch_name : $('#addbranch_name').val(),
		dept_name : $('#adddept_name').val(),
		bonus_percent : $('#addbonus_percent').val(),
		set_date : date
	};
	console.log(":::DDDD : " + DeptJoinBonus.branch_name);

	$.ajax({
		url : "deptAdd.do",
		data : DeptJoinBonus,
		success : function(data) {
			console.log(data.result);
			alert(data.result);
			window.location.reload();
		}
	});	
  }

$(function() {

	//지점 추가 디브 
	$('#addBrunchDiv').hide();

	//지점 왼쪽 디브 등록
	$('#addBrunchBtn').click(function() {
		$('#addBrunchDiv').show();
	});

	//지점등록 폼 버튼 클릭시
	$('#addBranchsubmitBtn').click(function() {

		var branch_Name = $('#addbranchName').val();
		var post = $('#sample6_postcode').val();
		var address1 = $('#sample6_address').val();
		var address2 = $('#sample6_address2').val();

		if (branch_Name == '') {
			alert("지점명을 입력해 주세요 !");
			$('#addbranchName').focus();
			return false;
		} else if (post == '') {
			alert("우편번호를 입력해 주세요 !");
			$('#sample6_postcode').focus();
			return false;
		} else if (address1 == '') {
			alert("기본 주소를 입력해주세요 !");
			$('#sample6_address').focus();
			return false;
		} else if (address2 == '') {
			alert("상세 주소를 입력해주세요 !");
			$('#sample6_address2').focus();
			return false;
		} else {
			
			alert("$('#addbranchName').val()"+$('#addbranchName').val());
			
			$.ajax({

				url : "CheckBranch_Name.do",
				data : {
					branch_name : $('#addbranchName').val(),
				},
				success : function(data) {
					//등록 가능
					if (data.result == '성공') {
						alert("등록가능한 지점 이름입니다.");
						addBranch_Check();
					} else {
						alert("동일한 지점이 존재합니다. 이름을 변경해 주세요!");
						return false;
					}

				}
			});

		}

	});

	//지점 셀렉트 박스 선택후 조회 버튼 클릭시 호출.
	$('#seeBranchBtn').click(function() {
						var select = $(
								"#departMentselectBranch option:selected")
								.val();
            if(select=="선택"){
            	alert('조회하실 지점을 선택해주세요');
            }else{
            	$.ajax({
					url : "selectBranchList.do",
					data : {
						selectBranchName : select
					},
					success : function(data) {
						$.each(data, function(index) {

							$('#hidden').val(data[index].branch_no);
							$('#hiddenBranchName').val(
									data[index].branch_name);

							$('#branchName2').val(
									data[index].branch_name);
							$('#branchName2').attr("readonly", false);

							$('#sample6_re_postcode').val(
									data[index].postcode);
							$('#sample6_re_postcode').attr("readonly",
									false);

							$('#sample6_re_address').val(
									data[index].addr);
							$('#sample6_re_address').attr("readonly",
									false);

							$('#sample6_re_address2').val(
									data[index].addr_detail);
							$('#sample6_re_address2').attr("readonly",
									false);
						});

					},
					error : function() {
						
						alert("조회하신 결과가 존재하지 않습니다!");
						
						$('#branchName').val('');
						$('#branchName').attr("readonly", true);

						$('#postcode').val('');
						$('#postcode').attr("readonly", true);

						$('#addr').val('');
						$('#addr').attr("readonly", true);

						$('#addr_detail').val('');
						$('#addr_detail').attr("readonly", true);
					}
				});
              }
						
		});

	//지점 정보 수정 버튼 클릭시
	$('#modifyBranchsubmitBtn').click(function() {
		$.ajax({
			url : "branchModify.do",
			data : {
				notChange_branch_Name : $('#hiddenBranchName').val(),
				branch_no : $('#hidden').val(),
				branch_name : $('#branchName2').val(),
				postcode : $('#sample6_re_postcode').val(),
				addr : $('#sample6_re_address').val(),
				addr_detail : $('#sample6_re_address2').val()
			},
			success : function(data) {
				console.log(data.result);
				if (data.result > 0) {
					alert('정보수정 성공');
					window.location.reload();
				} else {
					alert('정보수정 실패');
				}

			}
		});
	});

	//지점 삭제 버튼 클릭시
	$('#deleteBranchsubmitBtn').click(function() {
		console.log($('#hidden').val() + " 삭제할 지점 번호~~~~");

		$.ajax({
			url : "branch_delete.do",
			data : {
				branch_no : $('#hidden').val()
			},
			success : function(data) {

				console.log(data.result);
				alert(data.result);

				if (data.result == '삭제 성공') {
					window.location.reload();
				} else {
					return false;
				}

			}
		});

	});

	//부서 등록 div 숨김
	$('#addDepartmentDiv').hide();

	//부서 등록 버튼 클릭시 등록 form 보여줌
	$('#addDepartmentBtn').click(function() {
		var select = $("#choosebranch option:selected").val();
		if (select == '선택') {
			alert('부서를 등록하실 지점을 선택하세요')
			$('#addbranch_name').val('');
		} else {
			$('#addDepartmentDiv').show();
			$('#addbranch_name').val(select);
			$('#addbranch_name').attr("readonly", true);
		}

	});

	//부서 조회 버튼 클릭시
	$('#seeDeptBtn').click(function() {
		var select = $("#selectDept option:selected").val();
		$.ajax({
			url : "selectDeptList.do",
			data : {
				dept_no : select
			},
			success : function(data) {

				//hidden
				$('#hiddept_no').val(data.dept.dept_no);
				$('#hidbranch_no').val(data.dept.branch_no);
				$('#hidbranch_name').val(data.dept.branch_name);

				$('#branch_name').val(data.dept.branch_name);

				$('#dept_name').val(data.dept.dept_name);
				$('#dept_name').attr("readonly", false);

				$('#bonus_percent').val(data.dept.bonus_percent);
				$('#bonus_percent').attr("readonly", false);

			},
			error : function() {
				alert("부서를 선택해주세요!");

				$('#branch_name').val('');
				$('#branch_name').attr("readonly", true);

				$('#dept_name').val('');
				$('#dept_name').attr("readonly", true);

				$('#bonus_percent').val('');
				$('#bonus_percent').attr("readonly", true);
			}

		});

	});

	//부서 정보 수정 버튼 클릭시
	$('#modifyDeptBtn').click(
			function() {

				var date = dateChek();
				var dto = {
					dept_no : $('#hiddept_no').val(),
					branch_no : $('#hidbranch_no').val(),
					branch_name : $('#hidbranch_name').val(),
					dept_name : $('#dept_name').val(),
					bonus_percent : $('#bonus_percent').val(),
					set_date : date
				};
				console.log(dto.dept_name + " / " + dto.bonus_percent + " / "
						+ dto.set_date + "/ hidden ----: " + dto.dept_no
						+ " / " + dto.branch_no + " / " + dto.branch_name);

				$.ajax({
					url : "modifyDept.do",
					data : dto,
					success : function(data) {
						alert(data.result);
						window.location.reload();
					}

				});
			});

//부서 등록 버튼 클릭시
	$('#insertDeptBtn').click(function() {

	    var dept_name =$('#adddept_name').val();
		var bonus_percent=$('#addbonus_percent').val();
		
		if($('#adddept_name').val()==""){
			 toastr.warning("부서명을 입력해주세요");
			 $('#adddept_name').focus();
	         return false;
		}else if($('#addbonus_percent').val()==""){
			toastr.warning("상여금 지급비율을 입력해주세요");
			 $('#addbonus_percent').focus();
	         return false;
		}
	});

	//부서 삭제하기
	$('#deleteDeptBtn').click(function() {
		console.log(" 부서 번호 > 삭제: " + $('#hiddept_no').val());

		$.ajax({
			url : "dept_delete.do",
			data : {
				dept_no : $('#hiddept_no').val()
			},
			success : function(data) {

				console.log(data.result);
				alert(data.result);

				if (data.result == '삭제 성공') {
					window.location.reload();
				} else {
					return false;
				}

			}
		});

	});

	//하위부서 추가 영역
	$('#addDiv').hide();
	//하위부서 정보 보기 영역
	$('#seeAndModifyDiv').show();

	//부서관리 - 지점 보기 페이지 이동. 
	$('#moveBranchBtn').click(function() {
		location.href = "adminBranch.do";
	});

	//부서 관리 페이지
	$('#moveDepartBtn').click(function() {
		location.href = "adminDepartment.do";
	});

	//하위 부서 관리 페이지
	$('#moveDepartDownBtn').click(function() {
		location.href = "adminDownDepartment.do";
	});

	//하위부서 조회 버튼 클릭시
	$('#seeDepartBtn').click(function() {
		$('#seeAndModifyDiv').show();
		$('#addDiv').hide();

		var select = $("#select_Low_Dept option:selected").val();
		$.ajax({
			url : "search_low_dept.do",
			data : {
				low_dept_no : select
			},
			success : function(data) {
				alert('조회 성공');
				console.log(data.low_dept);

				$('#hiddendept_no').val(data.low_dept.dept_no);
				$('#hiddenbranch_name').val(data.low_dept.branch_name);
				$('#hiddenlow_dept_no').val(data.low_dept.low_dept_no);

				$('#dept_name').val(data.low_dept.dept_name);

				$('#low_dept_name').val(data.low_dept.low_dept_name);
				$('#low_dept_name').attr("readonly", false);

				$('#tel').val(data.low_dept.tel);
				$('#tel').attr("readonly", false);

				$('#fax').val(data.low_dept.fax);
				$('#fax').attr("readonly", false);

				$('#in_time').val(data.low_dept.in_time);
				$('#in_time').attr("readonly", false);

				$('#out_time').val(data.low_dept.out_time);
				$('#out_time').attr("readonly", false);

				$('#open').val(data.low_dept.open);
				$('#open').attr("readonly", false);

				$('#close').val(data.low_dept.close);
				$('#close').attr("readonly", false);

			},
			error : function() {
				alert("조회하실 조건을 선택해주세요!");

				$('#dept_name').val('');
				$('#dept_name').attr("readonly", true);

				$('#low_dept_name').val('');
				$('#low_dept_name').attr("readonly", true);

				$('#tel').val('');
				$('#tel').attr("readonly", true);

				$('#fax').val('');
				$('#fax').attr("readonly", true);

				$('#in_time').val('');
				$('#in_time').attr("readonly", true);

				$('#out_time').val('');
				$('#out_time').attr("readonly", true);

				$('#open').val('');
				$('#open').attr("readonly", true);

				$('#close').val('');
				$('#close').attr("readonly", true);
			}

		});

	});

	//하위 부서 추가 버튼 클릭시
	$('#addDownDepartBtn').click(function() {
		$('#addDiv').show();
		$('#seeAndModifyDiv').hide();
	});

	//하위 부서 추가
	$('#addlowDeptBtn')
			.click(
					function() {

						var date = dateChek();

						var LowDeptJoin = {
							branch_name : $(
									"#select_branch_add option:selected").val(),
							dept_no : $("#select_Dept_add option:selected")
									.val(),
							dept_name : $("#select_Dept_add option:selected")
									.text(),
							low_dept_name : $('#add_low_dept_name').val(),
							tel : $('#add_tel').val(),
							fax : $('#add_fax').val(),
							in_time : $('#add_in_time').val(),
							out_time : $('#add_out_time').val(),
							open : $('#add_open').val(),
							close : $('#add_close').val(),
							set_date : date
						};
						console.log(":::DDDD : " + LowDeptJoin.branch_name
								+ " / " + LowDeptJoin.dept_no + " / "
								+ LowDeptJoin.low_dept_name);

						$.ajax({
							url : "add_lowDept.do",
							data : LowDeptJoin,
							success : function(data) {
								console.log(data.result);
								alert(data.result);
								window.location.reload();
							}
						});

					});

	//하위 부서 수정
	$('#lowDeptModifyBtn').click(
			function() {

				var date = dateChek();

				var LowDeptJoin = {
					low_dept_no : $('#hiddenlow_dept_no').val(),
					dept_no : $('#hiddendept_no').val(),
					branch_name : $('#hiddenbranch_name').val(),
					dept_name : $("#dept_name").val(),
					low_dept_name : $('#low_dept_name').val(),
					tel : $('#tel').val(),
					fax : $('#fax').val(),
					in_time : $('#in_time').val(),
					out_time : $('#out_time').val(),
					open : $('#open').val(),
					close : $('#close').val(),
					set_date : date
				};
				console.log(":::DDDD :  하위부서번호 : " + LowDeptJoin.low_dept_no
						+ " / " + LowDeptJoin.dept_name + " / "
						+ LowDeptJoin.dept_no + " / "
						+ LowDeptJoin.low_dept_name + " / "
						+ LowDeptJoin.branch_name);

				$.ajax({
					url : "low_dept_Modify.do",
					data : LowDeptJoin,
					success : function(data) {
						alert('수정 성공');
						console.log(data.result);
						alert(data.result);
						window.location.reload();
					}
				});

			});

	//하위부서 삭제버튼 클릭시 
	$('#deleteDownDepartBtn').click(function() {
		console.log("하위 부서 번호 > 삭제 : " + $('#hiddenlow_dept_no').val());
		$.ajax({
			url : "low_dept_delete.do",
			data : {
				low_dept_no : $('#hiddenlow_dept_no').val()
			},
			success : function(data) {
				console.log(data.result);
				alert(data.result);
				window.location.reload();
			}
		});

	});

	//개발부서 클릭시 아작스 이용
	$('#depart')
			.click(
					function() {

						$
								.ajax({
									url : "adminDepart_depart.do",
									data : {
										"depart" : $('#depart').html()
									},
									success : function(data) {
										console.log(data);
										var text = "<h3>" + $('#depart').html()
												+ "</h3>";
										text += "<table class='table'><tr><th></th><th>이름</th><th>나이</th>";

										$
												.each(
														data,
														function(index) {
															console.log(index);
															text += "<tr><td><input type='checkbox'></td><td>"
																	+ data[index].name
																	+ "</td><td>"
																	+ data[index].age
																	+ "</td><tr/>";
														});

										text += "</table>";
										text += "<input type='button' class='btn btn-default' value='버튼입니다'>";
										$('#departList').html('');
										$('#departList').html(text);
									}
								});

					});

});

//날짜 포맷팅 함수 
function dateChek() {
	var date = new Date();
	var year = date.getFullYear();
	var month = date.getMonth() + 1; // 0부터 시작하므로 1더함 더함
	var day = date.getDate();

	if (("" + month).length == 1) {
		month = "0" + month;
	}
	if (("" + day).length == 1) {
		day = "0" + day;
	}
	//오늘 날짜 전역변수에도 담음
	var today = year + "-" + month + "-" + day;
	return today;
}
