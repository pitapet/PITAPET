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

/*
$(document).ready(function() {
    var IMP = window.IMP;
	var code = "imp49883029"; // 가맹점 식별코드
	IMP.init(code);

$("#purchase").on('click', () => {
    //결제요청
    IMP.request_pay({
        pg : 'kakao',
        pay_method : 'card', // 결제방법
        merchant_uid : 'merchant_' + new Date().getTime(), // 주문번호
	    name : '결제테스트상품1' , // 상품명(결제창에서 보여질 이름)
	    amount : 1, // 주문 개수? 가격?
        buyer_email : 'iamport@siot.do', // ${ loginMember.email } 구매자 이메일
        buyer_name : '구매자이름', // 구매자 이름
        buyer_tel : '010-1234-5678', // 구매자 휴대폰번호
        buyer_addr : '서울 강남구 도곡동', // 구매자 주소
        buyer_postcode : '123-456' // 구매자 우편번호
        //buyer_postcode: no // 상품코드
	    // 결제 완료 후 이동할 페이지
	    // m_redirect_url : 'https://localhost:8089/payments/complete'
}, function(rsp) {
    console.log(rsp);
    if ( rsp.success ) { // 결제 성공 시 
        alert("결제가 완료되었습니다.");
        var msg = '결제가 완료되었습니다.';
        console.log(rsp);
        //location.href='결제 완료 후 이동할 url';
        var result = {
            "imp_uid" : rsp.imp_uid,
            "merchant_uid" : rsp.merchant_uid,
            //"biz_email" : ${ loginMember.email }
            "pay_date" : new Date().getTime(),
            "amount" : rsp.paid_amount,
			"card_no" : rsp.apply_num,
			"refund" : 'payed'
        }
        console.log("결제성공" + msg);

        // ajax
        $.ajax({
            type : 'POST', // 전송 방식(GET/POST)
            url : 'jqAjax1.do', // 데이터를 전송한 URL(필수값)
            dataType: 'json', // 서버에서 보내줄 데이터 타입
            data : JSON.stringify(result,
                    ['imp_uid', 'merchant_uid', 'pay_date',
                    'amount', 'card_no', 'refund']), 
            
            //data : { // 요청 시 전달할 파라미터 설정
            //    input: input // 속성명: 변수값(let input = $("#input1").val();)
            //},
            
            contentType: 'application/json;charset=utf-8',
            success: function(result){
                // AJAX 통신 성공 시 처리할 콜백 함수 지정
                // 매개 변수는 서버에서 응답이 왔을 때 그 값이 저장되는 변수 (임의로 짖ㅇ 가능)
                if(result == 1){
                    console.log("구매성공");
                    
                    //stock -= 1;
                    //$('#stock').html(stock);
                    //
                } else {
                    console.log("구매실패");
                }
            },
            error: function(){
                // AJAX 통신 실패 시 처리할 콜백 함수 지정
                console.log("구매 ajax 통신 실패");
            }
        }) // ajax

    } else {
        alert("결제에 실패하였습니다.");
        var msg = '결제에 실패하였습니다.';
        msg += '에러내용 : ' + rsp.error_msg;
    }
    console.log(msg);
    
    }); //pay

}); // purchase click


$("#productCheck").on("click", () => {
			const url = "${ path }/product/productCheck";
			const status = "left=500px,top=200px,width=600px,height=200px";
			
			open(url, "", status);
		}); // productCheck click

}); // document ready
*/

