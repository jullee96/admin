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

<link rel="stylesheet" href="/dist/themes/proton/style.min.css" />
<link rel="stylesheet" href="/dist/themes/default/style.min.css" />
<script src="/dist/jstree.min.js"></script>
<!-- tuideditor -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

</head>

<style>

.toastui-editor-contents img[alt=alt_img] { 
  /* position: relative; */
    width: 100%;
    max-width: 400px;
    height: auto;
    /* transform: translate(-50%, -50%); */
}


tr:hover { 
    background-color: #fb634059;
}
}
.b-icon{
    color: #344767 !important;
}
}
.b-text{
    color: #344767 !important;
}

#board ~ label {
  color: #8392ab;
  border-color: #8392ab;
}

#board:checked ~ label {
  color: #2dce89;
  border-color: #2dce89;
}

#board:checked .b-icon {
  color: #2dce89;
  border-color: #2dce89;
 
}

#board:checked .b-text {
  color: #2dce89;
  border-color: #2dce89;
 
}

#wiki:checked ~ label {
  color: #2dce89;
  border-color: #2dce89;
 
}
</style>
<body class="g-sidenav-show bg-gray-100">
    <input type="hidden" id="pageTitle" value="포탈 메뉴 관리">
    <input type="hidden" id="pageSubTitle" value="메뉴 편집">

    <div class="position-absolute w-100 min-height-300 top-0">
        <span class="mask bg-warning opacity-6"></span>
    </div>

    <!-- left menu -->
    <%@ include file="../template/aside.jsp" %>
    <!-- End of left menu -->

    <div class="mt-11 main-content position-relative max-height-vh-100 h-100">
        <!-- Navbar -->
        <%@ include file="../template/navbar.jsp" %>
        <!-- End of Navbar -->
        <div class="container-fluid py-4">
            <div class="row mt-n2">
                <!-- 조직도 정보 -->
                <div class="col-md-2">
                    <div class="card">
                        <div class="card-header ">
                            <h5 class="font-weight-bolder">사이트맵 편집</h5>   
                            <div class="d-flex align-items-end" >
                                <a class=" text-xs" href="javascript:fnCloseAll();"> [ - 닫기 ]</a>
                                <a class="ms-2 text-xs" href="javascript:fnOpenAll();"> [ + 열기 ]</a>
                                <a class="ms-2 text-xs" href="javascript:fnShowSitemap('new');"> [ + 사이트맵 추가 ]</a>
                            </div>
                        </div>
      
                        <div class="ps-2 mt-n4 row card-body ">
                            <div class="d-flex px-2 py-1 align-items-center ms-3 col-md-4">
                                <div id="jstree"></div>
                            </div>
                        </div>
                    </div>  
                </div>
                <!-- end of 조직도 정보 -->

               <!-- 사이트맵 추가 -->
                <div id="div-add-sitemap" style="display:none;" class="ms-4 col-md-4">
                    <div class="card">
                        <div class="card-header pb-0">
                           <h5 id="sitemap-title" class="font-weight-bolder">사이트맵 추가</h5>   
                        </div>
                        <form id="sitemapForm" name="sitemapForm" method="POST" action="javascript:fnSaveSitemap('new');" >
                            <div class="card-body pb-0">
                                <div class="row mb-2">
                                    <div class="col-12 mb-2">
                                        <p class="text-md-start">사이트맵 이름</p>
                                        <input class="form-control" type="text" id="sitemapname" name="sitemapname" required>
                                    </div>
                                    
                                    <div class="col-12 mt-sm-2 ">
                                        <button class="btn btn-warning btn-sm" style="display:inline;float: right;" type="submit">저장 </button>
                                    </div>
                                        
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
                
                <!-- 사이트맵 메뉴 선택화면-->
                <div id="div-sitemap-menu" style="display:none;" class="ms-4 col-md-3">
                    <div class="card">
                        <div class="card-header pb-0">
                           <h5 class="font-weight-bolder" id="sitemapShowname" name="sitemapShowname"></h5>   
                        </div>
    
                        <div class="card-body pb-0">
                            <div class="table-responsive">
                                <table class="table align-items-center">
                                    <tbody>
                                        <tr onClick="fnShowSitemap('edit');" >
                                            <td class="w-15">
                                                <div class="d-flex px-2 py-1 align-items-center">
                                                    <div style="display:inline;" class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center">
                                                        <i class="ni ni-settings opacity-10"></i>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="w-40">
                                                <div class="ms-4">
                                                    <h6 class="text-sm mb-1">사이트맵 수정</h6>
                                                </div>
                                            </td>
                                            <td class="align-middle text-sm">
                                                <div class="col text-center">
                                                    <div>
                                                        <i class="ni ni-bold-right" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                        <tr onClick="fnShowMenu('new');" >
                                            <td class="w-15">
                                                <div class="d-flex px-2 py-1 align-items-center">
                                                    <div style="display:inline;" class="icon icon-shape icon-sm me-3 bg-gradient-dark shadow text-center">
                                                        <i class="ni ni-collection opacity-10"></i>
                                                    </div>
                                                </div>
                                            </td>
                                            <td class="w-40">
                                                <div class="ms-4">
                                                    <h6 class="text-sm mb-1">메뉴 추가</h6>
                                                </div>
                                            </td>
                                            <td class="align-middle text-sm">
                                                <div class="col text-center">
                                                    <div>
                                                        <i class="ni ni-bold-right" aria-hidden="true"></i>
                                                    </div>
                                                </div>
                                            </td>
                                        </tr>

                                    </tbody>
                            
                                </table>
                            </div>
                        </div>

                    </div>
                </div>
               
               <!-- 사이트맵 수정 -->
                <div id="div-edit-sitemap" style="display:none;" class="col-md-3 ms-4">
                    <div class="card">
                        <div class="card-header pb-0">
                           <h5 id="sitemap-title" class="font-weight-bolder">사이트맵 수정</h5>   
                        </div>
                        <form id="sitemapEditForm" name="sitemapEditForm" method="POST" action="javascript:fnSaveSitemap('edit');" >
                            <div class="card-body pb-0">
                                <div class="row mb-2">
                                    <div class="col-12 mb-2">
                                        <p class="text-md-start">사이트맵 이름</p>
                                        <input type="hidden" id="smseq" name="smseq">
                                        <input class="form-control" type="text" id="sitemapname" name="sitemapname" required>
                                    </div>
                                    
                                    <div class="col-12 mt-sm-2 " >
                                        <button class="btn btn-sm btn-danger ms-2 "style="float: right;" type="submit">  수정 </button>
                                        <button class="btn btn-sm btn-secondary " style="display:inline;float: right;" type="button" onclick="fndelete('sitemap')">  삭제 </button>

                                    </div>
                                        
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- 메뉴 생성 화면-->
                <div id="div-menu" style="display:none;" class="col-md-3 ms-4">
                    <div class="card">
                        <div class="card-header pb-0">
                           <h5 id="menu-name" class="font-weight-bolder">메뉴 추가</h5>   
                        </div>
                        <form id="menuForm" name="menuForm" method="POST" action="javascript:fnSaveMenu('new');" >
                            <div class="card-body pb-0 mb-2">
                                <input type="hidden" id="bcseq" name="bcseq">
                                    
                                <div class="row mb-4">
                                    <div class="col-12 mb-2">
                                        <label class="text-md-start">메뉴 아이디</label>
                                        <input class="form-control" type="text" id="bcid" name="bcid" required>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <label class="text-md-start">메뉴 이름</label>
                                        <input class="form-control" type="text" id="bcname" name="bcname" required>
                                    </div>
                                    <div class="col-6 mt-3 mt-sm-0 mb-2">
                                        <label class="sub-title" > 작성 권한</label>
                                        <select class="form-control" name="bcrole" id="bcrole" required focused>
                                            <option value="" disabled selected hidden>선택해주세요</option>
                                            <option value="ADMIN" >관리자</option>
                                            <option value="USER">유저</option>
                                            <option value="ALL">모두</option>
                                        </select>
                                    </div>
                                    <div class="col-4 mt-sm-0 ">
                                        <label class="sub-title" > 사용여부</label>
                                        <input type="hidden" id="bcused" name="bcused" >
                                        <input type="hidden" id="pseq" name="pseq" >

                                        <div class="form-check form-switch">
                                            <input class="form-check-input2" type="checkbox" id="ckused" checked>
                                            <label class="form-check-label" for="ckused"></label>
                                        </div>

                                    </div>
                                    <div class="col-12 mb-2">
                                       <label class="text-md-start">디자인 타입 선택</label>
                                            
                                        <div class="row mt-2">
                                            <div class="col-5 ms-3">
                                                <input id="board" type="checkbox" style="display:none" name="bctype" value="board" onclick="fnBoardTypeChk(this)">
                                                    <label for="board" class="btn btn-outline-secondary btn-lg border-1 px-5 py-4 ">
                                                        <i class="ni ni-bullet-list-67 b-icon"></i>
                                                        <span class="b-text">board</span>
                                                    </label>
                                                
                                                </div>

                                            <div class="col-5 ms-4">
                                                <input id="wiki" type="checkbox" style="display:none" name="bctype" value="wiki" onclick="fnBoardTypeChk(this)">
                                                    <label for="wiki" class="btn btn-outline-secondary btn-lg border-1 px-5 py-4" >
                                                        <i class="ni ni-archive-2 b-icon"></i>
                                                        <span class="b-text">wiki</span>
                                                    </label>
                                                    
                                            </div>
                                        </div>
                                    </div>

                                    <div id="div-mkpage" style="display:none;" class="col-12 mb-2">
                                       <label class="text-md-start">작성글 관리</label>
                                        <input type="hidden" id="tmp-content">    
                                        <div class="row ">
                                            <div class="col-12 ">
                                                <a class="w-100 btn btn-sm btn-outline-secondary" href="javascript:fnGetPageList();"> 작성글 보기</a>
                                            </div>
                                        </div>
                                        <div class="row ">
                                            <div class="col-12 ">
                                                <a class="w-100 btn btn-sm btn-outline-secondary" href="javascript:fnShowPageCreate();"> 새 글쓰기</a>
                                            </div>
                                        </div>
                                    </div>
                                        
                                </div>

                                <div class="row">
                                    <div >
                                        <div style="float: right;" id="btnMenuEdit" style="display:none;">
                                            <button class="btn btn-secondary btn-sm" type="button" onclick="fnDeleteMenu()">
                                                삭제하기
                                            </button>
                                            <button class="btn btn-danger btn-sm ms-2" type="button" onclick="fnEditMenu()">
                                                수정하기
                                            </button>
                                        </div>
                                        <button id="btnMenuNew" class="btn btn-danger btn-sm" type="submit" style="margin-left:1%">
                                            생성하기
                                        </button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <div id="div-page-list" style="display:none;" class="ms-4 col-md-6">
                    <div class="card">
                        <div class="card-header pb-0">
                           <h5 class="font-weight-bolder">작성글 목록</h5>   
                        </div>
                        <div class="card-body pb-0 mb-4"><hr>
                            <div class="table-responsive">
                                <table class="table align-items-center">
                                    <thead>
                                        <tr>
                                            <td class="text-sm text-bold text-start"> 글 번호 </td>
                                            <td class="text-sm text-bold text-start"> 제목 </td>
                                            <td class="text-sm text-bold text-start"> 작성자 </td>
                                            <td class="text-sm text-bold text-start"> 날짜 </td>
                                            <td> </td>

                                        </tr>
                                    </thead>
                                    <tbody id="pageTable"></tbody>
                            
                                </table>
                            </div>
                        </div>
                    
                    </div>
                </div>

                <div id="div-page-create" style="display:none;" class="ms-4 col-md-6">
                    <div class="card">
                        <div class="card-header pb-0">
                           <h5 class="font-weight-bolder">글 작성하기</h5>   
                        </div>
                        <form id="pageForm" name="pageForm" method="POST" action="javascript:fnSavePage();" >
                        
                            <div class="card-body pb-0">
                                <div class="row mb-4">
                                    <div class="col-12 mb-2">
                                        <label class="text-md-start">제목</label>
                                        <input class="form-control" type="text" id="btitle" name="btitle" required>
                                    </div>
                                    <div class="col-12 ">
                                        <label class="text-md-start">내용</label>
                                        <input type="hidden" id="bcontent" name="bcontent" >
                                        <input type="hidden" name="bcseq" >
                                        <input type="hidden" name="bseq" >
                        
                                        <div id="editor"></div>
                                    </div>

                                    <div class="col-12" >
                                        <div style="float: right;" >
                                            <button type="button" onclick="fnCloseMkPage()" class=" mt-4 btn btn-sm btn-secondary me-2">닫기</button>
                                            <button type="submit" class=" mt-4 btn btn-sm btn-danger" >저장</button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <div id="div-page-view" style="display:none;" class="ms-4 col-md-6">
                    <div class="card">
                        <div class="card-header pb-0">
                           <h5 class="font-weight-bolder">작성글 상세</h5>   
                        </div>
                        <div class="card-body pb-0">
                            <div class="row mb-4">
                                    <div class="col-6 mb-2">
                                        <label class="text-md-start">글 번호</label>
                                        <input class="form-control" type="text" id="view-bseq" disabled>
                                    </div>
                                    <div class="col-6 mb-2">
                                        <label class="text-md-start">공개 여부</label>
                                        <input type="hidden" name="bseq" >

                                        <div class="form-check form-switch">
                                            <input class="form-check-input2" type="checkbox" id="ckbused" checked>
                                            <label class="form-check-label" for="ckbused"></label>
                                        </div>
                                    </div>
                                    <div class="col-6 mb-2">
                                        <label class="text-md-start">작성자</label>
                                        <input class="form-control" type="text" id="view-userid" disabled>
                                    </div>
                                    <div class="col-6 mb-2">
                                        <label class="text-md-start">작성일</label>
                                        <input class="form-control" type="text" id="view-viewdate" disabled>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <label class="text-md-start">제목</label>
                                        <input class="form-control" type="text" id="view-btitle" disabled>
                                    </div>
                                    <div class="col-12 ">
                                        <label class="text-md-start">내용</label>
                                        <input type="hidden" id="view-content" >
                                        <div id="viewer"></div>
                                    </div>

                                    <div class="col-12" >
                                        <div style="float: right;" >
                                            <button type="button" onclick="fnGotoPageList()" class=" mt-4 btn btn-sm btn-secondary me-2">목록으로</button>
                                            <button type="button" onclick="fnDeletepage()" class=" mt-4 btn btn-sm btn-dark"> 삭제하기</button>
                                            <button type="button" onclick="fnShowEditPage()" class=" mt-4 btn btn-sm btn-danger" >수정하기</button>
                                        </div>
                                    </div>
                                </div>


                        </div>
                    
                    </div>
                </div>
            </div>

        </div>
        <%@ include file="../template/footer.jsp" %>
    </div>
 
