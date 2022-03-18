<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  
  <title>
    Hamonize Cloud Service | Pricing
  </title>
</head>

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


<!-- tuideditor -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>


<body class="g-sidenav-show bg-gray-100">
    <div class="page-header position-relative" style="border-radius:7px;">
        <span class="mask bg-gradient-primary opacity-6"></span>
        <div class="container pb-lg-9 pb-10 pt-7 postion-relative z-index-2">
            <div class="row mt-4">
             
            </div>
            <div class="row">

            </div>
        </div>
    </div>
    <div class="mt-n9">
        <div class="container mb-4 shadow-lg" style="border-radius:7px;">
            <div class="tab-content tab-space">
                <div class="tab-pane active" id="monthly">
                    <div class="row">            
                        <div class="col-lg-12 mb-lg-0 mb-4">
                            <div class="card mb-4">
                            <div class="card-header text-center pt-4 pb-3">
                                <span class="text-uppercase font-weight-bold text-dark" id="view_name">이름을 입력해주세요</span><br>
                                    
                                    <span id="view_price" class="h2 font-weight-bold mt-2"> </span>
                                    
                                <span class="h2 font-weight-bold">원</span>
                            </div>
                            
                            <div class="card-body text-lg-start text-center pt-0">
                                <div id="viewer" class="ms-3 d-flex justify-content-lg-start justify-content-center p-2">
                                설명을 입력해주세요
                                </div>
                                <div class="d-flex justify-content-lg-start justify-content-center p-2">
                                    <div class="icon icon-shape icon-xs rounded-circle bg-gradient-success shadow text-center">
                                        <i class="fas fa-check opacity-10" aria-hidden="true"></i>
                                    </div>
                                    <div>
                                        <span id="view_feat_1" class="ps-3">입력해주세요</span>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-lg-start justify-content-center p-2">
                                    <div class="icon icon-shape icon-xs rounded-circle bg-gradient-success shadow text-center">
                                        <i class="fas fa-check opacity-10" aria-hidden="true"></i>
                                    </div>
                                    <div>
                                        <span id="view_feat_2" class="ps-3">입력해주세요</span>
                                    </div>
                                </div>

                                <div class="d-flex justify-content-lg-start justify-content-center p-2">
                                    <div class="icon icon-shape icon-xs rounded-circle bg-gradient-success shadow text-center">
                                        <i class="fas fa-check opacity-10" aria-hidden="true"></i>
                                    </div>
                                    <div>
                                        <span id="view_feat_3" class="ps-3">입력해주세요</span>
                                    </div>
                                </div>
                                
                                <a href="javascript:;" class="btn btn-icon btn-dark d-lg-block mt-3 mb-0">
                                    선택하기
                                    <i class="fas fa-arrow-right ms-1" aria-hidden="true"></i>
                                </a>
                            </div>
                            </div>
                        </div>
                      
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

  <%-- <%@ include file="../template/core.jsp" %> --%>

</body>

<script>
const Viewer = toastui.Editor;
const viewer = new Viewer({ 
    el: document.querySelector('#viewer'), 
    height: '100px', 
    initialValue: content   
});

</script>
</html>