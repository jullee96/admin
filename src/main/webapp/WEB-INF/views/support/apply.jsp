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
}

.sub-title{
    margin-top:10px;
}

img[alt=alt_img] { 
    width: 500px; 
}


</style>


<body class="g-sidenav-show bg-gray-100">
  <input type="hidden" id="pageTitle" value="기술지원 관리">
  <input type="hidden" id="pageSubTitle" value="기술지원 신청">

  <div class="position-absolute w-100 min-height-300 top-0">
    <span class="mask bg-warning opacity-6"></span>
  </div>
  <%@ include file="../template/aside.jsp" %>


  <div class="main-content position-relative max-height-vh-100 h-100">
    <!-- Navbar -->
    <%@ include file="../template/navbar.jsp" %>
    <!-- End Navbar -->

<form id="support-form" name="support-form" >
    <div class="card shadow-lg mx-4 card-profile-bottom">
        <div class="card-body p-3">
            <h5 class="font-weight-bolder">1:1 문의하기</h5>    
                <div class="d-flex align-items-center">
                  <a href="/support/list" class="btn btn-secondary btn-sm ms-auto" > 목록으로</a>
                <input type="hidden" id="seq" value="${edit.seq}">
                <input type="hidden" id="status" value="${edit.status}">
                  <button onClick="saveSubmit()" class="btn btn-danger btn-sm   " style="margin-left:1%">
                    <c:if test="${edit.seq == null}">
                        신청하기
                    </c:if>    
                    <c:if test="${edit.seq != null}">
                        수정하기
                    </c:if>    
                  </button>
                </div>


                <div class="row">
                    <div class="col-12">
                        <label class="sub-title" >문의 종류</label>
                        <input type="hidden" id="select_type" value="${edit.type}" >
                        <select class="form-control" name="type" id="type" required focused>
                            <option value="" disabled selected hidden>선택해주세요</option>
                            <option value="P" >결제문의</option>
                            <option value="T">기술문의</option>
                            <option value="E">기타</option>
                        </select>
                    </div>

                    <div class="col-12 col-sm-6 mt-3 mt-sm-0">
                        <label class="text-md-start">담당자</label>
                        <input class="form-control" type="text" id="name" name="name" value="${userSession.username}" disabled>
                    </div>

                    <div class="col-12 col-sm-6 mt-3 mt-sm-0">
                        <label class="text-md-start">이메일</label>
                        <input class="form-control" type="email" id="email" name="email" value="${userSession.email}" disabled>

                    </div>

                    <div class="col-12">
                        <label class="text-md-start">제목</label>
                        <input class="form-control" type="text" id="title" name="title" value="${edit.title}" required>
                    </div>

                    <div class="col-sm-12">
                    <label class="mt-4">내용</label>
                    <div class="contents" id ="editor"> ${edit.contents}</div>
                    <div id="contents"></div>
                    
                </div>

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
    height: '500px', 
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

 console.log(editor.getHTML());
    

function uploadImage(blob){
    let url;

    let filename = new Date().getTime() + ".png";
    let InputFiles = new File([blob], filename, {
        type: "image/png",
        lastModified: Date.now()
    });

    const keytype ="support";

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
<script>

$(document).ready(function () {
  const select_type = $("#select_type").val();

  $("#type").val(select_type);  

});


function saveSubmit(){


    $("#support-form").validate({
      submitHandler: function(form) {
            const seq = $("#seq").val();
            const status = $("#status").val();
            const title = $("#title").val();
            const contents = editor.getHTML();
            const userid = $("#userid").val();
            const email = $("#email").val();
            const type = $("#type").val();
            if(seq == null){ // save
                $.ajax( {
                    url : "/support/save",
                    type:"POST",
                    data : {
                            status : status,
                            title : title,
                            contents : contents,
                            userid : userid,
                            email : email,
                            type : type
                        },
                    success : function(seq) {
                        if(seq > 0){
                            alert( "success" );
                        } else{
                            alert( "fail" );
                        }

                        location.href="/support/list";

                    }, error : function(e) {
                        alert( "fail" );
                    }
                });
            }else{
                $.ajax( { // update
                url : "/support/save",
                type:"POST",
                data : {
                        seq : seq,
                        title : title,
                        contents : contents,
                        userid : userid,
                        email : email,
                        type : type
                    },
                success : function(seq) {
                    if(seq > 0){
                        alert( "success" );
                    } else{
                        alert( "fail" );
                    }

                    location.href="/support/list";

                }, error : function(e) {
                    alert( "fail" );
                }
            });
            }
            

      }  
    });

    
}

</script>
</html>