<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<title>Bootstrap Example</title>

<!-- Favicon  -->
<link rel="icon" href="/billy/resources/img/core-img/favicon.ico">

<!-- Core Style CSS -->
<link rel="stylesheet" href="/billy/resources/css/core-style.css">

<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
<script type="text/javascript">
    
  $(function () {
      showDiv();

      $("input[name=item]").on("change", function () {
        showDiv();
      });
    });

    function showDiv() {
      if ($("input[name=item]").eq(0).is(":checked")) {
        $("#findId").css("display", "block");
        $("#findPwd").css("display", "none");
      }

      if ($("input[name=item]").eq(1).is(":checked")) {
        $("#findId").css("display", "none");
        $("#findPwd").css("display", "block");
      }
    }


    $(document).on('click', '#findId', function () {
      var name = $('#name').val();
      var phone = $('#phone').val();

      var postData = { 'user_name': name, 'phone': phone };

      $.ajax({
        url: "findId.do",
        data: postData,
        contentType: "application/x-www-form-urlencoded; charset=UTF-8",
        dataType: "json",

        success: function (data) {
          var idLists = data.user_Id;
          var idLength = idLists.idLength;
          var idFind = idList.substring(1, idLength - 1)
          $("#idList").append("<h1" + "조회하신 회원님의 아이디는 : " + idFind + "입니다. </h1>")
        },
        error: function (XMLHttpRequest, textStatus, errorThrown) {

          alert('정보를 다시 입력해주시길 바랍니다.');
        }
      });
    });
  </script>

<style>

</style>

</head>

<body>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<div style="margin-top: 15px">
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="item" value="findId" checked>
							아이디 찾기
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label"> <input type="radio"
							class="form-check-input" name="item" value="findPwd">
							비밀번호 찾기
						</label>
					</div>
					<br>
					<br>
				</div>
				<!-- 아이디 찾기  -->
				<div id="findId">
					<form>
						<div class="form-group">
							<label for="uname">Username:</label> <input type="text"
								class="form-control" id="finame" placeholder="Enter username"
								name="finame" required>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>

						<div class="form-group">
							<label for="phone">Phone:</label> <input type="text"
								class="form-control" id="fiphone"
								placeholder="Enter phone number" name="fiphone" required>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<br> <br> <span id="idList"></span>
						<button type="submit" class="btn btn-warning btn-block"
							id="findId" style="color: white">확인</button>
					</form>
				</div>
				<!-- 비밀번호 찾기  -->
				<div id="findPwd">
					<form>
						<div class="form-group">
							<label for="uname">User111111111:</label> <input type="text"
								class="form-control" id="finame" placeholder="Enter username"
								name="finame" required>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>

						<div class="form-group">
							<label for="email">E111111:</label> <input type="email"
								class="form-control" id="fiemail"
								placeholder="Enter phone number" name="fiphone" required>
							<div class="valid-feedback">Valid.</div>
							<div class="invalid-feedback">Please fill out this field.</div>
						</div>
						<br> <br> <span id="idList"></span>
						<button type="submit" class="btn btn-warning btn-block"
							id="findId" style="color: white">확인</button>
					</form>
				</div>

			</div>
		</div>
	</div>
	
	
	<!-- ##### jQuery (Necessary for All JavaScript Plugins) ##### -->
	<script src="/billy/resources/js/jquery/jquery-2.2.4.min.js"></script>
	<!-- Popper js -->
	<script src="/billy/resources/js/popper.min.js"></script>
	<!-- Bootstrap js -->
	<script src="/billy/resources/js/bootstrap.min.js"></script>
	<!-- Plugins js -->
	<script src="/billy/resources/js/plugins.js"></script>
	<!-- Active js -->
	<script src="/billy/resources/js/active.js"></script>
	
</body>

</html>