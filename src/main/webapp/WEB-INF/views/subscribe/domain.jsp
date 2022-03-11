<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="ko">

<head>
  <title> Hamonize Cloud Service</title>
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  
  <script type="text/javascript" src="https://code.jquery.com/jquery-3.1.1.min.js"></script> 
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js"></script>
  <link href="/subscribe/style.css" rel="stylesheet">
  <script type="text/javascript" src="/subscribe/payment.js"></script>

</head>


<body>
  <div class="payment-title">
    <h1>도메인 생성</h1>
  </div>

<form id="frm" method="post" action="/subscribe/saveDomain"> 
<input type="hidden" id="itemno" name="itemno">   
    <div class="form-container">
        <div class="field-container">
            <label for="domain">Domain</label>
            <input id="domain" name="domain" maxlength="20" type="text">
        </div>
     
        <div class="field-container">
            <button type="submit" id="btnSave" >생성하기</button>
        </div>
    </div>
  </form>
   <!-- end of form -->

</body>
<script type="text/javascript">
$(document).ready(function(){
  var url = document.location.href;
  var itemno = url.substring(url.indexOf('?') + 1).split('=')[1];
  console.log("itemno : " + itemno); 
  $('input[name=itemno]').attr('value',itemno);

});



</script>

</html>