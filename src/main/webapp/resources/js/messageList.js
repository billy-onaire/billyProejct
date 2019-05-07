

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
    		"width=550", "height=500", "menubar=no", 
    		"status=no", "toolbar=no", "left=700", "top=200");
}

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
