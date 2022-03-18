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

    <form id="productForm" name="productForm" method="post" action="javascript:fnSubmit();" > 
        <div class="row mb-4">
            <div class=" col-12 col-md-4 card shadow-lg mx-4 " style="margin-left:30px;">
                <div class="card-body">
                    <h5 class="font-weight-bolder">상품 등록</h5>
                    <div class="mt-4 row">
                        <div class="col-12">
                            <label class="h6">이름</label>
                            <input class="form-control" type="text" id="pdname" name="pdname" >
                        </div>
                        <div class="col-12 mt-3 mt-sm-0">
                            <label class="h6 mt-3">가격</label>
                            <input class="form-control" type="text" id="pdprice" name="pdprice" maxlength="10" oninput="maxLengthCheck(this)">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-sm-12 mb-4">
                            <label class="h6 mt-4 ">설명</label>
                            <input type="hidden" name="pdinfo" id="pdinfo" value="">
                            <div class="contents" id ="editor"> ${edit.contents}</div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-12 mb-4">
                            <input type="hidden" name="pdfeature" id="pdfeature">

                            <label class="h6 ">특징</label>
                            <ul class="check-list">
                                <li class="mb-2">
                                    <input class="form-control " id="feat_1" name="feat_1" >
                                </li>
                                <li class="mb-2">
                                    <input class="form-control " id="feat_2" name="feat_2" >
                                </li>
                                <li class="mb-2">
                                    <input class="form-control " id="feat_3" name="feat_3" >
                                </li>
                            </ul>        
                                
                         
                        </div>
                    </div>
                    
                    <div class="d-flex align-items-center">
                        <a href="/product/list" class="btn btn-secondary btn-sm ms-auto"> 목록</a>
                        <button type="submit" class="btn btn-danger btn-sm " style="margin-left:1%">
                            등록
                        </button>
                    </div>
                </div>

            </div>

            <div class="col-12 col-md-6 card shadow-lg mx-4">
                <div class="card-body">
                    <h5 class="font-weight-bolder">미리보기</h5>
                        <%@ include file="../product/pricing_m.jsp" %>  
                </div>
            </div>

        </div>

    </form>
  
</body>

<%@ include file="../template/core.jsp" %>
<script class="code-js">

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
            const aa=editor.getMarkdown();
            document.getElementById("viewer").innerText = editor.getMarkdown();
        }
    },
    toolbarItems: [
        ['heading', 'bold', 'italic', 'strike'],
        ['hr', 'quote'],
        ['ul', 'ol', 'task', 'indent', 'outdent'],
        ['table', 'link'],
        ['code', 'codeblock'],
        ['scrollSync']
    ]
         
        
});

    



</script>


<script>



    $( "#pdname" ).on("keyup propertychange change value",function() {
        const pdname = $("#pdname").val();
        document.getElementById("view_name").innerText = pdname;
    });

    $( "#pdprice" ).on("keyup propertychange change value",function() {
        const pdprice = $("#pdprice").val();
        document.getElementById("view_price").innerText = pdprice;
    });

    $( "#feat_1" ).keyup(function() {
        const feat_1 = $("#feat_1").val();
        document.getElementById("view_feat_1").innerText = feat_1;
    });

    $( "#feat_2" ).keyup(function() {
        const feat_2 = $("#feat_2").val();
        document.getElementById("view_feat_2").innerText = feat_2;
    });
    
    $( "#feat_3" ).keyup(function() {
        const feat_3 = $("#feat_3").val();
        document.getElementById("view_feat_3").innerText = feat_3;
    });

function maxLengthCheck(object){
    if (object.value.length > object.maxLength){
        object.value = object.value.slice(0, object.maxLength);
    }   
}


function fnSubmit(){
    const feat1 = $("#feat_1").val();
    const feat2 = $("#feat_2").val();
    const feat3 = $("#feat_3").val();

    var feats = feat1;
    feats += ","+feat2;
    feats += ","+feat3;
    
    console.log("feats : "+feats);

    document.productForm.action="/product/save";
    document.productForm.pdinfo.value=editor.getHTML();
    document.productForm.pdfeature.value=feats;
    console.log("pdfeature : "+$("#pdfeature").val());



    document.productForm.submit();
}

</script>




</html>