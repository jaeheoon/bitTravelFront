/* slick */
$(document).ready(function(){
    $('.m_prd01').slick({
        dots: false,
        infinite: true,
        slidesToShow:4,
        slidesToScroll: 1,
        autoplay: true,
        autoplaySpeed: 2500
    });
});
/* 메뉴 */
$(function(){
    $("#gnb li.company").mouseover(function(){
        $(".bg").addClass("on");
    }).mouseleave(function(){
        $(".bg").removeClass("on");
    });
    $('.bg').mouseover(function(){
        $('#header').addClass('on');
    });
    $('.bg').mouseout(function(){
        $('#header').removeClass('on');
    });
});

/* 로그인 */
$(function () {
	'use strict';
  
	$(document).ready(function () {
	  let forms = $('#loginModal .needs-validation'); // jQuery를 사용하여 폼 선택
  
	  forms.each(function () {
		let form = this;
  
		$(form).on('submit', function (event) {
		  if (!form.checkValidity()) { // 폼 유효성 검사
			event.preventDefault();
			event.stopPropagation();
		  } else {
			event.preventDefault(); // 폼의 기본 제출 방지
  
			$.post('../login/loginAction.jsp',
			  $(this).serialize(),
			  function (data) {
				  alert(data.message);
				  if (data.redirect) {
	                window.location.href = data.redirect;
	              }
			  }
			).fail(function() {
				alert('로그인에 실패하셨습니다. 다시 로그인하세요.');
			});
		  }
  
		  $(form).addClass('was-validated'); // 유효성 검사 결과를 표시
		});
	  });
	});
});

/* 회원가입 */
$(function () {
	'use strict';
  
	$(document).ready(function () {
	  let forms = $('#joinModal .needs-validation'); // jQuery를 사용하여 폼 선택
  
	  forms.each(function () {
		let form = this;
  
		$(form).on('submit', function (e) {
		  if (!form.checkValidity()) { // 폼 유효성 검사
			e();
			e();
		  } else {
			e(); // 폼의 기본 제출 방지
  
			$.post('../join/join.jsp',
			  $(this).serialize(),
			  function (data) {
				  alert(data.message);
				  if (data.redirect) {
	                window.location.href = data.redirect;
	              }
			  }
			).fail(function() {
				alert('회원가입에 실패하였습니다. 다시 시도해주시기 바랍니다.');
			});
		  }
  
		  $(form).addClass('was-validated'); // 유효성 검사 결과를 표시
		});
	  });
	});
});