</body>

<%@ include file="../template/core.jsp" %>
<script>
$('#jstree').jstree({
    plugins: ["dnd", "state", "types", "search","themes","wholerow"] , 
    core: {
      themes: {
            'name': 'proton',
            'responsive': true
      },
      check_callback: true,
      data : {
        url : "/board/list" ,
        dataType : "json"
      }
      
    },
    types:{
      "sitemap" : {
        "icon" : "fa fa-folder fa-sm text-secondary"
      },
      "menu" : {
        "icon" : "ni ni-collection fa-sm text-success" 
      },
      "page":{
        "icon" : "fa fa-newspaper-o fa-sm text-secondary" 
      }
    }

})
.bind('loaded.jstree', function(event, data){
    $('#jstree').jstree(true).select_node(0);
})
.bind('select_node.jstree', function(event, data){
    var id = data.instance.get_node(data.selected).id;        
    var type = data.instance.get_node(data.selected).type;             
    var name = data.instance.get_node(data.selected).text;
    var bc = data.instance.get_node(data.selected).a_attr.data_quantity;             
    
    $("#sitemapShowname").empty();
    $("#menu-name").empty();
    $("input[name=bctype]").prop('checked' ,false);
    
    $("#div-sitemap-menu").hide();
    $("#div-add-sitemap").hide();
    $("#div-edit-sitemap").hide();
    $("#div-menu").hide();
    
    if(type == 'menu'){

        fnShowMenu('edit');

        $("#menu-name").append(name);
        $("#bcid").val(bc.bcid);
        $("#bcname").val(bc.bcname);
        $("#bcrole").val(bc.bcrole);
        $("#bcseq").val(bc.bcseq);

        if(bc.bcused == 0){
            $("#ckused").prop('checked' ,false);
        } else {
            $("#ckused").prop('checked' ,true);
        }

        if(bc.bctype == "board"){
            $("#board").prop('checked' ,true);
        } else {
            $("#wiki").prop('checked' ,true);
        }

    } else{
        if(id != 0){
            $("#div-sitemap-menu").show();
            $("#sitemapShowname").append(name);
            $("#div-edit-sitemap #sitemapname").val(name);
            $("#smseq").val(id);
        } else{
            $("#div-sitemap-menu").hide();
            $("#div-add-sitemap").hide();
            $("#div-edit-sitemap").hide();
            $("#div-menu").hide();
        }
    }
    
    
});

