<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Hamonize Cloud Service | Support Apply
  </title>
<%@ include file="../template/top2.jsp" %>

<link rel="stylesheet" href="/dist/themes/default/style.min.css" />
<script src="/dist/jstree.min.js"></script>



</head>


<body class="g-sidenav-show bg-gray-100">
    <input type="hidden" id="pageTitle" value="포탈 메뉴 관리">
    <input type="hidden" id="pageSubTitle" value="메뉴 편집">

    <div class="position-absolute w-100 min-height-300 top-0">
        <span class="mask bg-warning opacity-6"></span>
    </div>
    
    <!-- left menu -->
    <%@ include file="../template/aside.jsp" %>

    <div class="main-content position-relative max-height-vh-100 h-100">
        <div class="row ms-1" style="margin-top: 14.25rem !important;">

            <div class="col-sm-12">
                <!-- navbar -->
                <%@ include file="../template/navbar.jsp" %>
            </div>    
            <!-- 메뉴 트리 -->
            <div class="col-md-4 card shadow-lg mx-4 ">
                <div class="card-body p-3">
                    <div id="jstree">

                    </div>
                </div>
            </div>

            <!-- 메뉴 상세 -->
            <div class="col-md-6 card shadow-lg mx-4 ">
                <div class="card-body p-3">
                    <h5 class="font-weight-bolder">메뉴 편집</h5>    
                        <div class="d-flex align-items-center">
                        <a href="/support/list" class="btn btn-secondary btn-sm ms-auto" > 목록으로</a>
                        <input type="hidden" id="seq" value="${edit.seq}">
                        <input type="hidden" id="status" value="${edit.status}">
                        <button onClick="saveSubmit()" class="btn btn-danger btn-sm   " style="margin-left:1%">
                            <c:if test="${edit.seq == null}">
                                생성하기
                            </c:if>    
                            <c:if test="${edit.seq != null}">
                                수정하기
                            </c:if>    
                        </button>
                        </div>


                        <div class="row">
                            <div class="col-12">
                                    <label class="text-md-start">게시판 아이디</label>
                                    <input class="form-control" type="text" id="title" name="title" value="${edit.title}" required>
                            </div>


                            <div class="col-12">
                                <label class="text-md-start">게시판 이름</label>
                                <input class="form-control" type="text" id="title" name="title" value="${edit.title}" required>
                            </div>



                            <div class="col-12 col-sm-6 mt-3 mt-sm-0">
                                <label class="sub-title" > 작성 권한</label>
                                <input type="hidden" id="select_type" value="${edit.type}" >
                                <select class="form-control" name="type" id="type" required focused>
                                    <option value="" disabled selected hidden>선택해주세요</option>
                                    <option value="ADMIN" >관리자</option>
                                    <option value="USER">유저</option>
                                    <option value="ALL">모두</option>
                                </select>
                            </div>

                            <div class="col-12 col-sm-6 mt-3 mt-sm-0 ">
                                <label class="sub-title" > 사용여부</label>

                                <div class="form-check form-switch">
                                    <input class="form-check-input2" type="checkbox" id="used" checked>
                                    <label class="form-check-label" for="used"></label>
                                </div>

                            </div>

                                
                        </div>

                    </div>

                </div>
            </div> 
        </div>  
    </div>  

</body>

<%@ include file="../template/core.jsp" %>
<script>
$('#jstree').jstree({
    'core': {
        'data': [{
            "id": "ajson1",
            "parent": "#",
            "text": "Simple root node"
        }, {
            "id": "ajson2",
            "parent": "#",
            "text": "Root node 2"
        }, {
            "id": "ajson3",
            "parent": "ajson2",
            "text": "Child 1"
        }, {
            "id": "ajson4",
            "parent": "ajson2",
            "text": "Child 2"
        }, ]
    }
}).bind('select_node.jstree', function(event, data){
    var id = data.instance.get_node(data.selected).id;        //id 가져오기
    console.log("id = >"+id );
});


</script>
</html>