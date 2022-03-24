<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

  <link rel="icon" type="image/png" href="../argon/assets/img/favicon.png">
  
  <!--     Fonts and icons     -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700" rel="stylesheet" />
  <!-- Nucleo Icons -->
  <link href="../argon/assets/css/nucleo-icons.css" rel="stylesheet" />
  <link href="../argon/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- Font Awesome Icons -->
  <script src="https://kit.fontawesome.com/42d5adcbca.js" crossorigin="anonymous"></script>
  <link href="../argon/assets/css/nucleo-svg.css" rel="stylesheet" />
  <!-- CSS Files -->
  <link id="pagestyle" href="../argon/assets/css/argon-dashboard.css?v=2.0.0" rel="stylesheet" />

    <!-- form validation check -->
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/jquery.validate.min.js"></script>
    <script type="text/javascript" src="https://cdn.jsdelivr.net/jquery.validation/1.16.0/additional-methods.min.js"></script>
    <script src="/js/form-validation.js"></script>

    <!-- JS -->
    <script src="/js/main.js"></script>

<!-- Navbar -->
<nav class="navbar navbar-expand-lg blur border-radius-lg top-0 z-index-3 shadow position-absolute mt-4 py-2 start-0 end-0 mx-4">
  <div class="container-fluid">
    <a class="navbar-brand font-weight-bolder ms-lg-0 ms-3 " href="/main">
      HAMONIZE ADMIN
    </a>
    <ul class="navbar-nav justify-content-end">
      <li class="nav-item dropdown pe-2 d-flex align-items-center">
        <a href="/user/detail?userid=${userSession.userid} " class="nav-link text-black p-0" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
          ${userSession.username} 님 &nbsp;&nbsp; <i class="fa fa-bell cursor-pointer" aria-hidden="true">   </i>
        </a>

        <ul class="dropdown-menu dropdown-menu-end px-2 py-3 ms-n4" aria-labelledby="dropdownMenuButton">
          <li class="mb-2">
            <a class="dropdown-item border-radius-md" href="/user/detail">
              <div class="d-flex py-1">
                <div class="my-auto">
                
                  <img src="/img/img_profile.png" class="avatar avatar-sm me-3">  
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
   
      <li class="nav-item d-xl-none ps-3 pe-0 d-flex align-items-center " style="margin-left:90%; position: relative; top:-15px;">
        <a href="javascript:;" class="nav-link text-warning p-0"></a>
        <a href="javascript:;" class="nav-link text-warning p-0" id="iconNavbarSidenav">
          <div class="sidenav-toggler-inner">
            <i class="sidenav-toggler-line bg-warning"></i>
            <i class="sidenav-toggler-line bg-warning"></i>
            <i class="sidenav-toggler-line bg-warning"></i> 
          </div>
        </a>
      </li>
    </ul>
   </div>
  </div>
</nav>
<!-- End Navbar -->

