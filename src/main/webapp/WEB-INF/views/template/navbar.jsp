<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<!DOCTYPE html>
  <head>
    <title></title>
    <meta content="text/html; charset=utf-8" />
  </head>  

<style>
.pageTitle{
  font-size: 0.8rem;
  display: inline-block;
}
</style>
<!-- navnav -->
<input type="hidden" id="sub" value="pageSubTitle">
<nav class="navbar navbar-main navbar-expand-lg bg-transparent shadow-none position-absolute px-4 w-100 z-index-2 mt-n7">
  <div class="container-fluid py-1">
    <nav aria-label="breadcrumb">
      <ol class="breadcrumb bg-transparent mb-0 pb-0 pt-1 ps-2 me-sm-6 me-5">
        <li class="breadcrumb-item text-sm"><p class="text-white opacity-5 pageTitle" id="page" name="page"></p></li>
        <li class="breadcrumb-item text-sm text-white active" aria-current="page">
          <p class="pageTitle" id="pageSub" name="pageSub"></p>
        </li>
      </ol>
    </nav>
    <div class="collapse navbar-collapse me-md-0 me-sm-4 mt-sm-0 mt-2" id="navbar">
      <div class="ms-md-auto pe-md-3 d-flex align-items-center">
        
      </div>
    </div>
  </div>
</nav> 

<script>
  $(document).ready(function () {
    var pageTitle = $("#pageTitle").val();
    var pageSubTitle = $("#pageSubTitle").val();
    
    document.getElementById("page").innerHTML=pageTitle;
    document.getElementById("pageSub").innerHTML=pageSubTitle;

  });
</script>

</html>