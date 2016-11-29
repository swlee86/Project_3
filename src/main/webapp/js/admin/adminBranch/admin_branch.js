//
//작성 일 : 2016-11-29
//작성 자 : 하재현
//목   적  : 관리자 > 지점 관리 메뉴에서 사용하는 js 파일


//우편 API 사용 시 씀.
function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
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
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
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
    new daum.Postcode({
        oncomplete: function(data) {
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
            if(data.userSelectedType === 'R'){
                //법정동명이 있을 경우 추가한다.
                if(data.bname !== ''){
                    extraAddr += data.bname;
                }
                // 건물명이 있을 경우 추가한다.
                if(data.buildingName !== ''){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
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
function departMentFuc(){
	var choosePosition = '';
	 $("#selectbranch option:selected").each(function () {
         choosePosition = $(this).val();
      });
    
	alert("테스트 : "+choosePosition);
	$.ajax(
			  {
					url : "departMentSelect.do",
					data : {
								branch_no : option 
						   },
					success : function(data){
						console.log(data.deptlist);
						alert('성공');
					}
	          }
		  );
}


  $(function(){
	 
		//지점 추가 디브 
		$('#addBrunchDiv').hide();
		
		//지점 왼쪽 디브 등록
		$('#addBrunchBtn').click(function(){
			$('#addBrunchDiv').show();	
		});
		
		//지점등록 폼 버튼 클릭시
		$('#addBranchsubmitBtn').click(function(){
		
			
			$.ajax(
					   {
							url : "branchAdd.do",
							data : 
									{
										branch_name :  $('#addbranchName').val(),
										postcode : $('#sample6_postcode').val(),
										addr : 	$('#sample6_address').val(),
										addr_detail : $('#sample6_address2').val()
									},
							success : function(data){
								console.log(data.result);
								if(data.result > 0){
								alert("등록 성공!");
								window.location.reload();
								}else{
									alert("등록 실패!!");
								}
							}
			           }
			      );
			
		});
		
		//지점 셀렉트 박스 선택후 조회 버튼 클릭시 호출.
		$('#seeBranchBtn').click(function(){
			var select = $("#departMentselectBranch option:selected").val();
			alert("선택한 지점 : "+select);
			$.ajax(
					 {
						url : "selectBranchList.do",
						data : {
									selectBranchName : select
							   },
						success : function(data){
							
							$.each(data, function(index){
								
								$('#hidden').val(data[index].branch_no);
								
								$('#branchName2').val(data[index].branch_name);
								$('#branchName2').attr("readonly",false);
								
								$('#sample6_re_postcode').val(data[index].postcode);
								$('#sample6_re_postcode').attr("readonly",false);
								
								$('#sample6_re_address').val(data[index].addr);
								$('#sample6_re_address').attr("readonly",false);
								
								$('#sample6_re_address2').val(data[index].addr_detail);
								$('#sample6_re_address2').attr("readonly",false);
							});
							
						}, error : function(){
							alert("지점을 선택해주세요!");
							
							$('#branchName').val('');
							$('#branchName').attr("readonly",true);
							
							$('#postcode').val('');
							$('#postcode').attr("readonly",true);
							
							$('#addr').val('');
							$('#addr').attr("readonly",true);
							
							$('#addr_detail').val('');
							$('#addr_detail').attr("readonly",true);
						}
					 }
				  );
		});	
		
		//지점 정보 수정 버튼 클릭시
		$('#modifyBranchsubmitBtn').click(function(){
			$.ajax(
					{
						url: "branchModify.do",
						data : 
						{
						    branch_no : $('#hidden').val(),
							branch_name :  $('#branchName2').val(),
							postcode : $('#sample6_re_postcode').val(),
							addr : 	$('#sample6_re_address').val(),
							addr_detail : $('#sample6_re_address2').val()
						},
						success:function(data){
							console.log(data.result);
							if(data.result>0){
								alert('정보수정 성공');
								window.location.reload();
							}else{
								alert('정보수정 실패');
							}
							
							
						}
					}
					);
		});
		
		
        //부서 등록 div 숨김
		$('#addDepartmentDiv').hide();
		
		//부서 등록 버튼 클릭시 등록 form 보여줌
		$('#addDepartmentBtn').click(function(){
			$('#addDepartmentDiv').show();
		});
		
		
		
		
		//하위부서 추가 영역
		$('#addDiv').hide();
		//하위부서 정보 보기 영역
		$('#seeAndModifyDiv').show();
		
		
		//부서관리 - 지점 보기 페이지 이동. 
		$('#moveBranchBtn').click(function(){
			location.href="adminBranch.do";
		});
		
		//부서 관리 페이지
		$('#moveDepartBtn').click(function(){
			location.href="adminDepartment.do";
		});
		
		//하위 부서 관리 페이지
		$('#moveDepartDownBtn').click(function(){
			location.href="adminDownDepartment.do";
		});
		
		//하위부서 조회 버튼 클릭시
		$('#seeDepartBtn').click(function(){
			$('#seeAndModifyDiv').show();
			$('#addDiv').hide();
		});
		
		//하위 부서 추가 버튼
		$('#addDownDepartBtn').click(function(){
			$('#addDiv').show();
			$('#seeAndModifyDiv').hide();
		});
		
	  
		//개발부서 클릭시 아작스 이용
		$('#depart').click(function(){
			
			$.ajax(
					 {
						url:"adminDepart_depart.do",
						data : 
						{
							"depart" : $('#depart').html()	
						},
						success : function(data){
							console.log(data);
							var text = "<h3>"+$('#depart').html()+"</h3>";
							text += "<table class='table'><tr><th></th><th>이름</th><th>나이</th>";
							
							$.each(data, function(index){
								console.log(index);
								text += "<tr><td><input type='checkbox'></td><td>"+data[index].name +"</td><td>"+data[index].age+"</td><tr/>";
							});
							
							text+="</table>";
							text+="<input type='button' class='btn btn-default' value='버튼입니다'>";
							$('#departList').html('');
							$('#departList').html(text);
						}
				     }
				  ); 
			
		});
		
		
	  
  });
  
  

