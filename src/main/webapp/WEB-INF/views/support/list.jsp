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
  <input type="hidden" id="pageTitle" value="기술지원 관리">
  <input type="hidden" id="pageSubTitle" value="기술지원 내역">

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
            <div class="d-flex align-items-center">
                  <a href="/support/apply" class="btn btn-danger btn-sm  ms-auto" > 신청하기</a>
                </div>

              <div class="dataTable-container">
                <table class="table align-items-center mb-0">
                    <thead>
                        <tr>
                            <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7">제목</th>
                            <th class="text-uppercase text-secondary text-xs font-weight-bolder opacity-7 ">분류</th>
                            <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">상태</th>
                            <th class="text-center text-uppercase text-secondary text-xs font-weight-bolder opacity-7">신청일</th>
                            <th class="text-secondary opacity-7"></th>
                        </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${list}" var="list" varStatus="status" >

                            <tr>
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <h6 class="mb-0 text-xs">
                                                <a href="/support/view?seq=${list.seq}" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                                                   ${list.title}
                                                </a>    
                                            
                                            </h6>
                                        </div>
                                    </div>
                                </td>
                                <td class="align-middle text-start">
                                    <span  class="text-secondary text-xs font-weight-bold">

                                        <c:if test='${list.type eq "P"}'>
                                            결제문의
                                        </c:if>
                                        <c:if test='${list.type eq "T"}'>
                                            기술문의
                                        </c:if><c:if test='${list.type eq "E"}' >
                                            기타문의
                                        </c:if>
                                    </span>
                                </td>
                            
                                
                                <td class="align-middle text-center">
                                    <span  class="text-secondary text-xs font-weight-bold">
                                        <c:if test='${list.status eq "P"}' > 처리중</c:if>
                                    </span>
                                </td>
                                <td class="align-middle text-center">
                                
                                <div id="aa">
                                    <span id="${list.seq}" class="text-secondary text-xs font-weight-bold"> ${list.viewDate} </span>
                                </div>

                                  
                                </td>
                                <td class="align-middle">
                                    <a href="/support/edit?seq=${list.seq}" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                                    수정
                                    </a>
                                        | 
                                    <a href="#" onClick="fnDelete(${list.seq})" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                                    삭제
                                    </a>

                                </td>
                            </tr>
                            
                        </c:forEach>
                        <tr><td></td> </tr>
                    </tbody>
                </table>
            </div>

            <div class="dataTable-bottom">
                <nav aria-label="Page navigation example">
                  <ul class="pagination">
                    <li class="page-item">
                        <c:if test="${nowPage > 1}">
                            <a class="page-link" href="/support/list?page=${nowPage -1}" aria-label="Previous">
                                <i class="fa fa-angle-left"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                        </c:if>
                        <c:if test="${nowPage <= 1}">
                            <a class="page-link" href="/support/list" aria-label="Previous">
                                <i class="fa fa-angle-left"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                        </c:if>
                        
                        
                    </li>
                    <c:forEach begin="1" end="${totalPage}" var="i" >
                        <li class="page-item">
                            <a class="page-link" href="/support/list?page=${i-1}">${i} </a>
                        </li>
                    </c:forEach>
                    <li class="page-item"> 
                        <c:if test="${nowPage < totalPage-1}">
                            <a class="page-link" href="/support/list?page=${nowPage +1}" aria-label="Next">
                                <i class="fa fa-angle-right"></i>
                                <span class="sr-only">Next</span>
                            </a>
                        </c:if>
                        <c:if test="${nowPage >= totalPage-1}">
                            <a class="page-link" href="/support/list?page=${totalPage-1}" aria-label="Next">
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

  
</body>

<%@ include file="../template/core.jsp" %>

<script>

function fnDelete(seq){
    console.log("seq >> "+seq);
    if(confirm("삭제하시겠습니까?")){
        location.href="/support/delete?seq="+seq;
    }
}

</script>
</html>