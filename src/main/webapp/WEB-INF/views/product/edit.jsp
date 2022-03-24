<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <title>
    Hamonize Cloud Service | Support Apply
  </title>

<!-- tuideditor -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/codemirror/5.48.4/codemirror.min.css"/>
<link rel="stylesheet" href="https://uicdn.toast.com/editor/latest/toastui-editor.min.css" />
<script src="https://uicdn.toast.com/editor/latest/toastui-editor-all.min.js"></script>

</head>
<%@ include file="../template/top2.jsp" %>

<style>


.contents{
    font-family: "Open Sans", sans-serif;
    color: #495057;
    font-size: 0.875rem;
    border-radius: 0.5rem;
    /* margin-left:px; */
}

.sub-title{
    margin-top:10px;
}

img[alt=alt_img] { 
    width: 500px; 
}
.btn-status{
    padding: 0.5rem 1rem;
    margin-left:10px; 
}

.icon-pos{
    position: relative;
    top:-32px;
    left:-30px;
}
.icon-pos:hover{

}

</style>


<body class="g-sidenav-show bg-gray-100">
  <input type="hidden" id="pageTitle" value="상품 관리">
  <input type="hidden" id="pageSubTitle" value="상품 등록">
                   
  <div class="position-absolute w-100 min-height-300 top-0" >
    <span class="mask bg-warning opacity-6"></span>
  </div>
  <%@ include file="../template/aside.jsp" %>


  <div class="main-content position-relative max-height-vh-100 h-100">
    <!-- Navbar -->
    <div class="row mt-11">
      <%@ include file="../template/navbar.jsp" %>
    </div>
    <!-- End Navbar -->

    <form id="productForm" name="productForm" method="post" action="" > 
        <input type="hidden" id="pdid" name="pdid" value="${product.pdid}">
   
        <div class="row mb-4">
            <div class=" col-12 col-md-6 card shadow-lg mx-4 " style="margin-left:30px;">
                <div class="card-body">
                    <h5 class="font-weight-bolder">상품 등록</h5>
                    <label class="h6">화면 출력 여부</label> 
                    <input type="hidden" id="pdstatus" name="pdstatus" value="${product.pdstatus}">   
                    <div class="form-check form-switch">
                        <c:if test="${product.pdstatus == 's'}">
                            <input class="form-check-input2"  type="checkbox" id="status" checked="checked">
                            <label class="form-check-label" for="status"></label>
                        </c:if>
                        <c:if test="${product.pdstatus == 'h'}">
                            <input class="form-check-input2"  type="checkbox" id="status" >
                            <label class="form-check-label" for="status"></label>
                        </c:if>
                        <c:if test="${product.pdstatus == '' || product.pdstatus == null}">
                            <input class="form-check-input2"  type="checkbox" id="status" checked="checked">
                            <label class="form-check-label" for="status"></label>
                        </c:if>
                    </div>
                    
                    <div class="mt-4 row">
                        <div class="col-12">
                            <label class="h6">이름</label>
                            <input class="form-control" type="text" id="pdname" name="pdname" value="${product.pdname}">
                        </div>
                        <div class="col-12 mt-3 mt-sm-0">
                            <label class="h6 mt-3">가격</label>
                            <input class="form-control" type="text" id="pdprice" name="pdprice" maxlength="10" oninput="maxLengthCheck(this)" value="${product.pdprice}">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 mb-2">
                            <label class="h6 mt-4 ">설명</label>
                            <input type="hidden" name="pdinfo" id="pdinfo" value="${product.pdinfo}">
                            <div class="contents" id ="editor"> ${product.pdinfo}</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mb-4">
                            <input type="hidden" name="pdfeature" id="pdfeature" value="${product.pdfeature}">

                            <label class="h6 ">특징</label>
                            <button type="button" class="mt-3 ms-2 btn btn-xs btn-outline-secondary " onclick="fnAddFeat()">+ 추가</button>
                            <ul id="check-list" class="check-list">
                                
                            </ul>        
                        </div>
                    </div>
                    
                    <div class="d-flex align-items-center">
                        <a href="/product/list" class="btn btn-secondary btn-sm ms-auto"> 목록</a>
                        <c:if test ="${product.pdid == null }">
                            <button type="button" class="btn btn-danger btn-sm " style="margin-left:1%" onclick="fnSubmit('');">
                                등록
                            </button>
                        </c:if>
                        <c:if test ="${product.pdid != null }">
                            <a href="/product/delete?pdid=${product.pdid}" class="btn btn-dark btn-sm" style="margin-left:1%"> 삭제</a>

                            <button type="button" class="btn btn-warning btn-sm " style="margin-left:1%" onclick="fnSubmit('${product.pdid}');">
                                수정
                            </button>

                        </c:if>
                    </div>
                </div>

            </div>

            <div class="col-12 col-md-4 card shadow-lg mx-4">
                <div class="card-body">
                    <h5 class="font-weight-bolder">미리보기</h5>
                        <%@ include file="../product/detail.jsp" %>  
                </div>
            </div>

        </div>

    </form>
  
</body>

