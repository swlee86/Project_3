<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link rel="stylesheet" href="vendor/summernote/dist/summernote.css" />
<link rel="stylesheet" href="vendor/summernote/dist/summernote-bs3.css" /> 
 <style>

.modal-dialog {
  position: relative;
  width: auto;
  max-width: 600px;
  margin: 10px;
}
.modal-sm {
  max-width: 300px;
}
.modal-lg {
  max-width: 900px;
}
@media (min-width: 768px) {
  .modal-dialog {
    margin: 30px auto;
  }
}
@media (min-width: 320px) {
  .modal-sm {
    margin-right: auto;
    margin-left: auto;
  }
}
@media (min-width: 620px) {
  .modal-dialog {
    margin-right: auto;
    margin-left: auto;
  }
  .modal-lg {
    margin-right: 10px;
    margin-left: 10px;
  }
}
@media (min-width: 920px) {
  .modal-lg {
    margin-right: auto;
    margin-left: auto;
  }
}
 </style>
<script>
 $(function(){
 
   $('.showhide2').click(function(){
      console.log('showhide2 : '+ $(this).attr('id'));
      var pdplus = $(this).attr('id');
      $('.'+pdplus).slideUp();
   });
   $('.showup2').click(function(){
      console.log('showup2 : '+ $(this).attr('id'));
      //console.log("pdplus : " + pdplus)
      var pdplus = $(this).attr('id');
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
                                          <input type="text" class="formstartDate2 pjd_start_plus form-control input-sm "  id="" name="" value=""  size="20px">
                                          <span class="input-group-addon"><font style="color:#fd7d86 "><i class="fa fa-calendar"></i></font></span>
                                       </div>
                                       &nbsp;&nbsp; <b>~</b> &nbsp;&nbsp;
                                       
                                       <div class="input-group date">
                                          <input type="text" class="formendDate2 pjd_end_plus form-control input-sm " value="" name="" size="20px"> 
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
                                 <th style="background-color:#f5f5f5; text-align:right;padding-right:10px; width:10%"><font color="#f05050">*</font> 참여자</th>
                                 <td>
                                 	<div class="col-md-3">
										<div class="form-inline">
                                  <!--   <span class="input-group"> -->
                                    	<span class="multiDiv"></span>
                                        <span class="">
                                          <button class="organization_add2 pjd_count_plus btn input-sm btn-default "  type="button"  ><font style="color:#fd7d86 "><span class="fa fa-user-plus"></span></font></button>
                                       </span>
                                   <!--  </span> -->
                                    </div>
                                    </div>
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
   <div class="modal-dialog modal-lg">
      <div class="modal-content">
         <div class="color-line"></div>
         <div class="modal-header" style="height:50px;padding-top:10px;padding-bottom:0px">
            <h3 class="modal-title"><font color="#6a6c6f" size="4em"><i class="fa fa-table"></i> <b>사원 선택</b></font></h3>
         </div>
         <div class="modal-body">
            <div class="hpanel">
               <ul class="nav nav-tabs">
                   <li class="active"><a data-toggle="tab" href="#tab-1"><span style="font-weight: 600;font-size:13px">조직도</span></a></li>
                   <li class=""><a data-toggle="tab" href="#tab-2"><span style="font-weight: 600;font-size:13px">검색</span></a></li>
               </ul>
              <div class="tab-content">
                 <div id="tab-1" class="tab-pane active">
                    <div class="panel-body">
                       <div class="row">  
                           <div class="groupdiv2 col-md-3" style="border: 1px solid #ddd;" id="organization">
                              
                           </div>   
                           <div class=" col-md-4" id="empList" >
                                 
                           </div>
                           <div class=" col-md-1">
				           		<button type="button" class='btn  btn-success' onclick="precheck_plus()"><i class='fa fa-chevron-right'></i></button>
				               	<br><Br>
				               	<button type="button" class='btn  btn-default' style="color:#62cb31" onclick="precheck_plus_cancel()"><i class='fa fa-chevron-left'></i></button>
				           </div>  
				           <div class=" col-md-4" style="border: 1px solid #ddd;"   >
				            	<div class="row"><div style="background-color:#f6f6f6;font-size:15px;padding:10px 0 10px 12px;margin-bottom:5px;margin-left:0px"><i class="fa fa-users"></i>선택된 사원</div></div>
				                	
				                 <div id="empList_list_plus">선택된 사원이 없습니다.</div> 	
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
            </div>
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
   
   // 사원정보 뽑아서 담을 배열의 선택전 배역
   var pre_empInfoArray = new Array();
   
   //부서 선택시
   var departcho2;
   //하위 부서 선택시
   //var low_deptNumber;
   //사원
   //var empListNumber;
   
   var choose2;

   //조직도 트리 할때 사용하는 전역변수
   var firstTree2 = 0;
   var secondTree2 = 0;

  // var pjd_count_result = 0;
   
   
function calendar(){
	 
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
		//pjd_count_result = pjd_count;
		console.log("pjd_count : "+pjd_count);
		$('.multiDiv_'+pjd_count).empty();
		$('#organization').empty();
		$('#empList').empty();
		$('#empList2').empty();
		$('#con_ins_org_sea_query').val('');
		
		 $('#empList_list_plus').html('<span style="color:red"><br>선택된 사원이 없습니다.<br><br></span>');
         pre_empInfoArray.splice(0,pre_empInfoArray.length);
		         
		var  empSelectNumber = 2;
		var litag = "<ul style='list-style:none; margin-left:-40px;''>";         
                
		$.ajax(
				{
					url : "taskWriteModal.do",
					success : function(data) {
						$('#myModal6').modal();
						choose2 = 1;
                  		var departMent = "";
   
					$.each(data, function(index) {
						departMent = data[index];
					});
   
					$.each(departMent, function(index) {
						litag += "<li style='padding:2px;' onclick='seeDepart2("+pjd_count+", this,"
						litag +=empSelectNumber +","
						litag +=departMent[index].branch_no
						litag +=")'><i class='fa fa-sitemap'></i><span class='org_list_class'>"+departMent[index].branch_name+"&nbsp;("+departMent[index].branch_no+")</span></li>";
						litag+="<div id='dept_div"
						litag+=departMent[index].branch_no
                      	litag+="'></div>";
					});
					
					litag +="</ul>";
					$('#organization').html(litag);
					}
				}
		)
	}); 
}//calender fun() end

		
		var sip;
       
		$(function(){


      
 /////////////////////////////////////////////////////////////////////////////////////////////////////
 //조직도
       
        // 검색해서 보여주는 script
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
                                   
                                   
                                   makeTable = "<table class='table table-condensed table-bordered  table-hover'><tr style='background-color:#f8f8f8;'><th style='text-align:center'>NO</th><th style='text-align:center'>선택</th><th style='text-align:center'>사번</th><th style='text-align:center'>이름</th><th style='text-align:center'>직위</th></tr>";
                                   
                                   $.each(emp, function(index){
                                      //여러명
                                       makeTable += "<tr style='text-align:center'><td>"+(index+1)+"</td><td><input type='checkbox'  name='chkbtn_end' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+"</td><td>"+emp[index].position_name+"</td></tr>";                               
                                   });
                                   
                                   makeTable += "</table><div class='pull-right'><input type='button' class='btn btn-success' value='선택' onclick=check("+pjd_count+")></div>";
                                   
                                  
                                  $('#empList2').empty();
                                  $('#empList2').append(makeTable); 
                        }
                     }      
                  )
             });
   });
   
   
   
   
   
   //부서 출력 하는 아작스
      function seeDepart2(pjd_count, obj, empSelectNumber, choose2) {
	   console.log("seedepart2 클릭");
         //전역 부서 선택시
          departcho2 = choose2;
         var div_id = "dept_div"+choose2;
         $("#"+div_id).empty();
         var litag = "<ul style='list-style:none; padding:5px;'>";
      
         var name = $(obj).text();
      
         $.ajax({
            url : "taskDeptModal.do",
            type : "GET",
            data : {
               branch_no : departcho2
            },
            success : function(data) {
               var dept;
               console.log('############부서출력 아작스 : data : '+data);
               $.each(data, function(index) {
            	   console.log("#####each("+index+")    :   "+data[index]);
                  dept = data[index];
               });
      
               console.log("### firstTree2 == 0 : "+(firstTree2 == 0));
               if(firstTree2 == 0){
                   firstTree2 = 1;   
                   
                  $.each(dept, function(index) {
                     litag += "<li onclick='seelow_Depart2("+pjd_count+", this, "
                        litag +=empSelectNumber+","
                         litag +=dept[index].dept_no
                         litag +=")'>"+'<i class="fa fa-long-arrow-right"></i><span>'+dept[index].dept_name+"("+dept[index].dept_no+")</span></li>";
                        //litag +="</ul>";
                        
                        litag+="<div id='low_dept_div"
                        litag+=dept[index].dept_no
                        litag+="'></div>";
                  });
                  litag +="</ul>";
                  $("#"+div_id).html(litag);
               }else{
                   firstTree2 = 0;
                   $("#"+div_id).html();   
                }
            }
         });
      }
      
      //하위 부서 클릭시
      function seelow_Depart2(pjd_count, obj,empSelectNumber,departcho2) {
        // alert("부서 : "+choose2);
         deptNumber= departcho2;
         var litag = "<ul style='list-style:none;'>";
         var div_id = "low_dept_div"+departcho2;
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
               
               if(secondTree2 == 0){
                   secondTree2 = 1;
                  $.each(low_dept, function(index) {
                     litag += "<li onclick='seeEmpMember2("+pjd_count+", this, "
                     litag += empSelectNumber+","
                     litag +=low_dept[index].low_dept_no
                     litag +=")'>"+'<i class="fa fa-long-arrow-right"></i><span>'+low_dept[index].low_dept_name+"("+low_dept[index].low_dept_no+")</span></li>";
                     
                     
                  });
                  litag +="</ul>";
                  $("#"+div_id).html(litag);
               }else{
                   secondTree2 = 0;
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
   
         makeTable = "<table class='table table-condensed table-hover'><tr style='background-color:#f8f8f8'><th>선택</th><th>사번</th><th>이름</th></tr>";

         $.ajax(
               {
                  url: "taskEmpModal_exclude.do",
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
                           makeTable += "<tr><td><input type='checkbox' name='chkbtn' value='"+emp[index].emp_name+"'></td><td>"+emp[index].emp_no+"</td><td>"+emp[index].emp_name+" ("+emp[index].position_name+")</td></tr>";
                        }                 
                     });
                     
                     makeTable += "</table>";//"<br><input type='button' class='btn btn-success' value='선택' onclick=check("+pjd_count+")>";
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
      
      
      
      
      
      function precheck_plus(){
        	 $('#empList_list_plus').empty();
        	console.log('precheck 함수');
        	var tablemake2 ="";
            var checkarr = new Array();
           // console.log("pjd_count_result: "+pjd_count_result);
     	   console.log("pjd_count=: "+pjd_count);
     	   
           $(":checkbox[name='chkbtn']:checked").each(function(pi,po){
        	   console.log('------------------------------');
        	   var result  = 0;
        	 
    	       	if(pre_empInfoArray.length == 0){  //처음에
    	       		console.log('처음에 pre_empInfoArray.length == 0');
    	       		// 이름 
    	            checkarr[pi] = po.value;
    	            // 사번
    	            pre_empInfoArray.push(new empInfo($(this).parent().next().html(), checkarr[pi]));
    	            console.log("===> 사번 : "+$(this).parent().next().html()+"/이름: "+checkarr[pi]);
    	            //console.log("this:"+$(this));
    	       	}else{	       		
    	       	 //중복값 검사
    		       	for(var i = 0; i < pre_empInfoArray.length; i++){
    		       		console.log("배열 사번 pre_empInfoArray["+ i +"].emp_no : " + pre_empInfoArray[i].emp_no);
    		       		console.log("선택된사번"+ i +" : " + $(this).parent().next().html());
    		       		if($(this).parent().next().html() == pre_empInfoArray[i].emp_no){
    		       			result = 1;  //같은 값이 있다.
    		       		}
    		       	}
    		       	
    		    	if(result == 0 ){ //중복된 값 없을때 추가
    		       		// 이름 
    		         	checkarr[pi] = po.value;
    		            // 사번
    		            pre_empInfoArray.push(new empInfo($(this).parent().next().html(), checkarr[pi]));
    		            console.log("===> 사번 : "+$(this).parent().next().html()+"/이름: "+checkarr[pi]);
    		       	}	
    	       	}
    	       
    	       	//체크박스 속성 false
    	        $(this).attr("checked", false);
           });
           
          	 if(pre_empInfoArray.length >= 1) { 
          		   tablemake2 = '<div class="row">';
          		   tablemake2 += "<table class='table table-condensed table-hover' >";
          		 	          
                   for(var i = 0; i < pre_empInfoArray.length; i++){
                	   tablemake2 += "<tr><td style='text-align:center'><input type='checkbox' checked   name='chkbtn_end' value='"+pre_empInfoArray[i].emp_name+"'></td><td style='text-align:center'>"+pre_empInfoArray[i].emp_no+"</td><td>"+pre_empInfoArray[i].emp_name+"</td></tr>";  
                   }   
                   tablemake2 += '</table></div>';
                   tablemake2 += "<div ><input type='button' class='btn btn-sm btn-success btn-block btn-outline' style='font-weight: bold' value='선 &nbsp;&nbsp;&nbsp;택' onclick=check("+pjd_count+")><br></div>";
                   
                   $('#empList_list_plus').empty();
                   $('#empList_list_plus').append(tablemake2);       
          	 }
        }
        
        //선택된 체크박스 취소
        function precheck_plus_cancel(){
        	var pre_no = new Array();
        	console.log('함수 탐');
        	$(":checkbox[name='chkbtn_end']:checked").each(function(pi,po){           
        		pre_no.push($(this).parent().next().html());  //서번넣기   		
                var tr = $(this).parent().parent();
        	    //라인 삭제
        	    tr.remove();
             });
        	
        	console.log("pre_empInfoArray.length : " + pre_empInfoArray.length);
        	
        	//배열에서 사번 삭제
        	for(var i = 0; i < pre_empInfoArray.length; i++){
        		console.log("pre_empInfoArray["+ i +"].emp_no : " + pre_empInfoArray[i].emp_no);
        		for(var j = 0; j < pre_no.length; j++){
        			console.log("pre_no["+ j +"] : " + pre_no[j]);
        			if(pre_no[j] == pre_empInfoArray[i].emp_no){
        				//사번 지우기
        	        	pre_empInfoArray.splice( i, 1);
        			}
        		}
        	}
        	
        	console.log("pre_empInfoArray.length : " + pre_empInfoArray.length);
        	console.log("pre_empInfoArray : " + pre_empInfoArray);
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
   
         //체크박스 선택후 버튼 클릭시 호출
         function check(pjd_count){
            console.log("조직도 check 폼 함수 : " + pjd_count);
            //체크박스 크기만큼 배열 생성
            var checkResult = new Array();
            $(":checkbox[name='chkbtn_end']:checked").each(function(pi,po){
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
                     input_name +="<input type='text' readonly class='form-control input-sm' name='pjd[" + pjd_count + "].rec_emp_name' value='"+empInfoArray[i].emp_name+"'>";
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