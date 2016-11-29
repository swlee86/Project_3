$(function(){
	
	$('#addBtn').click(function(){
		
		if($('#positionName').val() != ''){
		
			//내가 입력한 직위 이름
		var position = $('#positionName').val();
		
		//기존에 있는 li 읽어와서 각각 값 가져옴
		var itemid = [];
		itemid = $.makeArray($('li').map(function(){
			return $(this).attr('value');
		}));
		
		
		var searchResult = '';
		//비교 하는 for 문
		for(var i = 0; i < itemid.length; i++){
			console.log("같은가 ? : " +position+"/"+itemid[i]);
			if(position == itemid[i]){
				searchResult = '0';
				break;
			}else{
				searchResult = '1';
			}
		}
		
		alert("비교 결과avda : "+searchResult);
		if(searchResult == '0'){
			alert("이미 있는 아이디 입니다. 다른 이름을 입력해 주세요 !");
			return;
		}else{
			alert("등록 성공!");
			//내가 입력한것을 li 태그로 추가해줌
			var li = "<li class='gradLi'><i class='fa fa-thumbs-o-up'></i>"+position+"</li>";
			//ul - li 에 추가
			$('#sortable').append(li);
		}
		
		}else{
			alert("직위 이름을 입력해 주세요 !");
			$('#positionName').focus();
		}
		
	});
	
});