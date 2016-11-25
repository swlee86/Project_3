$(function(){
	
	//문서 종류 셀렉트 박스 선택시
	$('#sanction_cg').change(function(){
    	 var selectChoose =  $('#sanction_cg option:selected').val();
    	 alert("선택하신 문서 : "+selectChoose);
    	
    	 //협조문
    	 if(selectChoose == '1'){
    	
    		 $.ajax(
    				  {
    					  	url:"CooperationDocument.do",
    					  	dataType : "html",
    					  	success : function(data){
    					  		$('#documentTable').empty();
    					  		$('#documentTable').html(data);
    					  	}
    		 	  	  }
    		       );
    	 
    	//대외발생
    	 }else if(selectChoose == '2'){
    	 
    		 $.ajax(
   				  {
   					  	url:"",
   					  	dataType : "html",
   					  	success : function(data){
   					  		$('#documentTable').empty();
   					  		$('#documentTable').html(data);
   					  	}
   		 	  	  }
   		       );
   	 
    	//휴가신청	 
    	 }else if(selectChoose =='3'){
    		
    		 $.ajax(
   				  {
   					  	url:"VacationDocument.do",
   					  	dataType : "html",
   					  	success : function(data){
   					  		$('#documentTable').empty();
   					  		$('#documentTable').html(data);
   					  	}
   		 	  	  }
   		       );
    		 
    	 }else{
    		 alert("메뉴를 선택해주세요 !");
    	 }
    	 
    });
    
});