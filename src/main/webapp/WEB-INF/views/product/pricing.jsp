<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>
    Hamonize Cloud Service | Pricing
  </title>

<!-- tuideditor -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

</head>

<%@ include file="../template/top2.jsp" %>



<body class="g-sidenav-show   bg-gray-100">
    <div class="page-header position-relative" >
        <span class="mask bg-gradient-primary opacity-6"></span>
        <div class="container pb-lg-9 pb-10 pt-7 postion-relative z-index-2">
            <div class="row mt-4">
                <div class="col-md-6 mx-auto text-center">
                    <p class="text-white">PRICING</p>
                    <h3 class="text-white">합리적인 가격으로 <br>하모나이즈를 바로 <br>만나보세요!</h3>
                </div>
            </div>
            <div class="row">

            </div>
        </div>
    </div>
    <div class="mt-n8">
        <div class="container">
            <div class="tab-content tab-space">
                <div class="tab-pane active" id="monthly">
                    <div class="row">            
                        <!--  items col 동적 생성 -->
                        <input type="hidden" id="listLen" value="${listLen}">

                        <c:forEach items="${list}" var="list" varStatus="status" >
                        
                        <input type="hidden" id="pdfeature_${status.count}" value="${list.pdfeature}">
                        <input type="hidden" id="pdinfo_${status.count}" value="${list.pdinfo}">
                                
                        <div class="col-lg-4 mb-lg-0 mb-4 mt-2">
                            <div class="card">
                                <div class="card-header text-center pt-4 pb-3">
                                    <span class="text-uppercase font-weight-bold text-dark">${list.pdname}</span>
                                    <h1 class="font-weight-bold mt-2">
                                    <fmt:formatNumber value="${list.pdprice}" pattern="#,###" /> <small>원</small>
                                    </h1>
                                </div>
                                
                                <div class="card-body text-lg-start text-center pt-0">
                                <input type="hidden" id="pdinfo_${status.count}" value="${list.pdinfo}">
                                <div id="viewer_${status.count}" class="mb-0 ms-3" >
                                </div>
                                
                                <div id="feats_${status.count}"></div>
                                    <a href="/subscribe/payment?pdid=${list.pdid}" class="btn btn-icon btn-dark d-lg-block mt-3 mb-0">
                                    선택하기
                                    <i class="fas fa-
                                    arrow-right ms-1" aria-hidden="true"></i>
                                    </a>
                                </div>
                            </div>
                        </div>
                        <!-- end of items -->
                        </c:forEach >
                        
                    </div>
                </div>

            </div>
        </div>
    </div>

</body>
  
  <script src="../argon/assets/js/plugins/perfect-scrollbar.min.js"></script>
  <script src="../argon/assets/js/plugins/smooth-scrollbar.min.js"></script>
  <!-- Kanban scripts -->
  <script src="../argon/assets/js/plugins/dragula/dragula.min.js"></script>
  <script src="../argon/assets/js/plugins/jkanban/jkanban.js"></script>

  <%@ include file="../template/core.jsp" %>

</body>
<script>

$(document).ready(function(){
    const content = [].join('\n');

    const n = $("#listLen").val();
    console.log("list length : "+n);
    var arr = new Array(n);

    for(let j=1 ; j<=n ; j++){
        // 설명
        var pdinfo = $("#pdinfo_"+j+"").val();
        
        arr[j] = toastui.Editor.factory({
            el: document.querySelector('#viewer_'+j), 
            viewer: true, 
            height: '100px',
            initialValue : pdinfo 
        });
        
        // 특징
        const pdfeatureList = $("#pdfeature_"+j).val().split(',');
        const feat_n = pdfeatureList.length;
        
        for(let i=1;i<=feat_n;i++){
            $("#feats_"+j).append("<div id='view_"+j+"_"+i+"' class='d-flex justify-content-lg-start justify-content-center p-2'> <div class='icon icon-shape icon-xs rounded-circle bg-gradient-success shadow text-center'>  <i class='fas fa-check opacity-10' aria-hidden='true'></i> </div> <div><span id='view_feat_"+j+"_"+i+"' class='ps-3' >"+pdfeatureList[i-1]+"</span></div> </div>");
        }
    }
    
    
});

</script>
</html>