
(function($) {
  // 'use strict';

  $(function() {
    // validate the comment form when it is submitted
    $("#commentForm").validate({
      errorPlacement: function(label, element) {
        label.addClass('mt-2 text-danger');
        label.insertAfter(element);
      },
      highlight: function(element, errorClass) {
        $(element).parent().addClass('has-danger')
        $(element).addClass('form-control-danger')
      }
    });
    
    // validate signin form on keyup and submit
    $("#login-form").validate({
      rules: {
        userid: {
          required: true,
         },
        passwd: {
          required: true
        }
      },
      messages: {
        userid: {
          required: "아이디를 입력해주세요"
        },
        passwd: {
          required: "비밀번호를 입력해주세요"
        }
      },
      errorPlacement: function(label, element) {
        label.addClass('mt-2 text-danger');
        label.insertAfter(element);
      },
      highlight: function(element, errorClass) {
        $(element).parent().addClass('has-danger')
        $(element).addClass('form-control-danger')
      }
    });    

    $("#registerForm").validate({
      onkeyup: function(element) {
        $(element).valid(); 
      },
      rules: {
        userid: {
          required: true,
          remote : {
            type: 'post',
            url : '/signup/idDupCheck',
            data: {
              userid: function() {
                return $( "#userid" ).val();
              }
            }
          } 
         },
        username: {
          required: true,
          minlength: 2
        },
        passwd: {
          required: true,
          minlength: 4
        },
        re_passwd: {
          required: true,
          minlength: 4,
          equalTo: "#passwd"
        },
        email: {
          required: true,
          email: true,
          remote : {
            type: 'post',
            url : '/signup/emailDupCheck',
            data: {
              email: function() {
                return $( "#email" ).val();
              }
            }
          }
        },
        topic: {
          required: "#newsletter:checked",
          minlength: 2
        },
        agree: "required"
      },
      messages: {
        userid: {
          required: "아이디를 입력해주세요",
          remote: "이미 사용중인 아이디 입니다"
        },
        username: {
          required: "이름을 입력해주세요",
          minlength: "이름은 최소 2글자로 입력해주세요"
        },
        passwd: {
          required: "비밀번호를 입력해주세요",
          minlength: "비밀번호는 최소 4자리로 입력해주세요"
        },
        re_passwd: {
          required: "비밀번호를 확인해주세요",
          minlength: "비밀번호는 최소 4자리로 입력해주세요",
          equalTo: "비밀번호가 일치하지 않습니다"
        },
        email: {
          required: "이메일을 입력해주세요",
          email: "유효한 이메일이 아닙니다",
          remote: "이미 사용중인 이메일입니다"
        },
        agree: "Please accept our policy",
        topic: "Please select at least 2 topics"
      },
      errorPlacement: function(label, element) {
        label.addClass('mt-2 text-danger');
        label.insertAfter(element);
      },
      highlight: function(element, errorClass) {
        $(element).parent().addClass('has-danger')
        $(element).addClass('form-control-danger')
      }
    });


    $("#findIDForm").validate({
      rules: {
        username: {
          required: true,
          minlength: 2
        },
        email: {
          required: true,
          email: true,
          remote: {
            type: 'post',
            url : '/login/usernameEmailCheck',
            data: {
              username: function() {
                return $( "#username" ).val();
              },
              email: function() {
                return $( "#email" ).val();
              }
            }
          }
        }
      },
      messages: {
        username: {
          required: "이름을 입력해주세요",
          minlength: "이름은 최소 2글자로 입력해주세요"
        },
        email: {
          required: "이메일을 입력해주세요",
          email: "유효한 이메일이 아닙니다",
          remote: "일치하는 계정 정보가 없습니다. 다시 확인해주세요."
        }
      },
      errorPlacement: function(label, element) {
        label.addClass('mt-2 text-danger');
        label.insertAfter(element);
      },
      highlight: function(element, errorClass) {
        $(element).parent().addClass('has-danger')
        $(element).addClass('form-control-danger')
      }
    });

    $("#findPWForm").validate({
      rules: {
        userid: {
          required: true
        },
        email: {
          required: true,
          email: true,
          remote: {
            type: 'post',
            url : '/login/useridEmailCheck',
            data: {
              userid: function() {
                return $( "#userid" ).val();
              },
              email: function() {
                return $( "#email" ).val();
              }
            }
          }
        }
      },
      messages: {
        userid: {
          required: "아이디를 입력해주세요",
          remote: "이미 사용중인 아이디 입니다"
        },
        email: {
          required: "이메일을 입력해주세요",
          email: "유효한 이메일이 아닙니다",
          remote: "일치하는 계정 정보가 없습니다. 다시 확인해주세요."
        }
      },
      errorPlacement: function(label, element) {
        label.addClass('mt-2 text-danger');
        label.insertAfter(element);
      },
      highlight: function(element, errorClass) {
        $(element).parent().addClass('has-danger');
        $(element).addClass('form-control-danger');
      }
    
    });


    $("#frm2").validate({
      rules: {
        domain: {
          required: true
          // ,remote : {
          //   type: 'post',
          //   url : '/subscribe/domainDupCheck',
          //   data: {
          //     domain: function() {
          //       return $( "#domain" ).val();
          //     }
          //   }
          // }
        }
      },
      messages: {
        domain: {
          required: "도메인은 필수 값입니다"
          // ,remote: "중복된 도메인입니다. 다른 도메인을 입력해주세요"
          }
      },
      errorPlacement: function(label, element) {
        label.addClass('mt-2 text-danger');
        label.insertAfter(element);
      },
      highlight: function(element, errorClass) {
        $(element).parent().addClass('has-danger');
        $(element).addClass('form-control-danger');
      }
    
    });



    $("#frm1").validate({
      rules: {
        name: {
          required: true
        },
        cardnum: {
          required: true
          }
        
      },
      messages: {
        name: {
          required: "이름읍 필수값입니다",
        },
        cardnum: {
          required: "카드 번호를 입력해주세요"
        }
      },
      errorPlacement: function(label, element) {
        label.addClass('mt-2 text-danger');
        label.insertAfter(element);
      },
      highlight: function(element, errorClass) {
        $(element).parent().addClass('has-danger');
        $(element).addClass('form-control-danger');
      }
    
    });




  // 사업자번호 유효성 체크
  function checkCorporateRegiNumber(number){
    var numberMap = number.replace(/-/gi, '').split('').map(function (d){
      return parseInt(d, 10);
    });
    
    if(numberMap.length == 10){
      var keyArr = [1, 3, 7, 1, 3, 7, 1, 3, 5];
      var chk = 0;
      
      keyArr.forEach(function(d, i){
        chk += d * numberMap[i];
      });
      
      chk += parseInt((keyArr[8] * numberMap[8])/ 10, 10);
      console.log(chk);
      return Math.floor(numberMap[9]) === ( (10 - (chk % 10) ) % 10);
    }
    
    return false;
  }


    $.validator.addMethod("checkComNo", function(value, element) {
      console.log("checkCorporateRegiNumber >> "+checkCorporateRegiNumber(value));

      return checkCorporateRegiNumber(value);
    }, "* 유요하지 않은 번호입니다");



    $("#user-form").validate({
      onkeyup: function(element) {
        $(element).valid(); 
      },
      rules: {
        username: {
          required: true,
          minlength: 2
        },
        before_passwd: {
          required: true,
          remote : {
            type: 'post',
            url : '/user/passwdChk',
            data: {
              before_passwd: function() {
                return $( "#before_passwd" ).val();
              }
            }
          } 
        },
        passwd: {
          // required: true,
          minlength: 4
        },
        re_passwd: {
          // required: true,
          minlength: 4,
          equalTo: "#passwd"
        },
        email: {
          required: true,
          email: true
        },
        businessNumber: {
          checkComNo: true
         } 
      },
      messages: {
        username: {
          required: "이름을 입력해주세요",
          minlength: "이름은 최소 2글자로 입력해주세요"
        },
        before_passwd:{
          required: "비밀번호 입력해주세요",
          remote:"비밀번호가 올바르지 않습니다"
        },
        passwd: {
          // required: "새 비밀번호를 입력해주세요",
          minlength: "비밀번호는 최소 4자리로 입력해주세요"
        },
        re_passwd: {
          // required: "비밀번호를 확인해주세요",
          minlength: "비밀번호는 최소 4자리로 입력해주세요",
          equalTo: "비밀번호가 일치하지 않습니다"
        },
        email: {
          required: "이메일을 입력해주세요",
          email: "유효한 이메일이 아닙니다"
        },
        businessNumber: {
          checkComNo : "유효하지 않은 사업지 번호입니다. 다시 확인해주세요."
        }
      },
      errorPlacement: function(label, element) {
        label.addClass('mt-2 text-danger');
        label.insertAfter(element);
      },
      highlight: function(element, errorClass) {
        $(element).parent().addClass('has-danger')
        $(element).addClass('form-control-danger')
      }
    });

    $("#user-detail-form").validate({
      onkeyup: function(element) {
        $(element).valid(); 
      },
      rules: {
        username: {
          required: true,
          minlength: 2
        },

        passwd: {
          // required: true,
          minlength: 4
        },
       
        email: {
          required: true,
          email: true
        },
        businessNumber: {
          checkComNo: true
         } 
      },
      messages: {
        username: {
          required: "이름을 입력해주세요",
          minlength: "이름은 최소 2글자로 입력해주세요"
        },
        
        passwd: {
          // required: "새 비밀번호를 입력해주세요",
          minlength: "비밀번호는 최소 4자리로 입력해주세요"
        },
        
        email: {
          required: "이메일을 입력해주세요",
          email: "유효한 이메일이 아닙니다"
        },
        businessNumber: {
          checkComNo : "유효하지 않은 사업지 번호입니다. 다시 확인해주세요."
        }
      },
      errorPlacement: function(label, element) {
        label.addClass('mt-2 text-danger');
        label.insertAfter(element);
      },
      highlight: function(element, errorClass) {
        $(element).parent().addClass('has-danger')
        $(element).addClass('form-control-danger')
      }
    });



    //code to hide topic selection, disable for demo
    var newsletter = $("#newsletter");
    // newsletter topics are optional, hide at first
    var inital = newsletter.is(":checked");
    var topics = $("#newsletter_topics")[inital ? "removeClass" : "addClass"]("gray");
    var topicInputs = topics.find("input").attr("disabled", !inital);
    // show when newsletter is checked
    newsletter.on("click", function() {
      topics[this.checked ? "removeClass" : "addClass"]("gray");
      topicInputs.attr("disabled", !this.checked);
    });


    $.extend($.validator.messages, {
      required: "필수 항목입니다.",
      remote: "이미 사용중인 아이디입니다",
      email: "유효하지 않은 e-mail주소입니다.",
      url: "유효하지 않은 URL입니다.",
      date: "올바른 날짜를 입력하세요.",
      dateISO: "올바른 날짜(ISO)를 입력하세요.",
      number: "유효한 숫자가 아닙니다.",
      digits: "숫자만 입력 가능합니다.",
      creditcard: "신용카드 번호가 바르지 않습니다.",
      equalTo: "같은 값을 다시 입력하세요.",
      extension: "올바른 확장자가 아닙니다.",
      maxlength: $.validator.format("{0}자를 넘을 수 없습니다. "),
      minlength: $.validator.format("{0}자 이상 입력하세요."),
      rangelength: $.validator.format("문자 길이가 {0} 에서 {1} 사이의 값을 입력하세요."),
      range: $.validator.format("{0} 에서 {1} 사이의 값을 입력하세요."),
      max: $.validator.format("{0} 이하의 값을 입력하세요."),
      min: $.validator.format("{0} 이상의 값을 입력하세요.")
    });

  });


})(jQuery);