<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>
    Hamonize Cloud Service | Sign up
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

<main class="main-content  mt-0">
    <section>
      <div class="page-header min-vh-100">
        <div class="container">
          <div class="row">
            <div class="col-xl-4 col-lg-5 col-md-7 d-flex flex-column mx-lg-0 mx-auto">
              <div class="card card-plain">
                <div class="card-header pb-0 text-left">
                  <h4 class="font-weight-bolder">회원가입</h4>
                  <p class="mb-0"></p>
                </div>
                <div class="card-body pb-3">
                  <form method="POST" class="register-form" id="registerForm" action="javascript:funcSubmit();" >
                    
                    <label>이름</label>
                    <div class="mb-3 form-group">
                      <input type="text" class="form-control" name="username" id="username" placeholder="이름" aria-label="username" value="어드민테스트">
                    </div>
                    
                    <label>아이디</label>
                    <div class="mb-3 form-group">
                      <input type="text" class="form-control" name="userid" id="userid" placeholder="아이디" aria-label="userid" value="admin6">
                    </div>
                    
                    <label>이메일</label>
                    <div class="mb-3 form-group">
                      <input type="email" class="form-control" id="email" name="email" placeholder="test@test.com" value="bono6315@gmail.com">
                    </div>
                    
                    <label>비밀번호</label>
                    <div class="mb-3 form-group">
                      <input type="password" class="form-control" id="passwd" name="passwd" placeholder="password" aria-label="password"  value="admin" placeholder="비밀번호">
                    </div>
                    
                    <label>비밀번호 확인</label>
                    <div class="mb-3 form-group">
                      <input type="password" class="form-control" id="re_passwd" name="re_passwd" placeholder="비밀번호 확인" value="admin" />
                    </div>

                    <div class="text-center">
                      <button type="submit" class="btn btn-danger w-100 mt-4 mb-0">회원가입</button>
                    </div>
                  </form>

                </div>
                <div class="card-footer text-center pt-0 px-sm-4 px-1">
                  <p class="mb-4 mx-auto text-sm">
                    이미 계정이 있습니까?
                    <a href="/login" class="text-danger font-weight-bold text-sm" >로그인</a>
                  </p>
                </div>
              </div>
            </div>
            
            <div class="col-6 d-lg-flex d-none h-100 my-auto pe-0 position-absolute top-0 end-0 text-center justify-content-center flex-column">
              <div class="position-relative bg-gradient-danger h-100 m-3 px-7 border-radius-lg d-flex flex-column justify-content-center overflow-hidden">
              </div>
            </div>
          
          </div>
        </div>
      </div>
    </section>
  </main>

  
  <%@ include file="../template/core.jsp" %>

</body>
<script>
function funcSubmit(){
  if(confirm("가입하시겠습니까?")){
      registerForm.action="/signup/signup";
      registerForm.submit();
  }
}

</script>
</html>