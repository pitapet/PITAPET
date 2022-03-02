/*
document.cookie = "safeCookie1foo; SameSite=Lax";
document.cookie = "safeCookie1foo";
document.cookie = "crossCookie=bar; SameSite=None; Secure";
*/

$(() => {
  $("#fullpage").fullpage({
    navigation: true,
    normalScrollElements: ".main__home__board",
    afterRender: function () {
      $("html").animate({ opacity: 1 }, 500);
    },
  });
  /*
  $(function(){
  	var num = $("#price").text();
	num2 = $.numberWithCommas(parseInt(num));
  })
  $.numberWithCommas = function (x) {
	  return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

  $('#price').change(() => {
        let price = $('#price').val();
        console.log(price);
        price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $('#price').val(price);
    });
	*/

});
/*
$(document).ready(() => {
	$('#price').change(() => {
        let price = $('#price').val();
        console.log(price);
        price = price.replace(/\B(?=(\d{3})+(?!\d))/g, ",");
        $('#price').val(price);
    });
});
*/

$(document).ready(function(){
	var IMP = window.IMP;
	var code = "imp49883029"; //가맹점 식별코드
	IMP.init(code);
		
	$("#purchase").on('click', () => {
		//결제요청
		IMP.request_pay({
            pg : 'kakao',
            pay_method : 'card',
            merchant_uid : 'merchant_' + new Date().getTime(),
	    	name : '결제테스트상품1' , //결제창에서 보여질 이름
	    	amount : 1, //실제 결제되는 가격
            buyer_email : 'iamport@siot.do',
            buyer_name : '구매자이름',
            buyer_tel : '010-1234-5678',
            buyer_addr : '서울 강남구 도곡동',
            buyer_postcode : '123-456'
	    	// 결제 완료 후 이동할 페이지
	    	// m_redirect_url : 'https://localhost:8089/payments/complete'
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) { // 결제 성공 시 
            var msg = '결제가 완료되었습니다.';
            var result = {
                "imp_uid" : rsp.imp_uid,
                "merchant_uid" : rsp.merchant_uid,
                "pay_date" : new Date().getTime(),
                "amount" : rsp.paid_amount,
				"card_no" : rsp.apply_num,
				"refund" : 'payed'
            }
            console.log("결제성공" + msg);
	    	// ajax 추가
        } else {
            var msg = '결제에 실패하였습니다.';
            msg += '에러내용 : ' + rsp.error_msg;
        }
        console.log(msg);
	}); //pay
}); // purchase click
}); // document ready

