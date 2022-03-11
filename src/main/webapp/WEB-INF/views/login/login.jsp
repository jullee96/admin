<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>
    Hamonize Cloud Service | Sign in
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
                <div class="card-header pb-0 text-start">
                  <h4 class="font-weight-bolder">로그인</h4>
                  <p class="mb-0">아이디와 비밀번호를 입력하여 관리자 <br>계정에 로그인하세요</p>
                </div>
                <div class="card-body">
                  <form id="frm" method="POST" action="/login/login">
                    <div class="mb-3">
                      <input type="text" class="form-control form-control-lg" placeholder="아이디" id="userid" name="userid" aria-label="userid" required >
                    </div>
                    <div class="mb-3">
                      <input type="password" class="form-control form-control-lg" placeholder="패스워드" id="passwd" name="passwd"  aria-label="passwd" required >
                    </div>
                    <div class="form-check form-switch">
                      <input class="form-check-input" type="checkbox" id="rememberMe">
                      <label class="form-check-label" for="rememberMe">아이디 기억하기</label>
                    </div>
                    <div class="text-center">
                      <button type="submit" class="btn btn-lg btn-danger btn-lg w-100 mt-4 mb-0">로그인</button>
                    </div>
                  </form> 
                </div>
                
              <!-- sns login -->
              <%-- <div class="row px-xl-5 px-sm-4 px-3">
                <div class="mt-2 mb-4 position-relative text-center">
                  <p class="text-sm font-weight-bold mb-2 text-secondary text-border d-inline z-index-2 bg-white px-3">
                     or 
                  </p>
              </div>
                
                <div class="col-3 ms-auto px-1">
                  <a style="width:65.19px;height:54px;" class="btn btn-outline-light w-80" href="/oauth2/authorization/kakao">
                    <img style="width:32px;height:32px;margin-left:-4px;" src="/img/kakao.png">
                  </a>
                </div>
                <div class="col-3 px-1">
                  <a style="width:65.19px;height:54px;" class="btn btn-outline-light w-80" href="/oauth2/authorization/naver">
                    <img style="width:34px;height:34px;margin-left:-5px;" src="/img/naver.png">
                  </a>
                </div>
                <div class="col-3 me-auto px-1">
                
                  <a style="width:65.19px;height:54px;" class="btn btn-outline-light w-80" href="/oauth2/authorization/google">
                    <img style="width:30px;height:30px;margin-left:-4px;" src="/img/google.png">  
                  </a>
                </div> --%>
                
              </div>


                <div class="card-footer text-center pt-0 px-lg-2 px-1">
                  <p class="mt-4 mb-3 text-sm mx-auto">
                    계정이 없으십니까?
                    <a href="/signup" class="text-danger text-gradient font-weight-bold">회원가입</a>
                  </p>
                  <p class="mb-4 text-sm mx-auto">
                    가입한 정보를 잊으셨습니까?
                    <a href="/login/find" class="text-warning text-gradient font-weight-bold"> 아이디 / 비밀번호 찾기</a>
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

</html>