<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
  Hamonize Cloud Service | User List
  </title>
</head>
<%@ include file="../template/top2.jsp" %>

<body class="g-sidenav-show bg-gray-100">
  <input type="hidden" id="pageTitle" value="회원 관리">
  <input type="hidden" id="pageSubTitle" value="회원 리스트">

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
                        <th data-sortable="" style="width: 7%;">
                          <a href="#" class="dataTable-sorter">번호</a>
                        </th>
                        <th data-sortable="" style="width: 16.3848%;">
                          <a href="#" class="dataTable-sorter">아이디</a>
                        </th>
                        <th data-sortable="" style="width: 16.2429%;">
                          <a href="#" class="dataTable-sorter">이름</a>
                        </th>
                        <th data-sortable="" style="width: 19.5766%;">
                          <a href="#" class="dataTable-sorter">도메인</a>
                        </th>
                        <th data-sortable="" style="width: 22.3429%;">
                          <a href="#" class="dataTable-sorter">이메일 인증 여부</a>
                        </th>
                        <th data-sortable="" style="width: 10.8523%;">
                          <a href="#" class="dataTable-sorter">활성 여부</a>
                        </th>
                        <th data-sortable="" style="width: 10.8523%;">
                          <a href="#" class="dataTable-sorter">가입일</a>
                        </th>
                      </tr>
                    </thead>
                    <tbody>
                    <c:forEach items="${list}" var="list" varStatus="status" >
                    
                      <tr>
                        <td>
                          <div class="d-flex align-items-center">
                            <div class="form-check">
                              <input class="form-check-input" type="checkbox" id="customCheck1">
                            </div>
                            <p class="text-xs font-weight-bold ms-2 mb-0">${list.seq}</p>
                          </div>
                        </td>
                        <td class="font-weight-bold">
                          <span class="my-2 text-xs">${list.userid}</span>
                        </td>
                        <td class="text-xs font-weight-bold">
                            <a href="/user/detail?userid=${list.userid}&seq=${list.seq}"><span>${list.username}</span></a>
                        </td>
                        <td class="text-xs font-weight-bold">
                          <div class="d-flex align-items-center">
                            <span>${list.domain}</span>
                          </div>
                        </td>
                        <td class="text-xs font-weight-bold">
                          <span class="my-2 text-xs">
                            <c:if test="${list.role eq 'ROLE_GUEST'}">
                              미완료
                            </c:if>
                            <c:if test="${list.role eq 'ROLE_USER'}">
                              완료
                            </c:if>
                          </span>
                        </td>
                        <td class="text-xs font-weight-bold">
                            <div class="d-flex align-items-center">
                              <c:if test="${list.status == 'A'}">
                                <button class="btn btn-icon-only btn-rounded btn-outline-success mb-0 me-2 btn-sm d-flex align-items-center justify-content-center"><i class="fas fa-check" aria-hidden="true"></i></button>
                                <span>활성</span>

                              </c:if>
                              <c:if test="${list.status != 'A'}">
                                <button class="btn btn-icon-only btn-rounded btn-outline-danger mb-0 me-2 btn-sm d-flex align-items-center justify-content-center"><i class="fa fa-times" aria-hidden="true"></i></button>
                                <span>비활성</span>
                              </c:if>
                            </div>                        
                          </td>
                        <td class="text-xs font-weight-bold">
                          <span class="my-2 text-xs">${list.viewdate}</span>
                        </td>

                      </tr>
                    </c:forEach>
                      <tr></tr>
                    </tbody>
                  </table>
              </div>
              
              
              <div class="dataTable-bottom">
                <nav aria-label="Page navigation example">
                  <ul class="pagination">
                    <li class="page-item">
                        <c:if test="${nowPage > 1}">
                            <a class="page-link" href="/user/list?page=${nowPage -1}" aria-label="Previous">
                                <i class="fa fa-angle-left"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                        </c:if>
                        <c:if test="${nowPage <= 1}">
                            <a class="page-link" href="/user/list" aria-label="Previous">
                                <i class="fa fa-angle-left"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                        </c:if>
                        
                        
                    </li>
                    <c:forEach begin="1" end="${totalPage}" var="i" >
                        <li class="page-item">
                            <a class="page-link" href="/user/list?page=${i-1}">${i} </a>
                        </li>
                    </c:forEach>
                    <li class="page-item"> 
                        <c:if test="${nowPage < totalPage-1}">
                            <a class="page-link" href="/user/list?page=${nowPage +1}" aria-label="Next">
                                <i class="fa fa-angle-right"></i>
                                <span class="sr-only">Next</span>
                            </a>
                        </c:if>
                        <c:if test="${nowPage >= totalPage-1}">
                            <a class="page-link" href="/user/list?page=${totalPage-1}" aria-label="Next">
                                <i class="fa fa-angle-right"></i>
                                <span class="sr-only">Next</span>
                            </a>
                        </c:if>

                    </li>
                  </ul>
                </nav>
              </div>    

            </div>


        </div>

    </div>
  
  </div>

  
</body>

<%@ include file="../template/core.jsp" %>

</html>