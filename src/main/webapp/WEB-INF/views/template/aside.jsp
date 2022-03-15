<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<title></title>
</head>

<script>
function gotoUrl(url){
  console.log(" url >>"+ url);
  location.href = url;
}

</script>

<body>
<aside class="sidenav bg-white navbar navbar-vertical navbar-expand-xs border-0 border-radius-xl my-3 fixed-start ms-4 " id="sidenav-main">

    
    <hr class="horizontal dark mt-0">
    <div class="collapse navbar-collapse  w-auto " id="sidenav-collapse-main">
      <ul class="navbar-nav">
        
        <li class="nav-item mt-3">
           <h6 class="ps-4 ms-2 text-uppercase text-ms font-weight-bolder opacity-6"> <i class="ni ni-tv-2 text-primary"></i> 포탈 메뉴 관리 </h6>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/board/create">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">메뉴 편집</span>
          </a>
        </li>

        <li class="nav-item">
          <a class="nav-link " href="/board/list">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">게시판 리스트</span>
          </a>
        </li>
                

        <li class="nav-item mt-3">
            
          <h6 class="ps-4 ms-2 text-uppercase text-ms font-weight-bolder opacity-6"><i class="ni ni-credit-card text-success "></i> 결제 관리</h6>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/subscribe/bills">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">결제 수단 관리</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/subscribe/invoices">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">결제 내역</span>
          </a>
        </li>
       
        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-ms font-weight-bolder opacity-6"> <i class="ni ni-single-02 text-dark text-sm opacity-10"></i> 회원정보 관리</h6>
        </li>

        <li class="nav-item">
        <a class="nav-link " href="javascript:;" onClick="gotoUrl('/user/list')">

            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">회원 리스트</span>
          </a>
          <%-- <a class="nav-link "  href="javascript:;" onClick="gotoUrl('/user/detail')">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">회원정보 상세</span>
          </a> --%>
        </li>
        <li class="nav-item">
          <%-- <a class="nav-link " href="javascript:;" onClick="gotoUrl('/user/resign')"> --%>
          
        </li>

        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-ms font-weight-bolder opacity-6">
          <svg class="mb-2 text-primary" width="16px" height="16px" viewBox="0 0 46 42" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"> <title>customer-support</title> <g id="Basic-Elements" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="Rounded-Icons" transform="translate(-1717.000000, -291.000000)" fill="#FFFFFF" fill-rule="nonzero"> <g id="Icons-with-opacity" transform="translate(1716.000000, 291.000000)"> <g id="customer-support" transform="translate(1.000000, 0.000000)"> <path class="color-background" d="M45,0 L26,0 C25.447,0 25,0.447 25,1 L25,20 C25,20.379 25.214,20.725 25.553,20.895 C25.694,20.965 25.848,21 26,21 C26.212,21 26.424,20.933 26.6,20.8 L34.333,15 L45,15 C45.553,15 46,14.553 46,14 L46,1 C46,0.447 45.553,0 45,0 Z" id="Path" opacity="0.59858631"></path> <path class="color-foreground" d="M22.883,32.86 C20.761,32.012 17.324,31 13,31 C8.676,31 5.239,32.012 3.116,32.86 C1.224,33.619 0,35.438 0,37.494 L0,41 C0,41.553 0.447,42 1,42 L25,42 C25.553,42 26,41.553 26,41 L26,37.494 C26,35.438 24.776,33.619 22.883,32.86 Z" id="Path"></path> <path class="color-foreground" d="M13,28 C17.432,28 21,22.529 21,18 C21,13.589 17.411,10 13,10 C8.589,10 5,13.589 5,18 C5,22.529 8.568,28 13,28 Z" id="Path"></path> </g> </g> </g> </g> </svg>
       기술지원 관리</h6>
        </li>

        <li class="nav-item">
          <a class="nav-link " href="/support/list">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">기술지원 문의 내역</span>
          </a>
        </li>
        <%-- <li class="nav-item">
          <a class="nav-link " href="/support/apply">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">기술지원 신청</span>
          </a>
        </li>
         --%>

        <li class="nav-item mt-3">
          <h6 class="ps-4 ms-2 text-uppercase text-ms font-weight-bolder opacity-6">
        <svg class="mb-2 text-danger" width="16px" height="16px" viewBox="0 0 42 44" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"> <title>basket</title> <g id="Basic-Elements" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="Rounded-Icons" transform="translate(-1869.000000, -741.000000)" fill="#fd7e14" fill-rule="nonzero"> <g id="Icons-with-opacity" transform="translate(1716.000000, 291.000000)"> <g id="basket" transform="translate(153.000000, 450.000000)"> <path class="color-background" d="M34.080375,13.125 L27.3748125,1.9490625 C27.1377583,1.53795093 26.6972449,1.28682264 26.222716,1.29218729 C25.748187,1.29772591 25.3135593,1.55890827 25.0860125,1.97535742 C24.8584658,2.39180657 24.8734447,2.89865282 25.1251875,3.3009375 L31.019625,13.125 L10.980375,13.125 L16.8748125,3.3009375 C17.1265553,2.89865282 17.1415342,2.39180657 16.9139875,1.97535742 C16.6864407,1.55890827 16.251813,1.29772591 15.777284,1.29218729 C15.3027551,1.28682264 14.8622417,1.53795093 14.6251875,1.9490625 L7.919625,13.125 L0,13.125 L0,18.375 L42,18.375 L42,13.125 L34.080375,13.125 Z" opacity="0.595377604"></path> <path class="color-background" d="M3.9375,21 L3.9375,38.0625 C3.9375,40.9619949 6.28800506,43.3125 9.1875,43.3125 L32.8125,43.3125 C35.7119949,43.3125 38.0625,40.9619949 38.0625,38.0625 L38.0625,21 L3.9375,21 Z M14.4375,36.75 L11.8125,36.75 L11.8125,26.25 L14.4375,26.25 L14.4375,36.75 Z M22.3125,36.75 L19.6875,36.75 L19.6875,26.25 L22.3125,26.25 L22.3125,36.75 Z M30.1875,36.75 L27.5625,36.75 L27.5625,26.25 L30.1875,26.25 L30.1875,36.75 Z"></path> </g> </g> </g> </g> </svg>
       상품 관리</h6>
        </li>

        <li class="nav-item">
          <a class="nav-link " href="/support/list">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">상품 리스트</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link " href="/support/apply">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">상품등록</span>
          </a>
        </li>
        

        <%-- <li class="nav-item">
          <a class="nav-link active" href="/user/detail">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">회원정보 수정</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link active" href="../pages/profile.html">
            <div class="icon icon-shape icon-sm border-radius-md text-center me-2 d-flex align-items-center justify-content-center">
            </div>
            <span class="nav-link-text ms-1 text-sm">기술지원</span>
          </a>
        </li> --%>

      </ul>
    </div>
     
</aside>
</body>
<%-- 
<script>
function gotoUrl(url){
  console.log(" url >>"+ url);
  location.href = url;
}

</script> --%>

</html>