function fnOpenAll(){
  $("#jstree").jstree("open_all");
}  

function fnCloseAll(){
  $("#jstree").jstree("close_all");
}  


function fnShowSitemap(type){
    console.log($("#div-edit-sitemap #sitemapname").val());
    if(type == 'edit' ){
        $("#div-menu").hide()
        $("#div-edit-sitemap").show();
       
    } else if(type == 'new'){
        $("#div-menu").hide();
        $("#div-edit-sitemap").hide();
        $("#div-sitemap-menu").hide();
        $("#div-add-sitemap").show();
    }
    
}


function fnShowMenu(type){
    if(type =="edit" ){
        $("#div-edit-sitemap").hide();
        $("#div-menu").show();
        $("#btnMenuNew").hide();
        $("#btnMenuEdit").show();
        $("#div-mkpage").show();
        $("#div-page-list").hide();
        $("#div-page-view").hide();
   } else { // new
        $("#menuForm")[0].reset();
        $("#bcseq").val('');
        $("#div-edit-sitemap").hide();
        $("#div-menu").show();
        $("#btnMenuNew").show();
        $("#btnMenuEdit").hide();
        $("#div-mkpage").hide();
    }
}


function fnSaveSitemap(type){
    if(type == "new"){
        document.sitemapForm.action="/board/saveSitemap";
        document.sitemapForm.submit();
    }else if(type =="edit"){
        document.sitemapEditForm.action="/board/editSitemap";
        document.sitemapEditForm.submit();
    } else{
        alert("error");
    }


}

