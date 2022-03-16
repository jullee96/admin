<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>

<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="utf-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link rel="apple-touch-icon" sizes="76x76" href="../argon/assets/img/apple-icon.png">
  <link rel="icon" type="image/png" href="../argon/assets/img/favicon.png">
  <title>
     Hamonize Cloud Service | Subscribe
  </title>
  <script type="text/javascript" src="/subscribe/payment.js"></script>
  <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/imask/3.4.0/imask.min.js"></script>  
  <script src="../argon/assets/js/plugins/multistep-form.js"></script>
  <link href="/subscribe/style.css" rel="stylesheet">

</head>
<%@ include file="../template/top2.jsp" %>


<body class="g-sidenav-show  bg-gray-100">
  <div class="min-height-300 bg-warning position-absolute w-100"></div>

  <main class="main-content position-relative border-radius-lg ">

    <!-- End Navbar -->
    <div class="container-fluid py-4">
      <div class="row">
        <div class="col-12 text-center">
          <h3 class="mt-5 text-white"></h3>
          <h5 class="text-white font-weight-normal"></h5>
          <div class="multisteps-form mb-5">
            <!--progress bar-->
            <div class="row mt-5">
              <div class="col-12 col-lg-8 mx-auto my-5">
                <div class="multisteps-form__progress">
                  <button class="multisteps-form__progress-btn js-active" id="btnProgress" type="button" >
                    <span>결제정보 입력</span>
                  </button>
                  <button class="multisteps-form__progress-btn" type="button">
                    <span>도메인 입력</span>
                  </button>
                  <button class="multisteps-form__progress-btn" type="button" >
                    <span>시작하기</span>
                  </button>
                </div>
              </div>
            </div>
            <!--form panels-->
            <div class="row">
              <div class="col-12 col-lg-8 m-auto">
                <div class="multisteps-form__form">
                  <!--single form panel-->
                  <div class="card multisteps-form__panel p-3 border-radius-xl bg-white js-active" data-animation="FadeIn">
                    <div class="row text-center">
                      <div class="col-10 mx-auto">
                        <h5 class="font-weight-normal">결제 수단과 정보를 입력해주세요 </h5>
                        <p>😊</p>
                      </div>
                    </div>
                    
                    <!-- 카드 입력폼 -->
                    <form id="frm1" method="post" action="javascript:funcSubmit('pay');"> 
                      <div class="multisteps-form__content">
                        <div class="row mt-3">
                          <div class="col-10 mx-auto">
                              <input type="hidden" id="itemno" name="itemno">
                              <input type="hidden" id="payAt" name="payAt" value="${payAt}">
                              <input type="hidden" id="domainAt" name="domainAt" value="${domainAt}">

                              <div class="container2 preload">
                                  <div class="creditcard">
                                      <div class="front">
                                          <div id="ccsingle"></div>
                                          <svg version="1.1" id="cardfront" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                              x="0px" y="0px" viewBox="0 0 750 471" style="enable-background:new 0 0 750 471;" xml:space="preserve">
                                              <g id="Front">
                                                  <g id="CardBackground">
                                                      <g id="Page-1_1_">
                                                          <g id="amex_1_">
                                                              <path id="Rectangle-1_1_" class="lightcolor grey" d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                                                      C0,17.9,17.9,0,40,0z" />
                                                          </g>
                                                      </g>
                                                      <path class="darkcolor greydark" d="M750,431V193.2c-217.6-57.5-556.4-13.5-750,24.9V431c0,22.1,17.9,40,40,40h670C732.1,471,750,453.1,750,431z" />
                                                  </g>
                                                  <text transform="matrix(1 0 0 1 60.106 295.0121)" id="svgnumber" class="st2 st3 st4">0123 4567 8910 1112</text>
                                                  <text transform="matrix(1 0 0 1 54.1064 428.1723)" id="svgname" class="st2 st5 st6">JOHN DOE</text>
                                                  <text transform="matrix(1 0 0 1 54.1074 389.8793)" class="st7 st5 st8">cardholder name</text>
                                                  <text transform="matrix(1 0 0 1 479.7754 388.8793)" class="st7 st5 st8">expiration</text>
                                                  <text transform="matrix(1 0 0 1 65.1054 241.5)" class="st7 st5 st8">card number</text>
                                                  <g>
                                                      <text transform="matrix(1 0 0 1 574.4219 433.8095)" id="svgexpire" class="st2 st5 st9">01/23</text>
                                                      <text transform="matrix(1 0 0 1 479.3848 417.0097)" class="st2 st10 st11">VALID</text>
                                                      <text transform="matrix(1 0 0 1 479.3848 435.6762)" class="st2 st10 st11">THRU</text>
                                                      <polygon class="st2" points="554.5,421 540.4,414.2 540.4,427.9 		" />
                                                  </g>
                                                  <g id="cchip">
                                                      <g>
                                                          <path class="st2" d="M168.1,143.6H82.9c-10.2,0-18.5-8.3-18.5-18.5V74.9c0-10.2,8.3-18.5,18.5-18.5h85.3
                                                  c10.2,0,18.5,8.3,18.5,18.5v50.2C186.6,135.3,178.3,143.6,168.1,143.6z" />
                                                      </g>
                                                      <g>
                                                          <g>
                                                              <rect x="82" y="70" class="st12" width="1.5" height="60" />
                                                          </g>
                                                          <g>
                                                              <rect x="167.4" y="70" class="st12" width="1.5" height="60" />
                                                          </g>
                                                          <g>
                                                            <path class="st12" d="M125.5,130.8c-10.2,0-18.5-8.3-18.5-18.5c0-4.6,1.7-8.9,4.7-12.3c-3-3.4-4.7-7.7-4.7-12.3
                                                              c0-10.2,8.3-18.5,18.5-18.5s18.5,8.3,18.5,18.5c0,4.6-1.7,8.9-4.7,12.3c3,3.4,4.7,7.7,4.7,12.3
                                                              C143.9,122.5,135.7,130.8,125.5,130.8z M125.5,70.8c-9.3,0-16.9,7.6-16.9,16.9c0,4.4,1.7,8.6,4.8,11.8l0.5,0.5l-0.5,0.5
                                                              c-3.1,3.2-4.8,7.4-4.8,11.8c0,9.3,7.6,16.9,16.9,16.9s16.9-7.6,16.9-16.9c0-4.4-1.7-8.6-4.8-11.8l-0.5-0.5l0.5-0.5
                                                              c3.1-3.2,4.8-7.4,4.8-11.8C142.4,78.4,134.8,70.8,125.5,70.8z" />
                                                          </g>
                                                          <g>
                                                              <rect x="82.8" y="82.1" class="st12" width="25.8" height="1.5" />
                                                          </g>
                                                          <g>
                                                              <rect x="82.8" y="117.9" class="st12" width="26.1" height="1.5" />
                                                          </g>
                                                          <g>
                                                              <rect x="142.4" y="82.1" class="st12" width="25.8" height="1.5" />
                                                          </g>
                                                          <g>
                                                              <rect x="142" y="117.9" class="st12" width="26.2" height="1.5" />
                                                          </g>
                                                      </g>
                                                  </g>
                                              </g>
                                              <g id="Back">
                                              </g>
                                          </svg>
                                      </div>
                                      <div class="back">
                                          <svg version="1.1" id="cardback" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
                                              x="0px" y="0px" viewBox="0 0 750 471" style="enable-background:new 0 0 750 471;" xml:space="preserve">
                                              <g id="Front">
                                                  <line class="st0" x1="35.3" y1="10.4" x2="36.7" y2="11" />
                                              </g>
                                              <g id="Back">
                                                  <g id="Page-1_2_">
                                                      <g id="amex_2_">
                                                          <path id="Rectangle-1_2_" class="darkcolor greydark" d="M40,0h670c22.1,0,40,17.9,40,40v391c0,22.1-17.9,40-40,40H40c-22.1,0-40-17.9-40-40V40
                                                  C0,17.9,17.9,0,40,0z" />
                                                      </g>
                                                  </g>
                                                  <rect y="61.6" class="st2" width="750" height="78" />
                                                  <g>
                                                      <path class="st3" d="M701.1,249.1H48.9c-3.3,0-6-2.7-6-6v-52.5c0-3.3,2.7-6,6-6h652.1c3.3,0,6,2.7,6,6v52.5 C707.1,246.4,704.4,249.1,701.1,249.1z" />
                                                      <rect x="42.9" y="198.6" class="st4" width="664.1" height="10.5" />
                                                      <rect x="42.9" y="224.5" class="st4" width="664.1" height="10.5" />
                                                      <path class="st5" d="M701.1,184.6H618h-8h-10v64.5h10h8h83.1c3.3,0,6-2.7,6-6v-52.5C707.1,187.3,704.4,184.6,701.1,184.6z" />
                                                  </g>
                                                  <text transform="matrix(1 0 0 1 621.999 227.2734)" id="svgsecurity" class="st6 st7">985</text>
                                                  <g class="st8">
                                                    <text transform="matrix(1 0 0 1 518.083 280.0879)" class="st9 st6 st10">security code</text>
                                                  </g>
                                                  <rect x="58.1" y="378.6" class="st11" width="375.5" height="13.5" />
                                                  <rect x="58.1" y="405.6" class="st11" width="421.7" height="13.5" />
                                                  <text transform="matrix(1 0 0 1 59.5073 228.6099)" id="svgnameback" class="st12 st13">John Doe</text>
                                              </g>
                                          </svg>
                                      </div>
                                  </div>
                              </div>
                              <div class="row mt-4">
                                  <div class="text-start field-container">
                                      <label for="name">Name</label>
                                      <input class="form-control" id="name" name="name" maxlength="20" type="text">
                                  </div>
                                  <div class="text-start">
                                      <label for="cardnum">Card Number</label>
                                      <span id="generatecard">generate random</span>
                                      <input class="form-control" id="cardnum" name="cardnum" type="text" inputmode="numeric">
                                      <svg id="ccicon" class="ccicon" width="750" height="471" viewBox="0 0 750 471" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"></svg>
                                  </div>
                                  <div class="text-start">
                                      <label for="expdate">Expiration (mm/yy)</label>
                                      <input class="form-control" id="expdate" name="expdate" type="text" inputmode="numeric">
                                  </div>
                                  <div class="text-start field-container">
                                      <label for="cvc">Security Code</label>
                                      <input class="form-control" id="cvc" name="cvc" type="text" inputmode="numeric">
                                  </div>
                              </div>
                            </div>
                          </div>

                        <div class="button-row d-flex mt-4">
                          <button class="btn bg-gradient-dark ms-auto mb-0" type="submit" id="btnSave" >다음</button>
                        </div>
                      </div>
                    </form>

                  </div>
                  <form id="frm2" method="POST" action="javascript:funcSubmit('domain');">
                    <!--single form panel-->
                    <div class="card multisteps-form__panel p-3 border-radius-xl bg-white" data-animation="FadeIn">
                      <div class="row text-center">
                        <div class="col-10 mx-auto">
                          <h5 class="font-weight-normal">도메인을 입력해주세요</h5>
                          <p>하모나이즈를 이용하기 위한 도메인을 생성해주세요</p>
                        </div>
                      </div>
                      <div class="multisteps-form__content">
                        <div class="row mt-4">
                          <div class="text-center col-sm-8">
                            <input id="domain" name="domain" type="text" class="form-control">      
                          </div>
                        </div>

                        <div class="button-row d-flex mt-4">
                          <button id="btnPre" class="btn bg-gradient-light mb-0 js-btn-prev" type="button">이전</button>
                          <button class="btn bg-gradient-dark ms-auto mb-0" type="submit">다음</button>
                        </div>
                      </div>
                    </div>
                  </form>

                  <!--single form panel-->
                  <div class="card multisteps-form__panel p-3 border-radius-xl bg-white" data-animation="FadeIn">
                    <div class="row text-center">
                      <div class="col-10 mx-auto">
                        <h5 class="font-weight-normal">시작하기</h5>
                        <p>이제 하모나이즈를 시작할 수 있습니다!</p>
                      </div>
                    </div>
                    
                    <div class="multisteps-form__content">
                      <div class="row text-center  ms-auto">
                        <div class="col-12 col-md-8 " style="margin-left:16%;">
                          <a href="/user/detail">
                            <label class="btn btn-lg btn-outline-secondary border-2 px-6 py-5" for="btncheck3">
                            <%-- <a href="http://localhost:8081/mntrng/pcControlList"> --%>
                              <svg class="text-dark" width="20px" height="20px" viewBox="0 0 40 40" version="1.1" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink">
                                <g stroke="none" stroke-width="1" fill="none" fill-rule="evenodd">
                                  <g transform="translate(-1720.000000, -592.000000)" fill="#FFFFFF" fill-rule="nonzero">
                                    <g transform="translate(1716.000000, 291.000000)">
                                      <g transform="translate(4.000000, 301.000000)">
                                        <path class="color-background" d="M39.3,0.706666667 C38.9660984,0.370464027 38.5048767,0.192278529 38.0316667,0.216666667 C14.6516667,1.43666667 6.015,22.2633333 5.93166667,22.4733333 C5.68236407,23.0926189 5.82664679,23.8009159 6.29833333,24.2733333 L15.7266667,33.7016667 C16.2013871,34.1756798 16.9140329,34.3188658 17.535,34.065 C17.7433333,33.98 38.4583333,25.2466667 39.7816667,1.97666667 C39.8087196,1.50414529 39.6335979,1.04240574 39.3,0.706666667 Z M25.69,19.0233333 C24.7367525,19.9768687 23.3029475,20.2622391 22.0572426,19.7463614 C20.8115377,19.2304837 19.9992882,18.0149658 19.9992882,16.6666667 C19.9992882,15.3183676 20.8115377,14.1028496 22.0572426,13.5869719 C23.3029475,13.0710943 24.7367525,13.3564646 25.69,14.31 C26.9912731,15.6116662 26.9912731,17.7216672 25.69,19.0233333 L25.69,19.0233333 Z"></path>
                                        <path class="color-background" d="M1.855,31.4066667 C3.05106558,30.2024182 4.79973884,29.7296005 6.43969145,30.1670277 C8.07964407,30.6044549 9.36054508,31.8853559 9.7979723,33.5253085 C10.2353995,35.1652612 9.76258177,36.9139344 8.55833333,38.11 C6.70666667,39.9616667 0,40 0,40 C0,40 0,33.2566667 1.855,31.4066667 Z"></path>
                                        <path class="color-background" d="M17.2616667,3.90166667 C12.4943643,3.07192755 7.62174065,4.61673894 4.20333333,8.04166667 C3.31200265,8.94126033 2.53706177,9.94913142 1.89666667,11.0416667 C1.5109569,11.6966059 1.61721591,12.5295394 2.155,13.0666667 L5.47,16.3833333 C8.55036617,11.4946947 12.5559074,7.25476565 17.2616667,3.90166667 L17.2616667,3.90166667 Z" opacity="0.598539807"></path>
                                        <path class="color-background" d="M36.0983333,22.7383333 C36.9280725,27.5056357 35.3832611,32.3782594 31.9583333,35.7966667 C31.0587397,36.6879974 30.0508686,37.4629382 28.9583333,38.1033333 C28.3033941,38.4890431 27.4704606,38.3827841 26.9333333,37.845 L23.6166667,34.53 C28.5053053,31.4496338 32.7452344,27.4440926 36.0983333,22.7383333 L36.0983333,22.7383333 Z" opacity="0.598539807"></path>
                                      </g>
                                    </g>
                                  </g>
                                </g>
                              </svg>
                           </label>
                          </a>

                          <h6>Start!</h6>
                        
                        </div>
                        
                      </div>
                    </div>
                  </div>


                </div>
              </div>
            </div>
          </div>
        </div>
      </div>

    </div>
  </main>


