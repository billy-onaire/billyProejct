/**
 *	Payment Pagination javaScript file 
 */
$(function(){
	// 3.페이징 처리할 ajax셋팅
	paging.ajax = ajaxPagingList;
	ajaxPagingList();
}); //ready
var ajaxPagingList = function() {
	var paymentData= {};
	//1. 데이터 셋팅
	paymentData.index = paging.p.index;
	$.ajax({
		url: 'paylistPaging.do',
		type: 'post',
		data: paymentData,
		dataType: 'json',
		success: function(result) {
			var jsonStr = JSON.stringigy(result);
			var obj = JSON.parse(jsonStr);
		}
			//2. 페이징정보와 화면 ui셋팅
			//var plist ='';
		/*	for(var i in obj.plist) {
				if(obj.plist[i].)
			}
		}*/
		
	});//ajax
}//ajaxPagingList function

/*	var ajaxList = function(){    
	    
	            // 2.페이징정보와 화면 ui셋팅
	            var list = "";
	            var point = "";

	            for(var i in obj.list){
	            	if(obj.list[i].point == "1"){
	            		point = '<span class="starR on">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR"></span>';
	                }else if(obj.list[i].point == "2"){
	                	point = '<span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR"></span>';
	                }else if(obj.list[i].point == "3"){
	                	point = '<span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR">'+
	                	'</span><span class="starR"></span>';
	                }else if(obj.list[i].point == "4"){
	                	point = '<span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR"></span>';
	                }else if(obj.list[i].point == "5"){
	                	point = '<span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on">'+
	                	'</span><span class="starR on"></span>';
	                }

	            	 list +="<tr>";
	            	 list +="<td>user01</td>";
	            	 list +="<td>"+point+"</td>";
	            	 list +="<td>"+obj.list[i].review_content+"</td>";
	            	 list +="<td>"+obj.list[i].review_date+"</td>";
	            	 list +="<td><img src='/billy/resources/reviewImg/"+obj.list[i].review_image+"' width='150px' height='150px'></td>";
	                 list += "</tr>"      
				} 
	            $("#list").html(list);
	            $("#reviewCount").text("리뷰 " + obj.p.total + "건");
	            
	            paging.p = obj.p;
	            paging.create();
	        },
	        error: function(request, status, errorData){
				console.log("error code : " + request.status + "\nmessage : " + request.responseText + "\nerror : " + errorData);
	        }
	    });    
	}*/