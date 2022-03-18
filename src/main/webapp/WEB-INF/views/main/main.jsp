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

.a-text{
  color:#67748E;
}
.a-text:hover{
  color:#f5365c;
  
}
</style>


<body class="g-sidenav-show bg-gray-100">
  <input type="hidden" id="pageTitle" value="메인">
  <input type="hidden" id="pageSubTitle" value="대시보드">

  <div class="position-absolute w-100 min-height-300 top-0" >
    <span class="mask bg-warning opacity-6"></span>
  </div>
  <%@ include file="../template/aside.jsp" %>


  <div class="main-content position-relative max-height-vh-100 h-100">
    <!-- Navbar -->
    <div class="mt-10">
    <%@ include file="../template/navbar.jsp" %>
    </div>
    <!-- End Navbar -->

    <div class="container-fluid pb-4">
      <div class="row">
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">이번달 매출합</p>
                    <h5 class="font-weight-bolder">
                      0
                    </h5>
                    <p class="mb-0 text-sm">
                      <span class="text-success font-weight-bolder">+55%</span>
                      저번달 대비
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-primary shadow-primary text-center rounded-circle">
                    <i class="ni ni-money-coins text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">총 유저수</p>
                    <h5 class="font-weight-bolder">
                      ${totalUserCnt}
                    </h5>
                    <p class="mb-0 text-sm">
                      <span class="text-success font-weight-bolder">+3%</span>
                      저번달 대비
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-danger shadow-danger text-center rounded-circle">
                    <i class="ni ni-satisfied text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6 mb-xl-0 mb-4">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">총 도메인 수</p>
                    <h5 class="font-weight-bolder">
                      ${totalDomainCnt}
                    </h5>
                    <p class="mb-0 text-sm">
                      <span class="text-danger font-weight-bolder">-2%</span>
                      저번달 대비
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-success shadow-success text-center rounded-circle">
                    <i class="ni ni-world text-lg opacity-10" aria-hidden="true"></i>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="col-xl-3 col-sm-6">
          <div class="card">
            <div class="card-body p-3">
              <div class="row">
                <div class="col-8">
                  <div class="numbers">
                    <p class="text-sm mb-0 text-uppercase font-weight-bold">기술문의 처리 현황</p>
                     <span class="text-success text-sm font-weight-bolder">처리중</span>
                      /
                     <span class="text-dark text-sm font-weight-bolder">답변 완료</span>
                        <br>
                      <span class="h5 font-weight-bolder text-success ms-3">${totalSupportProcessingCnt} &nbsp;  </span> 
                      / <span class="h5 font-weight-bolder text-dark text-align-right"> &nbsp;  ${totalSupportCnt - totalSupportProcessingCnt} </span> 
                    <p style="display:inline;" class="text-sm mb-0 ms-4">
                    처리율
                      <span style="display:inline;" class="text-danger text-sm font-weight-bolder">
                        <fmt:formatNumber type="percent" value="${totalSupportProcessingCnt / totalSupportCnt}"/>
                      </span>
                    </p>
                  </div>
                </div>
                <div class="col-4 text-end">
                  <div class="icon icon-shape bg-gradient-warning shadow-warning text-center rounded-circle">
                    <svg class="mt-3" xmlns="http://www.w3.org/2000/svg" height="18" width="18" viewBox="0 0 18 18"><title>comments</title><g fill="#FFFF" class="nc-icon-wrapper"><path data-color="color-2" d="M15,4h-1v6c0,0.552-0.448,1-1,1H6.828L5,13h5l3,3v-3h2c0.552,0,1-0.448,1-1V5 C16,4.448,15.552,4,15,4z"></path> <path fill="#FFFF" d="M1,0h10c0.552,0,1,0.448,1,1v7c0,0.552-0.448,1-1,1H6l-3,3V9H1C0.448,9,0,8.552,0,8V1C0,0.448,0.448,0,1,0z"></path></g></svg>

                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="row mt-4">
      
      </div>
      <div class="row mt-4">

        <div class="col-lg-12">
          <div class="card">
            <div class="mb-2 card-header pb-0 p-3">
              <h6 class="mb-0 me-4" style="display:inline;">기술지원 요청 내역</h6>
              <a class="a-text text-sm" href="/support/list"> + 전체보기</a>
            </div>


            <div class="table-responsive">
              <table class="table align-items-center">
                <tbody>
                <c:forEach items="${list}" var="list" varStatus="status">
                  <tr>
                    <td class="w-15">
                      <div class="d-flex px-2 py-1 align-items-center">
                          <c:if test='${list.type eq "P"}'>
                            <div style="display:inline;" class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center">
                              <i class="ni ni-credit-card text-white opacity-10"></i>
                            </div>
                            <span class="text-sm">
                              결제문의
                            </span>
                          </c:if>
                          <c:if test='${list.type eq "T"}'>
                            <div style="display:inline;" class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center">
                              <i class="ni ni-settings text-white opacity-10"></i>
                            </div>
                            <span class="text-sm">
                              기술문의
                            </span>
                          </c:if><c:if test='${list.type eq "E"}' >
                            <div style="display:inline;" class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center">
                              <i class="ni ni-app opacity-10"></i>
                            </div>
                            <span class="text-sm">
                              기타문의
                            </span>
                          </c:if>
                        

                    </td>
                    <td class="w-40">
                        <div class="ms-4">
                          <h6 class="text-sm mb-1">${list.title}</h6>
                          <p class="text-xs font-weight-bold mb-0"> ${list.viewDate}</p>
                      </div>
                    </td>
                    <td>
                      <div class="text-center">
                        <h6 class="text-sm">${list.userid}</h6>
                      </div>
                    </td>
                    
                    <td>
                      <div class="text-center">
                        <c:if test='${list.status eq "P"}' >
                          <span class="badge badge-success badge-md">처리중</span>
                        </c:if>
                      </div>
                    </td>
                    <td class="align-middle text-sm">
                      <div class="col text-center">
                        <div >
                          <a href="/support/view?seq=${list.seq}" class="btn btn-link btn-icon-only btn-rounded btn-sm text-dark icon-move-right my-auto"><i class="ni ni-bold-right" aria-hidden="true"></i></a>
                        </div>
                      </div>
                    </td>
                  </tr>
                </c:forEach>
                </tbody>
              </table>
            </div>

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

$('#afterdate').on("propertychange change value",function () {    
    const beforedate = $("#beforedate").val();
    const afterdate = $("#afterdate").val();
      
    console.log("beforedate : " + beforedate );
    console.log("afterdate : " + afterdate );

    if(beforedate.length !=0 ){
        if(afterdate < beforedate ){
            $("#beforedate").val(afterdate);
            $("#afterdate").val(beforedate);
        }

        location.href="/support/searchDate?startDate="+beforedate+"&endDate="+afterdate;

    }else{
        // alert("시작일을 입력해주세요");
        // $("#afterdate").val(afterdate);
        location.href="/support/searchDate?endDate="+afterdate;

    }

}); 



</script>
</html>