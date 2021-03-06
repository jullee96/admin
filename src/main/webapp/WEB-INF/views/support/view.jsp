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
  <input type="hidden" id="imgseqs" value="${edit.imgseqs}">
                       
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
                    <input type="hidden" id="clistSize" value="${clistSize}">
                    <input type="hidden" id="status" name="status" value="${edit.status}">
                    <c:if test="${clistSize != 0}">
                        <c:if test="${edit.status == 'D'}">                            
                            <button type="button" onclick="fnUpdateStatus('D')" class="mt-2 btn btn-outline-dark btn-status"> 답변완료</button>  
                        </c:if>
                        <c:if test="${edit.status == 'P'}">                            
                            <button type="button" onclick="fnUpdateStatus('P')" class="mt-2 btn btn-outline-success btn-status"> 처리중</button>  
                        </c:if>

                    </c:if>
                    <c:if test="${clistSize == 0}">
                        <button type="button" onclick="fnUpdateStatus('W')" class="mt-2 btn btn-outline-secondary btn-status"> 답변대기</button>  
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
                        <input id="content" type="hidden" value="${edit.contents}">
                        <div class="contents" id ="viewer"> ${edit.contents}</div>
                        <%-- <div id="contents"></div> --%>
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
                    <div class="contents" id ="viewer_cmt_${status.count}"></div>
                    ${list.viewDate}
                    <a style="margin-left:92%;" href="javascript:fnShowEiditor('edit','${status.count}');" >[수정]</a> | 
                    <a href="javascript:fnDeleteComment('${list.seq}');" >[삭제]</a>
                    <%-- <a href="/support/deleteComment?seq=${list.seq}" >[삭제]</a> --%>
                    <input id="cmt_${status.count}" type="hidden" value='${list.comment}'>
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

const content = $("#content").val();
const Viewer = toastui.Editor.factory;
const viewer = new Viewer({ 
    el: document.querySelector('#viewer'), 
    height: '500px', 
    initialValue: content, 
    viewer:true
});

const n = $("#clistSize").val();
var arr = new Array(n);

for(let i=1 ; i <= n ; i++){
    var cmt = $("#cmt_"+i).val();
    
    arr[i] = toastui.Editor.factory({
        el: document.querySelector('#viewer_cmt_'+i), 
        viewer: true, 
        height: '100px',
        initialValue : cmt 
    });
        

}


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
    
var imgseqs = $("#imgseqs").val();

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
        url: "/file/uploadEditorImg",
        processData: false,
        contentType: false,
        data: formData,
        async:false,
        success: function(retval){
            if(retval != "F"){
                console.log("업로드 성공" +retval.seq);
                console.log("업로드 성공" +retval.filepath);
               
            } else{
                console.log("업로드 실패");
            }
            url = retval.filepath;
            imgseqs += retval.seq+',';
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
    console.log("n : "+n);
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

        
    } else{
        $(".ProseMirror > p").remove();
        $(".ProseMirror").append(comment);
        
    }   
}


function fnSaveComment(type){
    // const seq =
    const supportseq = $("#supportseq").val(); 
    const comment = editor.getHTML();
    console.log("type >> "+type);
    if(imgseqs.length !=0 ){
        imgseqs = imgseqs.substr(0, imgseqs.length - 1);
    }
    
    if(type == "save"){
        $.ajax( { 
            url : "/support/save",
            type:"POST",
            data : {
                    supportseq : supportseq,
                    comment : comment,
                    imgseqs : imgseqs
                },
            success : function(seq) {
                if(seq > 0){
                    alert( "저장 완료" );
                } else{
                    alert( "저장실패" );
                }

                location.reload();

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
                    imgseqs : imgseqs
                },
            success : function(seq) {
                if(seq > 0){
                    alert( "저장완료" );
                } else{
                    alert( "저장실패" );
                }

                location.href="/support/list";

            }, error : function(e) {
                alert( "fail" );
            }
        });
    }

}

function fnDeleteComment(seq){
    if( confirm("코멘트를 삭제하시겠습니까?"+seq) ){
       document.location.href="/support/deleteComment?seq="+seq;
   
    }
        

}

function fnUpdateStatus(type){
    console.log("type : "+type);
    var status = $("#status").val();
    var seq = $("#supportseq").val();
    console.log("status : "+status);
    
    if(type == "P"){
        if(confirm("상태를 답변완료로 변경하시겠습니까?")){
            status = "D";
        }
    } else if(type == "D"){ // 답변완료
        if(confirm("상태를 처리중으로 변경하시겠습니까?")){
            status = "P";
        }
    } else{ // 답변대기인경우
        alert("문의글의 상태를 변경하려면 먼저 답변을 작성해주세요.");
    }

     $.ajax( { 
            url : "/support/updateStatus",
            type:"POST",
            data : {
                    seq : seq,
                    status : status
                },
            success : function(seq) {
                if(seq > 0){
                    alert( "저장완료" );
                } else{
                    alert( "저장실패" );
                }

                location.reload();
            }, error : function(e) {
                alert( "fail" );
            }
        });
}
</script>


</html>