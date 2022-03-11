<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
  Hamonize Cloud Service | Support List
  </title>
</head>
<%@ include file="../template/top2.jsp" %>

<body class="g-sidenav-show bg-gray-100">
  <input type="hidden" id="pageTitle" value="결제 관리">
  <input type="hidden" id="pageSubTitle" value="결제 내역">

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
            <div class="table-responsive">
              
              <div class="dataTable-container">
                <table class="table table-flush dataTable-table" id="datatable-search">
                    <thead class="thead-light">
                      <tr>
                        <th data-sortable="" style="width: 14.6115%;">
                          <a href="#" class="dataTable-sorter">번호</a>
                        </th>
                        <th data-sortable="" style="width: 16.3848%;">
                          <a href="#" class="dataTable-sorter">상품명</a>
                        </th>
                        <th data-sortable="" style="width: 16.2429%;">
                          <a href="#" class="dataTable-sorter">상태</a>
                        </th>
                        <th data-sortable="" style="width: 19.5766%;">
                          <a href="#" class="dataTable-sorter">청구금액</a>
                        </th>
                        <th data-sortable="" style="width: 22.3429%;">
                          <a href="#" class="dataTable-sorter">결제일</a>
                        </th>
                        <th data-sortable="" style="width: 10.8523%;">
                          <a href="#" class="dataTable-sorter">영수증</a>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                      <tr>
                        <td>
                          <div class="d-flex align-items-center">
                            <div class="form-check">
                              <input class="form-check-input" type="checkbox" id="customCheck1">
                            </div>
                            <p class="text-xs font-weight-bold ms-2 mb-0">#10421</p>
                          </div>
                        </td>
                        <td class="font-weight-bold">
                          <span class="my-2 text-xs">1 Nov, 10:20 AM</span>
                        </td><td class="text-xs font-weight-bold">
                          <div class="d-flex align-items-center">
                            <button class="btn btn-icon-only btn-rounded btn-outline-success mb-0 me-2 btn-sm d-flex align-items-center justify-content-center"><i class="fas fa-check" aria-hidden="true"></i></button>
                            <span>Paid</span>
                          </div>
                        </td>
                        <td class="text-xs font-weight-bold">
                          <div class="d-flex align-items-center">
                            <img src="../../../assets/img/team-2.jpg" class="avatar avatar-xs me-2" alt="user image">
                            <span>Orlando Imieto</span>
                          </div>
                        </td>
                        <td class="text-xs font-weight-bold">
                          <span class="my-2 text-xs">Nike Sport V2</span>
                        </td><td class="text-xs font-weight-bold">
                          <span class="my-2 text-xs">$140,20</span>
                        </td>
                      </tr>
                      
                      <tr></tr>
                    </tbody>
                  </table>
              </div>
              
              <div class="dataTable-bottom">
                <nav aria-label="Page navigation example">
                  <ul class="pagination">
                    <li class="page-item">
                      <a class="page-link" href="javascript:;" aria-label="Previous">
                        <i class="fa fa-angle-left"></i>
                        <span class="sr-only">Previous</span>
                      </a>
                    </li>
                    
                    <li class="page-item"><a class="page-link" href="javascript:;">1</a></li>
                    
                    <li class="page-item">
                      <a class="page-link" href="javascript:;" aria-label="Next">
                        <i class="fa fa-angle-right"></i>
                        <span class="sr-only">Next</span>
                      </a>
                    </li>
                  </ul>
                </nav>
              </div>

                  <%-- <table class="table align-items-center mb-0">
                    <thead>
                        <tr>
                        <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 "></th>
                        <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">청구금액</th>

                        <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">상태</th>
                        <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">결제일</th>
                        <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">결제 수단</th>
                        <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">영수증</th>
                        <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">세금계산서</th>

                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                          
                          <td class="align-middle text-start">
                              <span class="badge badge-sm badge-secondary ">pro plan</span>
                          </td>
                        
                          <td class="align-middle text-center">
                              <span class="badge badge-sm badge-secondary">48,000</span>
                          </td>
                          
                          <td class="align-middle text-center">
                              <span class="badge badge-sm badge-secondary">결제 완료</span>
                          </td>
                          <td class="align-middle text-center">
                              <span class="text-secondary text-xs font-weight-bold">2022-03-02</span>
                          </td>
                          <td class="align-middle text-center">
                              <span class="text-secondary text-xs font-weight-bold">신용카드</span>
                          </td>
                          <td class="align-middle text-center">
                              <a href="#" class="text-secondary text-xs font-weight-bold"> 
                                <svg class="text-dark" width="16px" height="16px" viewBox="0 0 40 44" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"> <title>document</title> <g id="Basic-Elements" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="Rounded-Icons" transform="translate(-1870.000000, -591.000000)" fill="#FFFFFF" fill-rule="nonzero"> <g id="Icons-with-opacity" transform="translate(1716.000000, 291.000000)"> <g id="document" transform="translate(154.000000, 300.000000)"> <path class="color-background" d="M40,40 L36.3636364,40 L36.3636364,3.63636364 L5.45454545,3.63636364 L5.45454545,0 L38.1818182,0 C39.1854545,0 40,0.814545455 40,1.81818182 L40,40 Z" id="Path" opacity="0.603585379"></path> <path class="color-background" d="M30.9090909,7.27272727 L1.81818182,7.27272727 C0.814545455,7.27272727 0,8.08727273 0,9.09090909 L0,41.8181818 C0,42.8218182 0.814545455,43.6363636 1.81818182,43.6363636 L30.9090909,43.6363636 C31.9127273,43.6363636 32.7272727,42.8218182 32.7272727,41.8181818 L32.7272727,9.09090909 C32.7272727,8.08727273 31.9127273,7.27272727 30.9090909,7.27272727 Z M18.1818182,34.5454545 L7.27272727,34.5454545 L7.27272727,30.9090909 L18.1818182,30.9090909 L18.1818182,34.5454545 Z M25.4545455,27.2727273 L7.27272727,27.2727273 L7.27272727,23.6363636 L25.4545455,23.6363636 L25.4545455,27.2727273 Z M25.4545455,20 L7.27272727,20 L7.27272727,16.3636364 L25.4545455,16.3636364 L25.4545455,20 Z" id="Shape"></path> </g> </g> </g> </g> </svg>
                              </a>                          
                          </td>
                          <td class="align-middle text-center">
                              <a href="#" class="text-secondary text-xs font-weight-bold"> 
                                <svg class="text-dark" width="16px" height="16px" viewBox="0 0 40 44" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"> <title>document</title> <g id="Basic-Elements" stroke="none" stroke-width="1" fill="none" fill-rule="evenodd"> <g id="Rounded-Icons" transform="translate(-1870.000000, -591.000000)" fill="#FFFFFF" fill-rule="nonzero"> <g id="Icons-with-opacity" transform="translate(1716.000000, 291.000000)"> <g id="document" transform="translate(154.000000, 300.000000)"> <path class="color-background" d="M40,40 L36.3636364,40 L36.3636364,3.63636364 L5.45454545,3.63636364 L5.45454545,0 L38.1818182,0 C39.1854545,0 40,0.814545455 40,1.81818182 L40,40 Z" id="Path" opacity="0.603585379"></path> <path class="color-background" d="M30.9090909,7.27272727 L1.81818182,7.27272727 C0.814545455,7.27272727 0,8.08727273 0,9.09090909 L0,41.8181818 C0,42.8218182 0.814545455,43.6363636 1.81818182,43.6363636 L30.9090909,43.6363636 C31.9127273,43.6363636 32.7272727,42.8218182 32.7272727,41.8181818 L32.7272727,9.09090909 C32.7272727,8.08727273 31.9127273,7.27272727 30.9090909,7.27272727 Z M18.1818182,34.5454545 L7.27272727,34.5454545 L7.27272727,30.9090909 L18.1818182,30.9090909 L18.1818182,34.5454545 Z M25.4545455,27.2727273 L7.27272727,27.2727273 L7.27272727,23.6363636 L25.4545455,23.6363636 L25.4545455,27.2727273 Z M25.4545455,20 L7.27272727,20 L7.27272727,16.3636364 L25.4545455,16.3636364 L25.4545455,20 Z" id="Shape"></path> </g> </g> </g> </g> </svg>
                              </a>                          
                          </td>
                        </tr>

                    </tbody>
                  </table> --%>
            </div>


        </div>

    </div>
  
  </div>

  
</body>

<%@ include file="../template/core.jsp" %>

</html>