<%@ include file="../template/core.jsp" %>
<script class="code-js"> 
var markdown;
const Editor = toastui.Editor;
const editor = new Editor({ 
    el: document.querySelector('#editor'), 
    height: '200px', 
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
    },
    events: {
        keyup(editorType, ev) {
            viewer.setMarkdown(editor.getHTML());
        }
    },
    toolbarItems: [
        ['heading', 'bold', 'italic', 'strike'],
        ['hr', 'quote'],
        ['ul', 'ol', 'task'],
    ]
         
        
});


</script>


<script>
var n=0;
$(document).ready(function(){
    const pdid = $("#pdid").val().length;

    if(pdid > 0){ //수정 하는 경우
        const pdfeatureList = $("#pdfeature").val().split(',');
        const price = $( "#pdprice" ).val().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
        
        $( "#view_name" ).text($( "#pdname" ).val());
        $( "#view_price" ).text(price);
      
       viewer.setMarkdown(editor.getHTML());
        // document.getElementById("viewer").innerHTML = $("#pdinfo").val();
        n = pdfeatureList.length;
      
        for(let i=1;i<=n;i++){
            $("#check-list").append("<li name='feat-li' id='"+i+"' > <input class='form-control' id='feat_"+i+"' name='feat_"+i+"' value='"+pdfeatureList[i-1]+"' > <a href='javascript:fnDeleteFeat("+i+");'><div class='icon-pos icon icon-shape icon-xs rounded-circle bg-gradient-secondary shadow text-center'><i class='fas fa-minus' aria-hidden='true'></i></div></a> </li> ");
            $("#feats").append("<div id='view_"+i+"' class='d-flex justify-content-lg-start justify-content-center p-2'> <div class='icon icon-shape icon-xs rounded-circle bg-gradient-success shadow text-center'>  <i class='fas fa-check opacity-10' aria-hidden='true'></i> </div> <div><span id='view_feat_"+i+"' class='ps-3' >"+pdfeatureList[i-1]+"</span></div> </div>");
        }
    
    
    }

});

var cnt = 1;
function fnAddFeat(){
    if(n == 0 ){
        $("#check-list").append("<li name='feat-li' id='"+cnt+"' ><input class='form-control' id='feat_"+cnt+"' name='feat_"+cnt+"' > <a href='javascript:fnDeleteFeat("+cnt+");'><div class='icon-pos icon icon-shape icon-xs rounded-circle bg-gradient-secondary shadow text-center'><i class='fas fa-minus' aria-hidden='true'></i></div></a></li>");
        $("#feats").append("<div id='view_"+cnt+"' class='d-flex justify-content-lg-start justify-content-center p-2'> <div class='icon icon-shape icon-xs rounded-circle bg-gradient-success shadow text-center'>  <i class='fas fa-check opacity-10' aria-hidden='true'></i> </div> <div><span id='view_feat_"+cnt+"' class='ps-3'>입력해주세요</span></div> </div>");
    
        cnt++;
    }else{ 
        n++;
        $("#check-list").append("<li name='feat-li' id='"+n+"'><input class='form-control' id='feat_"+n+"' name='feat_"+n+"' > <a href='javascript:fnDeleteFeat("+n+");'><div class='icon-pos icon icon-shape icon-xs rounded-circle bg-gradient-secondary shadow text-center'><i class='fas fa-minus' aria-hidden='true'></i></div></a></li>");
        $("#feats").append("<div id='view_"+n+"' class='d-flex justify-content-lg-start justify-content-center p-2'> <div class='icon icon-shape icon-xs rounded-circle bg-gradient-success shadow text-center'>  <i class='fas fa-check opacity-10' aria-hidden='true'></i> </div> <div><span id='view_feat_"+n+"' class='ps-3' >입력해주세요</span></div> </div>");
        
    }

}

$( "#check-list" ).on("keyup value", function(event){
    document.getElementById("view_"+event.target.id).innerText = event.target.value;
});



$( "#pdname" ).on("keyup propertychange change value",function() {
    const pdname = $("#pdname").val();
    document.getElementById("view_name").innerText = pdname;
});

$( "#pdprice" ).on("keyup propertychange change value",function() {
    const pdprice = $("#pdprice").val().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",");
    document.getElementById("view_price").innerText = pdprice;
});




function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
        object.value = object.value.slice(0, object.maxLength);
    }   
}


function makeFeats(){
    var len = $("li[name='feat-li']").length;
   
    var feats = new Array(len);

    for(let i=0;i<len;i++){ // 0 1 2 3 
        feats[i] = $("li > input ")[i].value;
    }
                
    return feats;
}


function fnSubmit(pdid){
    var feats = makeFeats();
    const checked = $("#status").is(":checked");

    
    if(checked){
        document.productForm.pdstatus.value="s";
    }else{
        document.productForm.pdstatus.value="h";
    }
    
    document.productForm.pdfeature.value=feats;
    document.productForm.action="/product/save";
    document.productForm.pdinfo.value=editor.getHTML();
    document.productForm.submit();

}


function fnDeleteFeat(id){
    console.log("feat_"+id );
    
    $("#"+id).remove();
    $("#view_"+id).remove();
    
}

</script>




</html>