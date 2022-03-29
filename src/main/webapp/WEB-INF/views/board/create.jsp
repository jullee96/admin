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

</head>

<style>
tr:hover { 
    background-color: #fb634059;
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
                                <div class="row mb-4">
                                    <div class="col-12 mb-2">
                                        <p class="text-md-start">사이트맵 이름</p>
                                        <input class="form-control" type="text" id="sitemapname" name="sitemapname" required>
                                    </div>
                                    
                                    <div class="col-12 mt-sm-2 ">
                                        <button class="btn btn-warning" style="display:inline;" type="submit">  저장 </button>
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

                                        <tr onClick="fnShowMenu();" >
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
                <div id="div-edit-sitemap" style="display:none;" class="ms-4 col-md-4">
                    <div class="card">
                        <div class="card-header pb-0">
                           <h5 id="sitemap-title" class="font-weight-bolder">사이트맵 수정</h5>   
                        </div>
                        <form id="sitemapEditForm" name="sitemapEditForm" method="POST" action="javascript:fnSaveSitemap('edit');" >
                            <div class="card-body pb-0">
                                <div class="row mb-4">
                                    <div class="col-12 mb-2">
                                        <p class="text-md-start">사이트맵 이름</p>
                                        <input type="hidden" id="smseq" name="smseq">

                                        <input class="form-control" type="text" id="sitemapname" name="sitemapname" required>
                                    </div>
                                    
                                    <div class="col-12 mt-sm-2 ">
                                        <button class="btn btn-sm btn-secondary " style="display:inline;" type="button" onclick="fndelete('sitemap')">  삭제 </button>
                                        <button class="btn btn-sm btn-danger ms-2" type="submit">  수정 </button>

                                    </div>
                                        
                                </div>
                            </div>
                        </form>
                    </div>
                </div>

                <!-- 메뉴 생성 화면-->
                <div id="div-menu" style="display:none;" class="ms-4 col-md-4">
                    <div class="card">
                        <div class="card-header pb-0">
                           <h5 id="menu-name" class="font-weight-bolder">메뉴 추가</h5>   
                        </div>
                        <form id="menuForm" name="menuForm" method="POST" action="javascript:fnSaveMenu();" >
                            <div class="card-body pb-0">

                                <div class="row">
                                    <div class="d-flex align-items-center">
                                        <a href="#" class="btn btn-secondary btn-sm ms-auto" > 목록으로</a>
                                        <button class="btn btn-danger btn-sm" type="submit" style="margin-left:1%">
                                            생성하기
                                        </button>
                                    </div>
                                </div>
                                <div class="row mb-4">
                                    <div class="col-12 mb-2">
                                        <label class="text-md-start">메뉴 아이디</label>
                                        <input class="form-control" type="text" id="boardid" name="boardid" value="" required>
                                    </div>
                                    <div class="col-12 mb-2">
                                        <label class="text-md-start">메뉴 이름</label>
                                        <input class="form-control" type="text" id="boardname" name="boardname" required>
                                    </div>
                                    <div class="col-6 mt-3 mt-sm-0 mb-2">
                                        <label class="sub-title" > 작성 권한</label>
                                        <select class="form-control" name="boardrole" id="boardrole" required focused>
                                            <option value="" disabled selected hidden>선택해주세요</option>
                                            <option value="ADMIN" >관리자</option>
                                            <option value="USER">유저</option>
                                            <option value="ALL">모두</option>
                                        </select>
                                    </div>
                                    <div class="col-4 mt-sm-0 ">
                                        <label class="sub-title" > 사용여부</label>
                                        <input type="hidden" id="boardused" name="boardused" >
                                        <input type="hidden" id="pseq" name="pseq" >

                                        <div class="form-check form-switch">
                                            <input class="form-check-input2" type="checkbox" id="ckused" checked>
                                            <label class="form-check-label" for="ckused"></label>
                                        </div>

                                    </div>
                                    <div class="col-12 mb-2">
                                        <label class="text-md-start">디자인 </label>
                                        <%-- <input class="form-control" type="text" id="boardname" name="boardname" required> --%>
                                    </div>
                                        
                                </div>
                            </div>
                        </form>
                    </div>
                </div>


                <div style="display:none;" class="ms-4 col-md-4">
                    <div class="card">
                        <div class="card-header pb-0">
                           <h5 class="font-weight-bolder">게시판 속성</h5>   
                        </div>
                        <div class="card-body pb-0">
                            <div class="row">
                                <div class="d-flex align-items-center">
                                    <a href="#" class="btn btn-secondary btn-sm ms-auto" > 목록으로</a>
                                    <input type="hidden" id="status" value="">
                                    
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
    console.log("loaded after");
    $('#jstree').jstree(true).select_node(0);
})
.bind('select_node.jstree', function(event, data){
    var id = data.instance.get_node(data.selected).id;        
    var type = data.instance.get_node(data.selected).type;             
    var name = data.instance.get_node(data.selected).text;             
    console.log("id  : "+id);
    console.log("name  : "+name);
    
   
    $("#sitemapShowname").empty();
    $("#menu-name").empty();
    
    $("#div-sitemap-menu").hide();
    $("#div-add-sitemap").hide();
    $("#div-edit-sitemap").hide();
    $("#div-menu").hide();
    
    if(type == 'menu'){
        $("#div-menu").show();
        $("#menu-name").append(name);
        

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
        $("#div-menu").hide();
        $("#div-menu").show();
   
   } else{
        $("#div-edit-sitemap").hide();
        $("#div-menu").show();
       
    }
    
}


function fnSaveSitemap(type){

    if(type=="new"){
        document.sitemapForm.action="/board/saveSitemap";
        document.sitemapForm.submit();
    }else{
        document.sitemapEditForm.action="/board/editSitemap";
        document.sitemapEditForm.submit();
    }


}

function fnSaveMenu(){
    console.log("checked : " + $("#ckused").is(":checked"));
    console.log("smseq : " + $("#smseq").val());
    console.log("boardrole : " + $("#boardrole").val());
    const pseq =  $("#smseq").val();

    if($("#ckused").is(":checked") == false ){
        document.menuForm.boardused.value = 0;
    } else{
        document.menuForm.boardused.value = 1;
    }
    document.menuForm.pseq.value = pseq;
    document.menuForm.action="/board/saveMenu";
    document.menuForm.submit();

}


</script>
</html>