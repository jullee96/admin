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
    margin-left:10px;
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
  <input type="hidden" id="pageTitle" value="기술지원 관리">
  <input type="hidden" id="pageSubTitle" value="기술지원 답변하기">
  <input type="hidden" id="supportseq" value="${edit.seq}">
                    
  <div class="position-absolute w-100 min-height-300 top-0" >
    <span class="mask bg-warning opacity-6"></span>
  </div>
  <%@ include file="../template/aside.jsp" %>


  <div class="main-content position-relative max-height-vh-100 h-100">
    <!-- Navbar -->
    <%@ include file="../template/navbar.jsp" %>
    <!-- End Navbar -->

    <form id="support-form" class="mb-4 " name="support-form" >
        <div class="card shadow-lg mx-4 card-profile-bottom">
            <!-- 문의 -->
            <div class="card-body p-3">
                <h5 class="font-weight-bolder">문의 상세 
                    
                    <c:if test="${clistSize != 0}">
                        <button type="button" class="mt-2 btn btn-outline-secondary btn-status"> 답변완료</button>  
                    </c:if>
                    <c:if test="${clistSize == 0}">
                        <button type="button" class="mt-2 btn btn-outline-success btn-status"> 처리중</button>  
                    </c:if>
                </h5> 
                    
                     <hr>  
                    <div class="row">
                        <div class="col-12 col-sm-6 mt-3 mt-sm-2">
                            <label class="h6 text-md-start">문의 번호</label>
                            <input class="form-control" type="text" id="seq" name="seq" value="${edit.seq}" disabled>

                        </div>
                        <div class="col-12 col-sm-6 ">
                            <label class="h6 sub-title " >문의 종류</label>
                            <input type="hidden" id="select_type" value="${edit.type}" >
                            <select class="form-control" name="type" id="type" disabled focused>
                                <option value="" disabled selected hidden>선택해주세요</option>
                                <option value="P" >결제문의</option>
                                <option value="T">기술문의</option>
                                <option value="E">기타</option>
                            </select>
                        </div>
                        <div class="col-12 col-sm-6 mt-3 mt-sm-4">
                            <label class="h6 text-md-start">신청일</label>
                            <input class="form-control" type="text" id="name" name="name" value="${edit.viewDate}" disabled >
                        </div>    
                        <div class="col-12 col-sm-6 mt-3 mt-sm-4">
                            <label class="h6 text-md-start">유저 아이디</label>
                            <input class="form-control" type="text" id="name" name="name" value="${edit.userid}" disabled >
                        </div>


                        <div class="col-12 mt-sm-4">
                            <label class="h6 text-md-start">제목</label>
                            <div class="contents">${edit.title}</div>
                            
                        </div>

                        <div class="col-sm-12 ">
                        <label class="h6 mt-4">내용</label>
                        <div class="contents" id ="viewer"> ${edit.contents}</div>
                        <div id="contents"></div>
                        <hr>
                    </div>

            </div>
        <div class="d-flex align-items-left">
            <a id="gotoList" href="/support/list" class="me-4 btn btn-secondary btn-sm  ms-auto ">목록으로</a>
            <button id="gotoEditor" type="button" class=" btn btn-danger btn-sm" onClick="fnShowEiditor('new','')" >답변하기</button>
            
        </div>

        </div>
        

        <!-- 답변 -->
        <c:forEach items="${clist}" var="list" varStatus="status" >
            <c:if test="${list.seq != null}" >
            <div class="card mt-2 mb-4 shadow-lg mx-4 card-profile-bottom" style="background-color:#63b3ed1c;">
                <div class="card-body p-3" >  
                    <h6 class="font-weight-bolder">ㄴ ${list.userid}</h6>
                    <div class="contents" id ="viewer2"> ${list.comment}</div>
                    ${list.viewDate}
                    <a style="margin-left:92%;" href="javascript:fnShowEiditor('edit','${list.seq}');" >[수정]</a> | 
                    <a href="/support/deleteComment?seq=${list.seq}" >[삭제]</a>
                    <input id="cmt_${list.seq}" type="hidden" value='${list.comment}'>
                </div>
            </div>

            </c:if>
        </c:forEach>
     </div>
        <div id="div-editor" style="display:none;" class="card mt-5 shadow-lg mx-4 card-profile-bottom">
            <div class="card-body p-3">  
                <h5 class="font-weight-bolder">답변하기</h5>
                    <div class="d-flex align-items-center">
                        <button id="btnClose" type="button" onClick="fnClose()" class="btn btn-secondary btn-sm me-4 ms-auto" >닫기</button>

                        <button id="btnSave" type="button" onClick="fnSaveComment('save')" class="btn btn-danger btn-sm " >저장</button>
                        <button id="btnEdit" type="button" onClick="fnSaveComment('edit')" class="btn btn-warning btn-sm " style="display:none;" >수정</button>
                    </div>
    
                <div class="contents" id ="editor"></div>
                <div id="comments"></div>    
            </div>
        </div>

    </form>
  
</body>

<%@ include file="../template/core.jsp" %>
<script>
    $(document).ready(function () {
    const select_type = $("#select_type").val();

    $("#type").val(select_type);  

    });
</script>

<script class="code-js">
const content = [].join('\n');

const Viewer = toastui.Editor;
const viewer = new Viewer({ 
    el: document.querySelector('#viewer'), 
    height: '500px', 
    initialValue: content   
    viewer:true
});



const Viewer2 = toastui.Editor;
const viewer2 = new Viewer2({ 
    el: document.querySelector('#viewer2'), 
    height: '100px', 
    initialValue: content,   
    viewer:true

});

</script>

<script class="code-js">

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

 console.log(editor.getHTML());
    

function uploadImage(blob){
    let url;

    let filename = new Date().getTime() + ".png";
    let InputFiles = new File([blob], filename, {
        type: "image/png",
        lastModified: Date.now()
    });

    const keytype ="comment";

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

var c_seq;

function fnClose(){
    $(".ProseMirror > p").remove();
    $('#div-editor').hide();
    $("#gotoList").show();
    $("#gotoEditor").show();


}

function fnShowEiditor(type, seq){
    console.log("seq : "+seq);
    
    console.log("type : "+type);
    c_seq = seq;
    const comment = $("#cmt_"+seq).val();

    console.log("comment : "+comment);
    if($('#div-editor').css('display') == 'none'){
        $("#gotoList").hide();
        $("#gotoEditor").hide();

        $('#div-editor').show();
        $('#div-editor')[0].scrollIntoView();

        if(type == "edit"){
            if($('#btnEdit').css('display') == 'none'){
                $("#btnEdit").show();
                $("#btnSave").hide();

            }

            $(".ProseMirror > p").remove();
            $(".ProseMirror").append(comment);
        } else if(type =="new"){
            $("#btnSave").show();
            $("#btnEdit").hide();
        }

        
    }
}


function fnSaveComment(type){
    // const seq =
    const supportseq = $("#supportseq").val(); 
    const comment = editor.getHTML();
    console.log("type >> "+type);
    alert("c_seq : "+c_seq);
    
    if(type == "save"){
        $.ajax( { 
            url : "/support/save",
            type:"POST",
            data : {
                    supportseq : supportseq,
                    comment : comment,
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

    }else if(type == "edit"){
        $.ajax( { 
            url : "/support/edit",
            type:"POST",
            data : {
                    seq : c_seq,
                    supportseq : supportseq,
                    comment : comment,
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

</script>


</html>