function fnSaveMenu(){
    const pseq =  $("#smseq").val();
    
    if($("#ckused").is(":checked") == false ){
        document.menuForm.bcused.value = 0;
    } else{
        document.menuForm.bcused.value = 1;
    }
    document.menuForm.pseq.value = pseq;
    document.menuForm.action="/board/saveMenu";
    document.menuForm.submit();

}

function fnEditMenu(){
    var seq = document.menuForm.bcseq.value;
    console.log("fnEditMenu 수정할 seq > " +seq);
    if($("#ckused").is(":checked") == false ){
        document.menuForm.bcused.value = 0;
    } else{
        document.menuForm.bcused.value = 1;
    }
    document.menuForm.action="/board/editMenu";
    document.menuForm.submit();    
}

function fnDeleteMenu(){
    var seq = document.menuForm.bcseq.value;
    if(confirm("메뉴를 삭제할 경우 하위 페이지 글까지 모두 \n삭제됩니다. 메뉴를 삭제하시겠습니까?")){
        document.menuForm.action="/board/deleteMenu";
        document.menuForm.submit();
    }
}

function fnBoardTypeChk(type){
    const checked =type.value;
    var obj = document.getElementsByName("bctype");
    for(let i=0;i<obj.length;i++){
        if(obj[i] != type){
            obj[i].checked = false;
        }
    }
}

