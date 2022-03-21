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
<%@ include file="../template/core.jsp" %>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/flatpickr/dist/flatpickr.min.css">
<script src="https://cdn.jsdelivr.net/npm/flatpickr"></script>

<script src="../argon/assets/js/plugins/flatpickr.min.js"></script>

<style>
.th-header-font{
    font-size: 16px;
    color: #344767;

}

.search-btn{
    position: relative;
    left: -29px;
}
.reset-btn{
    position: relative;
    left: -19px;
}
.filter-btn{
    position: relative;
    left: 75px;
}

.filter-dropdown{
    border: 1px solid #ccc;
}
.filter-text{
    color: #ccc;
    font-size: 0.875rem;

}

.filter-text:hover{
    color: #495057;
}
</style>


<body class="g-sidenav-show bg-gray-100">
  <input type="hidden" id="pageTitle" value="상품 관리">
  <input type="hidden" id="pageSubTitle" value="상품 리스트">

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
            <div class="dataTable-wrapper dataTable-loading no-footer sortable searchable fixed-columns" >
                    
              <div class="dataTable-container">
                <div class="d-flex align-items-center">
                    <a href="/product/create" class="btn btn-danger btn-sm ms-auto"> 등록하기</a>
                </div>
                <table class="table align-items-center mb-0">
                    <thead>
                        <tr>
                            <th style="font-size: 16px; color:#344767;">상품번호</th>
                            <th style="font-size: 16px; color:#344767;">상품 이름</th>
                            <th style="font-size: 16px; color:#344767;">가격</th>
                            <th class="text-center" style="font-size: 16px; color:#344767;">등록일</th>
                            <th class=""></th>
                        </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${list}" var="list" varStatus="status" >

                            <tr>
                                <td class="align-middle text-start">
                                    <span style="margin-right:4px;" class="text-secondary text-xs font-weight-bold">
                                        ${list.pdid}
                                    </span>
                                </td>
                                <td class="align-middle text-start">
                                    <span  class="text-secondary text-xs font-weight-bold">

                                        ${list.pdname}
                                    </span>
                                </td>
                                <td class="align-middle text-start">
                                    <span  class="text-secondary text-xs font-weight-bold">

                                        ${list.pdprice}
                                    </span>
                                </td>
                                
                               
                                <td class="align-middle text-center">
                                   <span class="text-secondary text-xs font-weight-bold">  ${list.viewDate} </span>
                                </td>
                                
                                <td class="align-middle">
                                    <a href="/product/view?pdid=${list.pdid}" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                                    상세
                                    </a>
                                        | 
                                    <a href="#" onClick="fnDelete(${list.pdid})" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
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
                  <%-- <ul class="pagination">
                    <li class="page-item">
                        <c:if test="${nowPage > 1}">
                            <a class="page-link" href="javascript:funcSubmit('${nowPage -1}')" aria-label="Next">

                                <i class="fa fa-angle-left"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                        </c:if>
                        <c:if test="${nowPage <= 1}">
                            <a class="page-link" href="javascript:funcSubmit('${nowPage }')" aria-label="Next">
                                <i class="fa fa-angle-left"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                        </c:if>
                        
                        
                    </li>
                    
                    <c:forEach begin="1" end="${totalPage}" var="i" >
                        <li class="page-item">
                            <c:if test="${nowPage == i-1}">
                                <a class="badge-warning page-link" href="javascript:funcSubmit('${i-1}')">${i}</a>

                            </c:if>
                            <c:if test="${nowPage != i-1}">
                                    <a class="page-link" href="javascript:funcSubmit('${i-1}')">${i}</a>
                            </c:if>
                        </li>
                    </c:forEach>

                    <li class="page-item"> 
                        <c:if test="${nowPage < totalPage-1}">
                            <a class="page-link" href="javascript:funcSubmit('${nowPage +1}')" aria-label="Next">
                                <i class="fa fa-angle-right"></i>
                                <span class="sr-only">Next</span>
                            </a>
                        </c:if>
                        <c:if test="${nowPage >= totalPage-1}">
                            <a class="page-link" href="javascript:funcSubmit('${totalPage -1}')" aria-label="Next">
                                <i class="fa fa-angle-right"></i>
                                <span class="sr-only">Next</span>
                            </a>
                        </c:if>

                    </li>
                  </ul> --%>
                </nav>
            </div>    
 </div>

        </div>

    </div>
  
  </div>

  
</body>

<script>
$(document).ready(function(){



}); 



</script>


<script>


function fnSearch(){
    const keyword = $("#keyword").val();
    console.log("keyword : "+keyword);
    location.href="/support/search?keyword="+keyword;
}

function fnDelete(pdid){
    console.log("pdid >> "+pdid);
    if(confirm("삭제하시겠습니까?")){
        location.href="/product/delete?pdid="+pdid;
    }
}

</script>
</html>