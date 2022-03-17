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

<%-- <script src="https://code.jquery.com/jquery-1.12.4.js"></script> --%>
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
  <input type="hidden" id="pageTitle" value="기술지원 관리">
  <input type="hidden" id="pageSubTitle" value="기술지원 문의 내역">

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
            <%-- <form method="GET" class="frmSearch" id="frmSearch" > --%>
                <div class="dataTable-top mb-n4">
                    <!-- 날짜 조회 -->
                    <div class="row">
                        <label class="text-md-start">신청일 기간 검색</label>
                        <div class="col-sm-4">
                            <input id="startDate" style="width:70%; display: inline;" class="text-xs form-control form-control-sm datepicker flatpickr-input" placeholder="시작일" value="${startDate}" type="text" onfocus="focused(this)" onfocusout="defocused(this)" readonly="readonly">&nbsp;&nbsp;&nbsp;-
                        </div>
                        <div class="col-sm-4 ms-n5">
                            <input id="endDate" style="width:70%; display: inline;" class="text-xs form-control form-control-sm datepicker flatpickr-input" placeholder="종료일" value="${endDate}" type="text" onfocus="focused(this)" onfocusout="defocused(this)" readonly="readonly">
                        </div>
                        <div class="mt-4 col-sm-12">
                            <span class="text-sm" style="font-weight: 700;">현재</span>
                            <span class="text-sm">${tmpCnt}</span> <span class="text-sm" style="font-weight: 700;">개</span> / 
                            <span class="text-sm" style="font-weight: 700;">총</span>
                            <span class="text-sm">${totalCnt}</span> <span class="text-sm" style="font-weight: 700;">개</span>
                        </div>
                        
                    </div>
                    <div class="dataTable-search ">
                        <input class="dataTable-input2" placeholder="검색" name="keyword" id="keyword" value="${keyword}" type="text" maxlength="30">
                        <a class="search-btn" href="javascript:fnSearch();"><i class="fas fa-search"></i></a>
                    </div>
                

                </div>
            <%-- </form> --%>
                    
              <div class="dataTable-container">
              
                <table class="table align-items-center mb-0">
                    <thead>
                    <hr>
                        <tr>
                            <th style="font-size: 16px; color:#344767;">접수번호</th>

                            <th style="font-size: 16px; color:#344767;">분류</th>
 
                            <th style="font-size: 16px; color:#344767;">문의</th>
                            
                            <th class="text-center" style="font-size: 16px; color:#344767;">유저 아이디</th>
                            
                            <th class="text-center" style="font-size: 16px; color:#344767;">상태</th>
                            <th class="text-center" style="font-size: 16px; color:#344767;">신청일시</th>
                            <th class=""></th>
                        </tr>
                    </thead>
                    <tbody>
                      <c:forEach items="${list}" var="list" varStatus="status" >

                            <tr>
                                <td class="align-middle text-start">
                                    <span style="margin-right:4px;" class="text-secondary text-xs font-weight-bold">
                                        ${list.seq}
                                    </span>
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
                                <td>
                                    <div class="d-flex px-2 py-1">
                                        <div class="d-flex flex-column justify-content-center">
                                            <h6 class="mb-0 text-xs">
                                                <a href="/support/view?seq=${list.seq}" class="text-secondary font-weight-bold text-xs" style="text-decoration: underline;" data-toggle="tooltip" data-original-title="Edit user">
                                                   ${list.title}
                                                </a>    
                                            
                                            </h6>
                                        </div>
                                    </div>
                                </td>
                                
                               
                                <td class="align-middle text-center">
                                   <span class="text-secondary text-xs font-weight-bold">  ${list.userid} </span>
                                </td>
                                
                                <td class="align-middle text-center">
                                    <c:if test='${list.status eq "P"}' >
                                        <span class="badge badge-success badge-md">처리중</span>
                                    </c:if>

                                    <c:if test='${list.status eq "D"}' >
                                       <span class="badge badge-secondary badge-md">답변완료</span>
                                    </c:if>

                                </td>
                                <td class="align-middle text-center">
                                
                                <div>
                                    <span id="${list.seq}" class="text-secondary text-xs font-weight-bold"> ${list.viewDate} </span>
                                </div>

                                  
                                </td>
                                <td class="align-middle">
                                    <a href="/support/view?seq=${list.seq}" class="text-secondary font-weight-bold text-xs" data-toggle="tooltip" data-original-title="Edit user">
                                    답변
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
                            <a class="page-link" href="javascript:funcSubmit('${nowPage -1}')" aria-label="Next">

                            <%-- <a class="page-link" href="/support/list?page=${nowPage -1}" aria-label="Previous"> --%>
                                <i class="fa fa-angle-left"></i>
                                <span class="sr-only">Previous</span>
                            </a>
                        </c:if>
                        <c:if test="${nowPage <= 1}">
                            <a class="page-link" href="javascript:funcSubmit('${nowPage }')" aria-label="Next">
                            <%-- <a class="page-link" href="/support/list" aria-label="Previous"> --%>
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
                            <%-- <a class="page-link" href="/support/list?page=${nowPage +1}" aria-label="Next"> --%>
                                <i class="fa fa-angle-right"></i>
                                <span class="sr-only">Next</span>
                            </a>
                        </c:if>
                        <c:if test="${nowPage >= totalPage-1}">
                            <a class="page-link" href="javascript:funcSubmit('${totalPage -1}')" aria-label="Next">
                            <%-- <a class="page-link" href="/support/list?page=${totalPage-1}" aria-label="Next"> --%>
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

<script>
$(document).ready(function(){

    $(".datepicker").datepicker({
        dateFormat: 'yy-mm-dd'
        ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
        ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
        ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
        ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                
    
    });


});

$('#endDate').on("propertychange change value",function () {    
    const startDate = $("#startDate").val();
    const endDate = $("#endDate").val();
    
    console.log("startDate : " + startDate );
    console.log("endDate : " + endDate );

    if(startDate.length != 0 ){
        if(endDate < startDate ){
            $("#startDate").val(endDate);
            $("#endDate").val(startDate);
        
            location.href="/support/searchDate?startDate="+endDate+"&endDate="+startDate;

        } else{
            location.href="/support/searchDate?startDate="+startDate+"&endDate="+endDate;
        }
        
        
       
    }else{
        // alert("시작일을 입력해주세요");
        location.href="/support/search?endDate="+endDate;
    }
        


}); 



</script>


<script>

function funcSubmit(page){
    console.log("page >> "+page);
    const keyword = $("#keyword").val();
    
    const startDate = $("#startDate").val();
    const endDate = $("#endDate").val();
    console.log("startDate >> "+startDate);
    console.log("endDate >> "+endDate);
    
    if(startDate.length != 0 && endDate.length != 0  ){
        location.href="/support/searchDate?startDate="+startDate+"&&endDate="+endDate+"&&page="+page;
    }else if(keyword != null){
        location.href="/support/search?keyword="+keyword+"&&page="+page;
    }else{
        location.href="/support/list?page="+page;

    }

}


function fnSearch(){
    const keyword = $("#keyword").val();
    console.log("keyword : "+keyword);
    location.href="/support/search?keyword="+keyword;
}

function fnDelete(seq){
    console.log("seq >> "+seq);
    if(confirm("삭제하시겠습니까?")){
        location.href="/support/delete?seq="+seq;
    }
}

</script>
</html>