function fnShowPageCreate(){
    console.log("fnShowPageCreate menu seq >>> " + $("#bcseq").val() );
   $("#div-page-list").hide();
   $("#div-page-view").hide();
   
   $("#div-page-create").show();

}

function fnSavePage(){
    const bcseq = $("#bcseq").val();
    const bseq = $("#view-bseq").val();
    console.log("bcseq > "+bcseq);
    console.log("bseq > "+bseq);
    
   if(bseq == '' || bseq == null ){
        document.pageForm.bcseq.value=bcseq;
        document.pageForm.bcontent.value = editor.getHTML();
        document.pageForm.action="/board/savePage";
   }else{
        document.pageForm.bcseq.value=bcseq;
        document.pageForm.bseq.value=bseq;
        document.pageForm.bcontent.value = editor.getHTML();
        document.pageForm.action="/board/editPage";
   }

    document.pageForm.submit();
}

function fnCloseMkPage(){
    $("#div-page-create").hide();
    $("#pageForm")[0].reset();
    $(".ProseMirror > p").remove();
    
}

function fnGetPageList(){
    $("#div-page-create").hide();
    $("#div-page-view").hide();
    
    $("#div-page-list").show();
    $("#pageTable").empty();
    
    const bcseq = $("#bcseq").val();
    console.log("bcseq >  "+bcseq);

    $.ajax({
        type:"POST",
        url: "/board/getPageList",
        data: { bcseq : bcseq } ,
        async:false,
        success: function(boards){
            console.log("boards.length : "+boards.length);
            if(boards.length == 0 ){
                var html="";
                html += '<tr><td></td><td><span class="text-sm text-center">게시글이 존재하지 않습니다</span><td></tr>';
                 $("#pageTable").append(html);
            }else{
                for(let i=0;i<boards.length;i++){
                    var html="";
                    
                    // $("#tmp-content").val(boards[i].bcontent);
                    
                    html += '<tr onClick="fnPageView( \''+boards[i].bseq+'\'\,' +'\''+boards[i].btitle+'\'\,'+'\''+boards[i].bcontent+'\'\,'+'\''+boards[i].userid+'\'\,'+'\''+ boards[i].viewdate+'\''+');" > <td class="w-15">'+boards[i].bseq+'</td> ';
                    // html += '<tr onClick="fnPageView( \''+boards[i].bseq+'\'\,' +'\''+boards[i].btitle+'\'\,'+'\''+boards[i].userid+'\'\,'+'\''+ boards[i].viewdate+'\''+');" > <td class="w-15">'+boards[i].bseq+'</td> ';
                    html += '<td class="w-40"><div ><h6 class="text-sm mb-1">'+boards[i].btitle+'</h6> </div></td>';
                    html += '<td class="w-15">'+boards[i].userid+'</td> <td class="w-15">'+boards[i].viewdate+'</td>'
                    html += '<td class="align-middle text-sm"> <div class="col text-center"><div class="text-sm">상세 <i class="ni ni-bold-right" aria-hidden="true"></i> </div> </div></td>  </tr>'
                    $("#pageTable").append(html);
                }
            }
        
        }
    });

}

