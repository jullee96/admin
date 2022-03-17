<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
  <head>
    <title></title>
    <meta content="text/html; charset=utf-8" />
  </head>  

<style>
.pageTitle{
  font-size: 0.8rem;
  display: inline-block;
}
</style>
<!-- navnav -->
<input type="hidden" id="sub" value="pageSubTitle">
<nav class="navbar navbar-main navbar-expand-lg bg-transparent shadow-none position-absolute px-4 w-100 z-index-2 mt-n7">
  <div class="container-fluid py-1">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 ps-2 me-sm-6 me-5">
        <li class="breadcrumb-item text-sm"><p class="text-white opacity-5 pageTitle" id="page" name="page"></p></li>
        <li class="breadcrumb-item text-sm text-white active" aria-current="page">
          <p class="pageTitle" id="pageSub" name="pageSub"></p>
        </li>
      </ol>
    </nav>
    <div class="collapse navbar-collapse me-md-0 me-sm-4 mt-sm-0 mt-2" id="navbar">
      <div class="ms-md-auto pe-md-3 d-flex align-items-center">
        
      </div>

      <%-- <ul class="navbar-nav justify-content-end">
        
        <li class="nav-item dropdown pe-2 d-flex align-items-center">
          <a href="/user/detail?userid=${userSession.userid} " class="nav-link text-white p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
            ${userSession.username} 님 &nbsp;&nbsp; <i class="fa fa-bell cursor-pointer">   </i>
          </a>

          <ul class="dropdown-menu dropdown-menu-end px-2 py-3 ms-n4" aria-labelledby="dropdownMenuButton">
            <li class="mb-2">
              <a class="dropdown-item border-radius-md" href="/user/detail">
                <div class="d-flex py-1">
                  <div class="my-auto">
                  
                    <img src="/img/user.svg" class="avatar avatar-sm me-3">  
                  </div>
                  <div class="d-flex flex-column justify-content-center">
                    <h6 class="text-sm font-weight-normal mb-1">
                      <span class="font-weight-bold">관리자 정보 수정</span> 
                    </h6>
                    
                  </div>
                </div>
              </a>
            </li>
            <li class="mb-2">
              <a class="dropdown-item border-radius-md" href="/login/logout">
                <div class="d-flex py-1">
                  <div class="my-auto">
                    <i class="ni ni-button-power avatar avatar-sm bg-gradient-dark me-3"></i>
                  </div>
                  <div class="d-flex flex-column justify-content-center">
                    <h6 class="text-sm font-weight-normal mb-1">
                      <span class="font-weight-bold">로그아웃</span> 
                    </h6>
                    
                  </div>
                </div>
              </a>
            </li>
            
          </ul>

        </li>
        
        <li class="nav-item d-xl-none ps-3 pe-0 d-flex align-items-center">
          <a href="javascript:;" class="nav-link text-white p-0">
            </a><a href="javascript:;" class="nav-link text-white p-0" id="iconNavbarSidenav">
              <div class="sidenav-toggler-inner">
                <i class="sidenav-toggler-line bg-white"></i>
                <i class="sidenav-toggler-line bg-white"></i>
                <i class="sidenav-toggler-line bg-white"></i> 
              </div>
            </a>
        </li>

      </ul> --%>

    </div>
  </div>
</nav> 

<script>
  $(document).ready(function () {
    var pageTitle = $("#pageTitle").val();
    var pageSubTitle = $("#pageSubTitle").val();
    
    document.getElementById("page").innerHTML=pageTitle;
    document.getElementById("pageSub").innerHTML=pageSubTitle;

  });
</script>

</html>