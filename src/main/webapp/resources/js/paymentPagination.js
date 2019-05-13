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
		
			//2. 페이징정보와 화면 ui셋팅
			var plist ='';
			for(var i in obj.plist) {
				if(obj.plist[i].status == '1') 
					st = '<td>거래중</td>';
				else if(obj.plist[i].status == '2')
					st = '<td>거래완료</td>';
				else if(obj.plist[i].status == '3')
					st = '<td>판매중</td>';
				else if(obj.plist[i].status == '4')
					st = '<td>판매완료</td>';
				
				if(obj.plist[i].status == 2|| obj.plist[i].stauts == 4){
					invoice = 
						    '<td><a href="#" class="view" title="View Details" data-toggle="tooltip">' +
							'<i class="material-icons">&#xE5C8;</i></a></td>';
				} else {
					invoice = '<td> </td>';
				}
				/*<td><a href="#" class="view" title="View Details" data-toggle="tooltip">
				<i class="material-icons">&#xE5C8;</i></a></td>
				<td><span class="status text-success">&bull;</span> 구매완료</td>
				*/
				/*	<tr>
                    <th>no</th>
                    <th>판매자</th>
					<th>제목</th>				
                    <th>거래상태</th>						
					<th>영수증</th>
                </tr>*/
				plist += '<tr>';
				plist += '<td>' + obj.plist[i].booking_no + '</td>';
				plist += '<td>' + obj.plist[i].seller_id + '</td>';
				plist += '<td>' + obj.plist[i].product_title + '</td>';
				plist += '<td>' + st + + '</td>';
				plist += '<td>' + invoice + '</td>';
			}
			$('#pList').html(plist);
			
			paging.p = obj.p;
			paging.create();
		}//success
		
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