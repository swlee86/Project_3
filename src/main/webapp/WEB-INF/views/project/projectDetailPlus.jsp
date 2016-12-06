<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="vendor/summernote/dist/summernote.css" />
<link rel="stylesheet" href="vendor/summernote/dist/summernote-bs3.css" /> 

<script>
 $(function(){
	 
	 var pdplus;
	 
	$('.showhide2').click(function(){
		console.log('showhide2 : '+ $(this).attr('id'));
		pdplus = $(this).attr('id');
		$('.'+pdplus).slideUp();
	});
	$('.showup2').click(function(){
		console.log('showup2 : '+ $(this).attr('id'));
		pdplus = $(this).attr('id');
		$('.'+pdplus).slideDown();
	});
});	 
</script>
<div class="pjd_table row" id="pjd_table" >
		<div class="col-lg-12">
			<div class="hpanel hblue">
				<div class="panel-heading hbuilt">
					<div class="panel-tools">
						<a class="showhide2 showhide3" ><i class="fa fa-chevron-up"></i></a> 
						<a class="showup2 showup3"><i class="fa fa-chevron-down"></i></a>
					</div>
					상세 프로젝트  - 추가
				</div>
				
				
				<div class="panel-body pdplus" >		
					<div class="table-responsive">
								<table cellpadding="1" cellspacing="1" class="table table-bordered "  >
									<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 기간</th>
											<td>
												<div class="form-group">
													
													<div class="input-group date">
														<input type="text" class="formstartDate pjd_start_plus form-control input-sm "  name="" value="" size="20px">
														<span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
													</div>
													&nbsp;&nbsp; <b>~</b> &nbsp;&nbsp;
													
													<div class="input-group date">
														<input type="text" class="formendDate pjd_end_plus form-control input-sm" value="" name="" size="20px"> 
														<span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
													</div>
					                            </div>
											</td>
										</tr>
										<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 제목</th>
											<td><input type="text" class="pjd_title_plus form-control input-sm" placeholder="제목" name="" style="width:100%"></td>
										</tr>	
								
										<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%">참여자</th>
											<td>
												<span class="input-group">
	                     							<!-- <input type="text" class="pjd_emp_name_plus form-control input-sm" name="" id=""/>
	                     							<input type="text" class="pjd_emp_no_plus form-control" name="" id=""> -->
	                     							<span class="multiDiv">
	                     							
	                     							</span>
	                        						<span class="input-group-btn">
														<button class="organization_add2 pjd_count_plus btn input-sm btn-default "  type="button"  ><font style="color:#fd7d86 "><span class="fa fa-user-plus"></span></font></button>
													</span>
	                   	  						</span>
											</td>
										</tr>																	
									
										<tr>
											<th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 내용</th>
											<td>
												<div>
												<textarea cols="10" rows="10" class="summernote pjd_content_plus form-control"  placeholder="내용" name="" style="width:100%"></textarea>
												</div>
											</td>
										</tr>
								</table>				
							</div>		
						</div>
					<div class="panel-footer"></div>
				</div>
			</div>
		</div>
		

<div class="modal fade hmodal-success" id="myModal6" tabindex="-1" role="dialog" aria-hidden="true">
   <div class="modal-dialog modal-md">
      <div class="modal-content">
         <div class="color-line"></div>
         <div class="modal-header" style="height:50px;padding-top:10px;padding-bottom:0px">
            <h3 class="modal-title"><font color="#6a6c6f" size="4em"><i class="fa fa-table"></i> <b>사원 선택</b></font></h3>
         </div>
         <div class="modal-body">
         	<!-- <div class="hpanel"> -->
	         	<ul class="nav nav-tabs">
	                <li class="active"><a data-toggle="tab" href="#tab-1"><span style="font-weight: 600;font-size:13px">조직도</span></a></li>
	                <li class=""><a data-toggle="tab" href="#tab-2"><span style="font-weight: 600;font-size:13px">검색</span></a></li>
	            </ul>
	        	<div class="tab-content">
	        		<div id="tab-1" class="tab-pane active">
	        			<div class="panel-body">
	        				<div class="row">  
				               <div class="groupdiv2 col-md-4" style="border: 1px solid #ddd;" id="organization">
				                  
				               </div>   
				               <div class=" col-md-8" id="empList" >
				                  	
				               </div>
				            </div>
	        			</div>
	        		</div>
	        		<div id="tab-2" class="tab-pane">
	        			<div class="panel-body">
	        				<div class="row">   
				               <div class="row"> 
									<div class="col-md-3">
										<div class="form-inline">
											<select class="form-control input-sm" id="con_ins_org_sea_field">
												<option value="emp_name">사원명</option>
												<option value="low_dept_name">하위부서명</option>
											</select>
										</div>
									</div>

									<div class="col-md-6">
										<div class="form-inline">
											<div class="input-group">
												<input type="text" class="form-control input-sm" id="con_ins_org_sea_query" />
												<span class="input-group-btn">
													<button type="button" class="btn btn-default input-sm con_ins_org_sea_btn_plus "  value="" style="color: #fd7d86">
														<b><span class="fa fa-search"></span></b>
													</button>
												</span>
											</div>
										</div>
									</div>	
									
				               </div>
				               
				               <br>
				               <div class="row">
					               <div class="col-md-12" id="empList2"  >
					                  	
					               </div>
				               </div>   
				            </div>
	        			</div>
	        		</div>
	        	</div>
        	 <!-- </div> -->
         </div>
         <div class="modal-footer">
            <button type="button" class="btn btn-default btn-sm" data-dismiss="modal">닫기</button>
         </div>
      
   </div>