<script type="text/javascript">
$(document).ready(function(){
  var url = document.location.href;
  var itemno = url.substring(url.indexOf('?') + 1).split('=')[1];
  var payAt = $("#payAt").val();    
  var domainAt = $("#domainAt").val();    
  
  console.log("itemno : " + itemno); 
  console.log("payAt : " + payAt); 
  console.log("payAt : " + domainAt); 

  $('input[name=itemno]').attr('value',itemno);

  if(payAt > 0){
    setActiveStep(1);
    setActivePanel(1);
    $('#btnPre').attr('disabled','disabled');
    $('#btnProgress').attr('disabled','disabled');
  }
  if(domainAt != null){
    setActiveStep(2);
    setActivePanel(2);
  }

});


function funcSubmit(step){
  console.log("step : "+step);
  const itemno = $("#itemno").val();

  const name = $("#name").val();
  const expdate = $("#expdate").val();
  const cardnum = $("#cardnum").val();
  const cvc = $("#cvc").val();
  const domain = $("#domain").val();
  console.log("name : "+name);
    
  if(step == "pay"){
    $.ajax( { 
      url : "/subscribe/savePayment",
      type:"POST",
      data : {
              itemno : itemno,
              name : name,
              cardnum : cardnum,
              expdate : expdate,
              cvc : cvc
          },
      success : function(ret) {
          if(ret ="S" ){
            
            setActiveStep(1);
            setActivePanel(1);
          } else{
              alert( "fail" );
          }

      }, error : function(e) {
          alert( "fail" );
      }
    });
  } else if(step == "domain"){
      $.ajax( { 
      url : "/subscribe/saveDomain",
      type:"POST",
      data : {
              domain : domain
          },
      success : function(ret) {
          if(ret ="S" ){
            setActiveStep(2);
            setActivePanel(2);
          } else{
              alert( "fail" );
          }

      }, error : function(e) {
          alert( "fail" );
      }
    });
  }


    

}

</script>

<%@ include file="../template/core.jsp" %>

</body>

</html>