<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>
    Hamonize Cloud Service | Find Account
  </title>
</head>

<%@ include file="../template/top2.jsp" %>


<body class="">
  <div class="container position-sticky z-index-sticky top-0">
    <div class="row">
      <div class="col-12">

      </div>
    </div>
  </div>
  <main class="main-content main-content-bg mt-0">
    <div class="page-header min-vh-100">
      <span class="mask bg-gradient-faded-light-vertical opacity-6  border-radius-lg"></span>
      <div class="container">
        <div class="row justify-content-center">
          <div class="col-lg-4 col-md-7">

            <!-- 아이디 찾기 -->
            <form id="findIDForm" method="POST" action="javascript:funcSubmit('id');">
            <div id="div-id" class="card z-index-0 mb-7">
              <div class="card-header text-center pt-4 pb-1">
                <h4 class="font-weight-bolder mb-1">아이디 찾기</h4>
                <p class="mb-0 text-sm">&nbsp;</p>
                <p class="mb-0 text-sm">가입할때 사용한 이름과 이메일 주소를 입력해주세요.<br>입력한 이메일로 아이디를 발송해드리겠습니다.</p>
              </div>
              <div class="card-body">
                <form role="form">
                  <div class="mb-3">
                    <input type="text" class="form-control" placeholder="이름" aria-label="username" id="username" name="username" >
                  </div>

                  <div class="mb-3">
                    <input type="email" class="form-control" placeholder="test@test.com" aria-label="Email" id="email" name="email" >
                  </div>
                  <div class="text-center">
                    <button id="btnIDSubmit" type="submit" class="btn bg-gradient-primary btn-lg w-100 my-4 mb-2">확인</button>
                  </div>
                </form>
              </div>
              <div class="card-footer text-center pt-0 px-lg-2 px-1">
                  <p class="mb-4 text-sm mx-auto">
                    계정이 없으십니까?
                    <a href="/signup" class="text-primary text-gradient font-weight-bold">회원가입</a>
                  </p>
                  <p class="mb-4 text-sm mx-auto">
                    비밀번호를 잊으셨습니까?
                    <a href="#" onclick="goToNextTab('pw')" class="text-primary text-gradient font-weight-bold">비밀번호 찾기</a>
                  </p>

                  <p class="mb-4 text-sm mx-auto">
                    되돌아가기
                    <a href="/login" class="text-primary text-gradient font-weight-bold"> 로그인 </a>
                  </p>
              </div>
            </div>
            </form>
            
            <!-- 비밀번호 찾기 -->
            <form id="findPWForm" method="POST" action="javascript:funcSubmit('pw');" >
            <div id="div-pw" style="display:none;" class="card z-index-0 mb-7">
              <div class="card-header text-center pt-4 pb-1">
                <h4 class="font-weight-bolder mb-1">비밀번호 재설정</h4>
                <p class="mb-0 text-sm">&nbsp;</p>
                <p class="mb-0 text-sm">입력하신 이메일로 임시비밀번호를 발급해드리겠습니다.<br> 로그인 후 변경해주세요.</p>
              </div>
              <div class="card-body">
                <form role="form">
                  <div class="mb-3">
                    <input type="text" class="form-control" placeholder="아이디" aria-label="userid" id="userid" name="userid" >
                  </div>

                  <div class="mb-3">
                    <input type="email" class="form-control" placeholder="test@test.com" aria-label="Email" id="email" name="email" >
                  </div>
                  <div class="text-center">
                    <button id="btnPWSubmit" type="submit" class="btn bg-gradient-primary btn-lg w-100 my-4 mb-2">확인</button>
                  </div>
                </form>
              </div>
              <div class="card-footer text-center pt-0 px-lg-2 px-1">
                  <p class="mb-4 text-sm mx-auto">
                    계정이 없으십니까?
                    <a href="/signup" class="text-primary text-gradient font-weight-bold">회원가입</a>
                  </p>
                  <p class="mb-4 text-sm mx-auto">
                    아이디를 잊으셨습니까?
                    <a href="#" onclick="goToNextTab('id')" class="text-primary text-gradient font-weight-bold">비밀번호 찾기</a>
                  </p>

                  <p class="mb-4 text-sm mx-auto">
                    되돌아가기
                    <a href="/login" class="text-primary text-gradient font-weight-bold"> 로그인 </a>
                  </p>
              </div>
            </div>
            </form>  

          </div>
        </div>
      </div>
    </div>
  </main>

  <%@ include file="../template/core.jsp" %>
 <!-- footer -->
<%@ include file="../template/footer.jsp" %>
</body>

<script>
function goToNextTab(type){
  console.log("type : "+ type);
  if (type == "id"){
      $("#div-pw").hide();
      $("#div-id").show();
  } else if (type == "pw"){
    $("#div-id").hide();
    $("#div-pw").show();

  }
}

function funcSubmit(type){
  
  console.log("type : "+ type);
  const userid = $("#userid").val();
  const username = $("#username").val();
  const email = $("#email").val();
  
  if (type == "id"){
      $('#btnIDSubmit').attr('disabled','disabled');
      $.ajax( { 
          url : "/login/findAccount",
          type:"POST",
          data : {
                  username : username,
                  email : email
              },
          success : function(ret) {
              if(ret.length > 0 ){
                  alert( ret );
                  location.href="/login";

              } else{
                  alert( "fail" );
              }

          }, error : function(e) {
              alert( "fail" );
          }
        });

  } else if (type == "pw"){
      $('#btnPWSubmit').attr('disabled','disabled');
      $.ajax( { 
          url : "/login/findAccount",
          type:"POST",
          data : {
                  userid : userid,
                  email : email
              },
          success : function(ret) {
              if(ret.length>0){
                  alert( ret );
              location.href="/login";

              } else{
                  alert( "fail" );
              }


          }, error : function(e) {
              alert( "fail" );
          }
        });

  }
}



</script>
</html>