</div>
</div>
	


<script>
	//스크립트 생성자
	function empInfo(emp_no, emp_name){
	   this.emp_no = emp_no;
	   this.emp_name = emp_name;
	}
	
	//사원정보 뽑아서 담을 배열
	var empInfoArray = new Array();	
	//부서 선택시
	var departcho;
	//하위 부서 선택시
	var low_deptNumber;
	//사원
	var empListNumber;
	
	var choose;

	//조직도 트리 할때 사용하는 전역변수
	var firstTree2 = 0;
	var secondTree2 = 0;
	
function calendar(){
	//달력
	var text = $('.formstartDate').datepicker({
		 changeMonth: true, 
	     dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	     dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	     monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	     monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	     dateFormat: 'yy-mm-dd',
	     changeYear: true,
	     beforeShowDay: function(date){
        	 var loadDt = new Date();
	     	 var dayday =new Date(Date.parse(loadDt) - 1 * 1000 * 60 * 60 * 24);
	     	 
        	 if(date < dayday) return [false];
        	 return [true];
         }, 
         onSelect: function(selected) {
        	 $(".formstartDate").datepicker("option","maxDate", selected)
        }
	});	

	var text2 = $('.formendDate').datepicker({
		 changeMonth: true, 
	     dayNames: ['월요일', '화요일', '수요일', '목요일', '금요일', '토요일', '일요일'],
	     dayNamesMin: ['월', '화', '수', '목', '금', '토', '일'], 
	     monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'],
	     monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
	     dateFormat: 'yy-mm-dd',
	     changeYear: true
	});	


	//섬머노트
	 $('.summernote').summernote();

	    var sHTML = $('.summernote').code();

	   // console.log(sHTML);

	    $('.summernote1').summernote({
	        toolbar: [
	            ['headline', ['style']],
	            ['style', ['bold', 'italic', 'underline', 'superscript', 'subscript', 'strikethrough', 'clear']],
	            ['textsize', ['fontsize']],
	            ['alignment', ['ul', 'ol', 'paragraph', 'lineheight']],
	        ]
	    });

	    $('.summernote2').summernote({
	        airMode: true,
	    });

	    //조직도
	      $('.organization_add2').click(function() {
	    	console.log("$(this) : "+$(this));
	    	console.log("조직도 버튼 누른 value: " + $(this).attr('value'));
	    	
	    	sip = $(this).attr('value');
	    	pjd_count = $(this).attr('value');
	    	console.log("pjd_count : "+pjd_count);
	    	$('.multiDiv_'+pjd_count).empty();
	    	$('#organization').empty();
			$('#empList').empty();
			$('#empList2').empty();
			$('#con_ins_org_sea_query').val('');
			
	   		var  empSelectNumber = 2;
			var litag = "<ui style='list-style:none; margin-left:-40px;''>";   		
	             
	         	$.ajax({
	   			url : "taskWriteModal.do",
	   			success : function(data) {
	   				 $('#myModal6').modal();
	   				choose = 1;
	   				var departMent = "";
	
	   				$.each(data, function(index) {
	   					departMent = data[index];
	   				});
	
	   				$.each(departMent, function(index) {
	   					litag += "<li style='padding:2px;' onclick='seeDepart2("+pjd_count+", this,"
	   						litag +=empSelectNumber +","
	   						litag +=departMent[index].branch_no
	    				    litag +=")'><i class='fa fa-sitemap'></i><span class='org_list_class'>"+departMent[index].branch_name+"&nbsp;("+departMent[index].branch_no+")</span></li>";
	    					//litag +="</ul>";
	    					
	    					litag+="<div id='dept_div"
	    					litag+=departMent[index].branch_no
	    					litag+="'></div>";
	       				});
	   				litag +="</ul>";
	   				$('#organization').html(litag);
	
	   			}
	   		})
	    }); 
	    

	  	
	 }


	 	var sip;
	 	
	$(function(){
	    
	  	//주소록 추가시  검색해서 보여주는 script
	      $('.con_ins_org_sea_btn_plus').click(function(){ 
	    	  console.log("sipsipsipsipsip sipsipsipsipsip: "+sip);
	   
	      	console.log('field : '+ $('#con_ins_org_sea_field').val()+"/word:"+$('#con_ins_org_sea_query').val());
	      	
	      	pjd_count =sip;
	          
	         $.ajax(
	      			{
	      				type : "post",
	      				url  : "contact_insert_search.do",
	      				data : {
	      						"field" : $('#con_ins_org_sea_field').val(),
	      						"query" : $('#con_ins_org_sea_query').val()
	      				},
	      				success : function(data){
	      							console.log(data);
	      						 	var emp = "";
	      						 	var  makeTable;
	      						 	
	      		                    $.each(data, function(index){
	      		                    	emp = data[index];
	      		                        console.log("객체 : "+emp);
	  									console.log("emp:"+ data[index]);    		                       	
	      		                    });
	      		                    
	      		                    
	      		                    makeTable = "<table class='table table-condensed'><tr style='background-color:#f8f8f8;'><th style='text-align:center'>번호</th><th style='text-align:center'>선택</th><th style='text-align:center'>사번</th><th style='text-align:center'>이름</th></tr>";
	      		                    
	      		                    $.each(emp, function(index){
	      		  	                  //여러명
	      		  	                   makeTable += "<tr style='text-align:center'><td>"+(index+1)+"</td><td><input type='checkbox'  name='chkbtn' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td></tr>";   		  	                 
	      		  	               });
	      		  	               
	   		                    	makeTable += "</table><br><input type='button' class='btn btn-success' value='선택' onclick=check("+pjd_count+")>";
	   		                    	
	      		                   
	      		                   $('#empList2').empty();
	      		                   $('#empList2').append(makeTable); 
	      					}
	      				}		
	      			)
	          });
	});
	
	
	
	
	
	//부서 출력 하는 아작스
		function seeDepart2(pjd_count, obj, empSelectNumber, choose) {
			//전역 부서 선택시
		    departcho = choose;
			var div_id = "dept_div"+choose;
			$("#"+div_id).empty();
			var litag = "<ui style='list-style:none; padding:5px;'>";
		
			var name = $(obj).text();
		
			$.ajax({
				url : "taskDeptModal.do",
				type : "GET",
				data : {
					branch_no : departcho
				},
				success : function(data) {
					var dept;
					console.log(data);
					$.each(data, function(index) {
						dept = data[index];
					});
		
					if(firstTree == 0){
	    				firstTree = 1;	
	    				
						$.each(dept, function(index) {
							litag += "<li onclick='seelow_Depart2("+pjd_count+", this, "
								litag +=empSelectNumber+","
							    litag +=dept[index].dept_no
							    litag +=")'>"+'<i class="fa fa-long-arrow-right"></i><span>'+dept[index].dept_name+" ("+dept[index].dept_no+")</span></li>";
								//litag +="</ul>";
								
								litag+="<div id='low_dept_div"
								litag+=dept[index].dept_no
								litag+="'></div>";
						});
						litag +="</ul>";
						$("#"+div_id).html(litag);
					}else{
	    				firstTree = 0;
	    				$("#"+div_id).html();	
    				}
				}
			});
		}
		
		//하위 부서 클릭시
		function seelow_Depart2(pjd_count, obj,empSelectNumber,departcho) {
			alert("부서 : "+choose);
			deptNumber= departcho;
			var litag = "<ui style='list-style:none;'>";
			var div_id = "low_dept_div"+departcho;
			$("#"+div_id).empty();
		
			$.ajax({
				url : "tasklow_deptModal.do",
				data : {
					dept_no : deptNumber
				},
		
				success : function(data) {
		
					var low_dept = "";
					$.each(data, function(index) {
						low_dept = data[index];
					});
					
					if(secondTree == 0){
	    				secondTree = 1;
						$.each(low_dept, function(index) {
							litag += "<li onclick='seeEmpMember2("+pjd_count+", this, "
							litag += empSelectNumber+","
							litag +=low_dept[index].low_dept_no
							litag +=")'>"+'<i class="fa fa-long-arrow-right"></i><span>'+low_dept[index].low_dept_name+"("+low_dept[index].low_dept_no+")</span></li>";
							
							
						});
						litag +="</ul>";
						$("#"+div_id).html(litag);
					}else{
	    				secondTree = 0;
	    				$("#"+div_id).html();
	    			}
				}
		
			});
		}
		
		//사원 뽑아오기
		function seeEmpMember2(pjd_count, obj,empSelectNumber,low_dept_no){
		   //체크
		   var empListNumber = low_dept_no;
			//alert("사원뽑기 : "+empListNumber);
		   
		   console.log(obj);
		   
		   //클릭한 text 값 뽑아옴.
		   var low_dept = $(obj).text();
		   //alert("taskEmpModal : "+low_dept);
		   //alert("selectNo : " + empSelectNumber);
		   var makeTable = "";
		   
		  
		   makeTable = "<table class='table table-condensed'><tr style='background-color:#f8f8f8'><th><input type='checkbox'></th><th>사번</th><th>이름</th></tr>";
		  
		   
		   $.ajax(
		         {
		            url: "taskEmpModal.do",
		            data:{
		          	  low_dept_no: empListNumber
		                 },
		            success:function(data){
		          	  var emp = "";
		                $.each(data, function(index){
		                   emp = data[index];
		                   console.log(emp);
		               });
		               
		               $.each(emp, function(index){	                
		                  if(empSelectNumber == 2){
		                     makeTable += "<tr><td><input type='checkbox' name='chkbtn' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td></tr>";
		                  }                 
		               });
		               
		               makeTable += "</table><br><input type='button' class='btn btn-success' value='선택' onclick=check("+pjd_count+")>";
		               $('#empList').empty();
		               $('#empList').append(makeTable);
		             }    
		            
		         }
		         );
		}
		
		
		//참조자 선택시
		function recF2(pjd_count, obj){
		   //수신자 사번
		   var emp_no = $(obj).parent().parent().children().eq(0).html();
		   var name = $(obj).parent().parent().children().eq(1).html();
		   
		   console.log("****s*상세상세 조직도 pjd_count : "+pjd_count);
		   console.log("emp_no : "+ emp_no);
		   console.log("name32: "+ name);
		   console.log("[pjd_emp_no_]"+$('#pjd_emp_no_' + pjd_count));
			
		   
		   /* $('input[name=pjd[' + pjd_count + '].emp_no]').attr('value',emp_no);
		   $('input[name=pjd[' + pjd_count + '].emp_name]').attr('value',name); */
		   
		   $('#pjd_emp_no_' + pjd_count).val(emp_no);
 		   $('#pjd_emp_name_' + pjd_count).val(name); 
		   $('#myModal6').modal("hide");		  
		}
		
		
	
	      //체크박스 선택후 버튼 클릭시 호출
	      function check(pjd_count){
	    	  console.log("조직도 check 폼 함수 : " + pjd_count);
	         //체크박스 크기만큼 배열 생성
	         var checkResult = new Array();
	         $(":checkbox[name='chkbtn']:checked").each(function(pi,po){
	            //이름 
	            checkResult[pi] = po.value;
	            //사번
	            empInfoArray.push(new empInfo($(this).parent().next().html(),checkResult[pi]));
	         });
	         console.log("@@@@@@@ 사원  정보: "+empInfoArray);
	         console.log("@@@@@@@ 배열 사이즈: "+empInfoArray.length);
	            if(empInfoArray.length >= 1){
	               //화면에 보이는 input 은 그냥 때려넣음
	               //$("#multiDiv").val(empInfoArray[0].emp_no);
	               //$('#multiDiv').val(empInfoArray[0].emp_name);
	               // $('#pjd_emp_no_' + pjd_count).val(empInfoArray[0].emp_no);
 		  		   //$('#pjd_emp_name_' + pjd_count).val(empInfoArray[0].emp_name);
 		  			
	               var input_no = "";
	               var input_name = "";
	               for(var i = 0; i < empInfoArray.length; i++){
		              console.log("pjd_count: "+ pjd_count + "/ input : " +empInfoArray[i].emp_no +" / "+empInfoArray[i].emp_name);
	                  input_no += "<input type='hidden' class='form-control' name='pjd[" + pjd_count + "].rec_emp_no' value='"+empInfoArray[i].emp_no+"'>";
	                  input_name +="<input type='text' class='form-control input-sm' name='pjd[" + pjd_count + "].rec_emp_name' value='"+empInfoArray[i].emp_name+"'>";
	               }
	              
	               empInfoArray.splice(0,empInfoArray.length);
	               console.log("empInfoArray 지우기 : " + empInfoArray.length);
	               $('.multiDiv_'+pjd_count).append(input_no);
		           $('.multiDiv_'+pjd_count).append(input_name);
	            }else{
	               $('.multiDiv_'+pjd_count).val(empInfoArray[0].emp_no);
	               $('.multiDiv_'+pjd_count).val(empInfoArray[0].emp_name);            
	            }
	         
	         $("#myModal6").modal("hide");
	      }

</script>