// function fnPageView( bseq, btitle, userid, viewdate ){
function fnPageView( bseq, btitle, bcontent, userid,  viewdate ){
    $("#div-page-list").hide();
    $("#div-page-view").show();
    console.log("bcontent : "+bcontent);

    bcontent = bcontent.replaceAll("@", "'");

    console.log("convert after bcontent : "+bcontent);

    $("#view-bseq").val(bseq);
    $("#view-btitle").val(btitle);
    $("#view-userid").val(userid);
    $("#view-viewdate").val(viewdate);
    $("#view-content").val(bcontent);


    var Viewer = toastui.Editor.factory;
    var viewer = new Viewer({ 
        el: document.querySelector('#viewer'), 
        height: '500px', 
        initialValue: bcontent, 
        viewer:true
    });


}

function fnGotoPageList(){
    $("#div-page-view").hide();
    $("#div-page-list").show();
    
}


function fnShowEditPage(){
    const bcseq = $("#bcseq").val();
    console.log("fnShowPageCreate menu seq >>> " + $("#bcseq").val() );
    console.log("fnShowPageCreate menu btitle >>> " + $("#view-btitle").val() );
    console.log("bcontent >> "+ $("#view-content").val());

    $("#div-page-view").hide();
    $("#div-page-create").show();
    $("#btitle").val($("#view-btitle").val());
    editor.setMarkdown($("#view-content").val());

    // $("#btnSavePage").hide();
    // <button type="button" id="btnSavePage" class=" mt-4 btn btn-sm btn-danger" >수정</button>

}

</script>

<script>

const Editor = toastui.Editor;
const editor = new Editor({ 
    el: document.querySelector('#editor'), 
    height: '300px', 
    initialEditType: 'wysiwyg',
    previewStyle: 'vertical',
    customHTMLRenderer: {
    htmlBlock: {
        iframe(node) {
                return [
                { type: 'openTag', tagName: 'iframe', outerNewLine: true, attributes: node.attrs },
                { type: 'html', content: node.childrenHTML },
                { type: 'closeTag', tagName: 'iframe', outerNewLine: true },
                ];
            },
        }
    },
    hooks:{
        addImageBlobHook: (blob, callback) => {
            const img_url = uploadImage(blob);
            callback(img_url.split("uploads")[1] , 'alt_img');
        }    
    }
    
});



function uploadImage(blob){
    let url;

    let filename = new Date().getTime() + ".png";
    let InputFiles = new File([blob], filename, {
        type: "image/png",
        lastModified: Date.now()
    });

    const keytype ="board";

    if(InputFiles == null ){
        alert("파일을 선택해주세요");
        return;
    }
  
    var formData = new FormData();

    formData.append("keyfile", InputFiles);
    formData.append("keytype", keytype);
    
    $.ajax({
        type:"POST",
        url: "/file/upload",
        processData: false,
        contentType: false,
        data: formData,
        async:false,
        success: function(retval){
            if(retval != "F"){
                console.log("업로드 성공" +retval);
               
            } else{
                console.log("업로드 실패");
            }
            url = retval;
        }
    });

    return url;
}



</script>

</html>