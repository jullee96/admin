<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
  Hamonize Cloud Service | Bills Info
  </title>
</head>
<%@ include file="../template/top2.jsp" %>

<style>
.view{
}

.edit{
  display: none;
}

</style>


<body class="g-sidenav-show bg-gray-100">
  <input type="hidden" id="pageTitle" value="결제 관리">
  <input type="hidden" id="pageSubTitle" value="결제 수단 관리">

  <div class="position-absolute w-100 min-height-300 top-0" >
    <span class="mask bg-warning opacity-6"></span>
  </div>
  <%@ include file="../template/aside.jsp" %>

  <div class="main-content position-relative max-height-vh-100 h-100">
    <!-- Navbar -->
    <%@ include file="../template/navbar.jsp" %>
    <!-- End Navbar -->


    <div class="card shadow-lg mx-4 card-profile-bottom">
      <div class="card-body p-3">
        <div class="container-fluid py-4">
        <div class="row">
          <div class="col-lg-12">
            <div class="row">
              <div class="col-xl-6 mb-xl-0 mb-4">
                <div class="card bg-transparent shadow-xl">
                  <div class="overflow-hidden position-relative border-radius-xl" style="background-image: url('https://raw.githubusercontent.com/creativetimofficial/public-assets/master/argon-dashboard-pro/assets/img/card-visa.jpg');">
                    <span class="mask bg-gradient-dark"></span>
                    <div class="card-body position-relative z-index-1 p-3">
                      <i class="fas fa-wifi text-white p-2"></i>
                      <h5 class="text-white mt-4 mb-5 pb-2">4562&nbsp;&nbsp;&nbsp;1122&nbsp;&nbsp;&nbsp;4594&nbsp;&nbsp;&nbsp;7852</h5>
                      <div class="d-flex">
                        <div class="d-flex">
                          <div class="me-4">
                            <p class="text-white text-sm opacity-8 mb-0">Card Holder</p>
                            <h6 class="text-white mb-0">Jack Peterson</h6>
                          </div>
                          <div>
                            <p class="text-white text-sm opacity-8 mb-0">Expires</p>
                            <h6 class="text-white mb-0">11/22</h6>
                          </div>
                        </div>
                        <div class="ms-auto w-20 d-flex align-items-end justify-content-end">
                          <img class="w-60 mt-2" src="../argon/assets/img/logos/mastercard.png" alt="logo">
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>

              <div class="col-md-12 mb-lg-0 mb-4">
                <div class="card mt-4">
                  <div class="card-header pb-0 p-3">
                    <div class="row">
                      <div class="col-6 d-flex align-items-center">
                        <h6 class="mb-0">결제 수단</h6>
                      </div>
                      <div class="col-6 text-end">
                        <a class="btn bg-gradient-dark mb-0" href="javascript:;"><i class="fas fa-plus"></i>&nbsp;&nbsp;새 결제 수단 추가</a>
                      </div>
                    </div>
                  </div>
                  
                  <div class="card-body p-3">
                    <div class="row">
                      <c:forEach items="${pList}" var="data" varStatus="status" >
                        <div id="view" class="col-md-6 mb-md-0 mb-4">
                          <div class="card card-body border card-plain border-radius-lg d-flex align-items-center flex-row">
                            <img class="w-10 me-3 mb-0" src="../argon/assets/img/logos/mastercard.png" alt="logo">
                            <h6 class="mb-0"> 
                            ${data.cardnum}
                            </h6>
                            <a href="#" onClick="editViewFunc()" class="fas fa-pencil-alt ms-auto text-dark cursor-pointer" data-bs-toggle="tooltip" data-bs-placement="top" title="결제 정보 수정"></a>
                          </div>
                        </div>
                        
                        <div id="edit" class="edit col-md-6 mb-md-0 mb-4">
                          <div class="card card-body border card-plain border-radius-lg d-flex align-items-center flex-row">
                            <img class="w-10 me-3 mb-0" src="../argon/assets/img/logos/mastercard.png" alt="logo">
                              <input class="form-control" type="text" >
                              <input class="form-control" type="text" >
                              <input class="form-control" type="text" >

                            <a href="#" onClick="editViewFunc()" class="fas fa-pencil-alt ms-auto text-dark cursor-pointer" data-bs-toggle="tooltip" data-bs-placement="top" title="결제 정보 수정"></a>
                          </div>
                        </div>
                        
                      </c:forEach>

                    </div>
                  </div>
                  
                </div>
              </div>
            </div>
          </div>
        
        </div>
        <div class="row">
          <div class="col-md-12 mt-4">
            <div class="card">
              <div class="card-header pb-0 px-3">
                <h6 class="mb-0">청구자 정보</h6>
              </div>
              <div class="card-body pt-4 p-3">
                <ul class="list-group">
                  
                  <li class="list-group-item border-0 d-flex p-4 mb-2 mt-3 bg-gray-100 border-radius-lg">
                    <div class="d-flex flex-column">
                      <h6 class="mb-3 text-sm">${userSession.username}</h6>
                      <span class="mb-2 text-xs">회사 : <span class="text-dark font-weight-bold ms-sm-2">Invesume</span></span>
                      <span class="mb-2 text-xs">이메일 : <span class="text-dark ms-sm-2 font-weight-bold">${userSession.email}</span></span>
                      <span class="text-xs">사업자 등록 번호: <span class="text-dark ms-sm-2 font-weight-bold">FRB1235476</span></span>
                    </div>
                    <div class="ms-auto text-end">
                      <a class="btn btn-link text-danger text-gradient px-3 mb-0" href="javascript:;"><i class="far fa-trash-alt me-2"></i>Delete</a>
                      <a class="btn btn-link text-dark px-3 mb-0" href="javascript:;"><i class="fas fa-pencil-alt text-dark me-2" aria-hidden="true"></i>Edit</a>
                    </div>
                  </li>
                </ul>
              </div>
            </div>
          </div>
         
        </div>
        <!-- footer -->

      </div>


        
          </div>

      </div>
    
  </div>
</div>

  
</body>

<%@ include file="../template/core.jsp" %>

<script>

function editViewFunc(){		
  console.log("aaa");
  if($("#view").css("display") != "none"){   
    $('#edit').css("display", "block");   
    $('#view').css("display", "none");   

  } else{
    $('#edit').css("display", "none");   
    $('#view').css("display", "block");   

  }
} 


</script>

</html>