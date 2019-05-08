function openTab(evt, tabName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
      tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
      tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    evt.currentTarget.className += " active";
}

function insertPopup() {
    // window.name = "부모창 이름";            
    window.name = "mmsList.do";
    
    // window.open("자식창 이름", "불러올 자식 창의 닉네임", "팝업창 옵션");
    window.open("mmsWrite.do", "insert",
    		"width=450", "height=500", "menubar=no", 
    		"status=no", "toolbar=no", "left=700", "top=200");
}

/* 답장 클릭 */ 
$('#reply').on('click',function(){ }); 

var formObj = $("form[role='form']");

/* 삭제 클릭 */ 
$(function(){
	 $('#delete').on('click',function(){ 
		 
		 if(confirm("삭제하시겠습니까?")){
			 opener.parent.location="messageToDel.do?mms_no=${list.mms_no}";
		
		 }
	 });
});

/* 완전삭제 클릭 */ 
$(function(){
	 $('#final').on('click',function(){ 
		 
		 if(confirm("완전히 삭제하시겠습니까?")){
			 window.location.href="deleteMessage.do?mms_no=${list.mms_no}";
			 opener.document.location.reload();
		
		 }
	 });
});
/* 메세지복구 클릭 */ 
$(function(){
	 $('#final').on('click',function(){ 
		 
		 if(confirm("해당 메세지를 복구하시겠습니까?")){
			 window.location.href="essageToOrigin.do?mms_no=${list.mms_no}";
			 opener.document.location.reload();
		
		 }
	 });
});


/*$(document).ready(function(){ 
	 게시글 제목 클릭 상세보기  
	$('.cart_product_desc').on('click',function(){ 
		var popUrl = "messageDetail.do?mms_no="+$(this).attr('id');	
		//팝업창에 출력될 페이지 URL 
		var popOption = "width=570, height=360, resizable=no, scrollbars=no, status=no;"; 
		//팝업창 옵션(optoin) 
		window.open(popUrl,"",popOption); 
		
	});
});*/
