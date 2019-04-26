<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <title>Bootstrap Example</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
  <script>
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
    /* .border {
        display: inline-block;
        width: 700px;
        height: 286px;
        margin-left: 600px;
      }

      #find {
        width: 700px;
        margin-top: 250px;
        margin-left: 600px;
      }
      
      label{
        margin-top:  10px;
        margin-left: 5px;
      } */
  </style>

</head>

<body>
  <div class="container">
    <div class="row">
      <div class="col-sm-6">
        <div>
          <div class="form-check-inline">
            <label class="form-check-label">
              <input type="radio" class="form-check-input" name="item" value="findId" checked> 아이디 찾기
            </label>
          </div>
          <div class="form-check-inline">
            <label class="form-check-label">
              <input type="radio" class="form-check-input" name="item" value="findPwd"> 비밀번호
              찾기
            </label>
          </div>
          <br><br>
        </div>

        <div id="findId">
          <form>
            <div class="form-group">
              <label for="uname">Username:</label>
              <input type="text" class="form-control" id="finame" placeholder="Enter username" name="finame" required>
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>

            <div class="form-group">
              <label for="phone">Phone:</label>
              <input type="text" class="form-control" id="fiphone" placeholder="Enter phone number" name="fiphone"
                required>
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <br>
            <br>
            <span id="idList"></span>
            <button type="submit" class="btn btn-warning btn-block" id="findId" style="color:white">확인</button>
          </form>
        </div>

        <div id="findPwd">
          <form>
            <div class="form-group">
              <label for="uname">User111111111:</label>
              <input type="text" class="form-control" id="finame" placeholder="Enter username" name="finame" required>
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>

            <div class="form-group">
              <label for="email">E111111:</label>
              <input type="email" class="form-control" id="fiemail" placeholder="Enter phone number" name="fiphone"
                required>
              <div class="valid-feedback">Valid.</div>
              <div class="invalid-feedback">Please fill out this field.</div>
            </div>
            <br>
            <br>
            <span id="idList"></span>
            <button type="submit" class="btn btn-warning btn-block" id="findId" style="color:white">확인</button>
          </form>
        </div>

      </div>
    </div>
  </div>
</body>

</html>