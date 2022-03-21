<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pit A Pet</title>
    <meta name="description" content="Pit A Pet" />
    <meta name="author" content="fiveth" />
    <link rel="icon" type="image/png" sizes="152x152" href="${ path }/images/logo.png" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${ path }/css/login.css" />
    <script src="https://kit.fontawesome.com/91b5983e4b.js" crossorigin="anonymous"></script>
    <script src="${ path }/js/login.js" defer></script>
    <script src="${ path }/js/plugin/jquery-3.6.0.js"></script>
  </head>
  <body>
  <div id="container" class="container">
      <!-- FORM SECTION -->
      <div class="row">
        <!-- SIGN UP -->
        <div class="col align-items-center flex-col sign-up">
          <div class="form-wrapper align-items-center">
            <form class="form sign-up" name="memberEnrollFrm" id="enrollFrm" action="${ path }/member/enroll" method="post">
              <div class="input-group up">
                <i class="fas fa-user"></i>
                <input type="text" name="id" id="newId" placeholder="아이디" required />
              </div>
              <input class="enroll__idcheck" type="button" id="idcheckDuplicate" value="중복검사" />
              <input type="hidden" name="checked_id" value="" required />
              <div class="input-group up">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" id="pass1" onchange="check_pw()" placeholder="비밀번호 (특수문자를 포함한 8자 이상)" required />
              </div>
              <div class="input-group up">
                <i class="fas fa-lock"></i>
                <input type="password" id="pass2" onchange="check_pw()" placeholder="비밀번호 확인" required />&nbsp;<span id="check"></span> 
              </div>
              <div class="input-group up">
                <i class="fas fa-user"></i>
                <input type="text" name="name" id="name" placeholder="이름"  required />
              </div>
              <div class="input-group up">
                <i class="fas fa-user"></i>
                <input type="text" name="nickname" id="nickname" placeholder="닉네임"  required />
              </div>
              <!-- <div class="input-group up">
                <i class="fas fa-images"></i>
                <input type="file" name="profile" id="profile" title="프로필사진" required />
              </div> -->
              <div class="input-group up">
                <i class="fas fa-mobile-alt"></i>
                <input type="tel" name="phone" id="phone" maxlength="11" placeholder="전화번호 (- 없이)" required />
              </div>
              <div class="input-group up">
                <i class="fas fa-envelope"></i>
                <input type="email" name="email" id="email" placeholder="이메일" required />
              </div>
              <input class="enroll__emailcheck" type="button" id="emailcheckDuplicate" style="top: 500px;" value="중복검사" />
              <input type="hidden" name="checked_email" value="" required />
              <div class="input-group up">
                <i class="fa-solid fa-paw"></i>
                <input type="text" name="pet" id="pet" placeholder="애완동물"  required />
              </div>
    
              <div class="checkbox_group">
                <p>
					<label>
						<input type="checkbox" name="c1" id="c1" > PITAPET 이용약관 동의(필수)
					</label>
				</p>
				</div>
				 <div class="checkbox_group">
				<p>
					<label>
						<input type="checkbox" name="c2" id="c2" > 개인정보 수집 및 이용에 대한 안내(필수)
					</label>
				</p>
              </div>
              
               <button class="btn sign-ups" disabled="disabled" id="btn">회원가입</button>   
              <!--<input type="submit" class="btn sign-ups" id="btn" value="회원가입" disabled="disabled">-->
              <p>
                <span> 이미 계정이 있으신가요? </span>
                <b onclick="toggle()" class="pointer"> 로그인 </b>
              </p>
              <p>
                <b onclick="location.href=${ path }/" style="cursor: pointer">메인으로 돌아가기</b>
              </p>
            </form>
          </div>
        </div>
        <!-- END SIGN UP -->
        <!-- SIGN IN -->
        <div class="col align-items-center flex-col sign-in">
          <div class="form-wrapper align-items-center">
            <form action="${ path }/login" method="post" class="form sign-in">
              <div class="input-group in">
                <i class="fas fa-user"></i>
                <input type="text" name="id" id="id" value="" placeholder="아이디를 입력해주세요." />
              </div>
              <div class="input-group in">
                <i class="fas fa-lock"></i>
                <input type="password" name="password" id="password" placeholder="패스워드를 입력해주세요." />
              </div>
              <input class="btn sign-ins" type="submit" value="로그인"></input>
              <p >
                <b onclick="location.href='${ path }/member/findId';" style="cursor: pointer">아이디나 비밀번호를 잊으셨나요? </b>
              </p>
              <p>
                <span> 어랏, 계정이 없으신가요? </span>
                <b onclick="toggle()" class="pointer"> 회원가입 </b>
              </p>
              <p>
                <b onclick="location.href=${ path }/" style="cursor: pointer">메인으로 돌아가기</b>
              </p>
            </form>
          </div>
          <div class="form-wrapper"></div>
        </div>
        <!-- END SIGN IN -->
      </div>
      <!-- END FORM SECTION -->
      <!-- CONTENT SECTION -->
      <div class="row content-row">
        <!-- SIGN IN CONTENT -->
        <div class="col align-items-center flex-col">
          <div class="text sign-in">
            <h2>Welcome</h2>
          </div>
          <div class="img sign-in"></div>
        </div>
        <!-- END SIGN IN CONTENT -->
        <!-- SIGN UP CONTENT -->
        <div class="col align-items-center flex-col">
          <div class="img sign-up"></div>
          <div class="text sign-up">
            <h2>Be with us</h2>
          </div>
        </div>
        <!-- END SIGN UP CONTENT -->
      </div>
      <!-- END CONTENT SECTION -->
    </div>
    <script>    
    
	// 아이디 중복 확인
	$(document).ready(() => {
			let idCheck = false;
			let emailCheck = false;
			//let btnStatus = false;
		  $("#btn").on("click", () => {
			if(btnStatus == false){
				alert("아이디와 이메일 중복체크를 해주세요.");
			}
		});	
		$("#idcheckDuplicate").on("click", () => {
			let userId = $("#newId").val().trim();
			
			$.ajax({
				type: "post",
				url: "${ path }/member/idCheck",
				dataType: "json",
				data: {
					userId
				},
				success: (data) => {
					console.log(data);
					if(userId !='' ){
						if(data.duplicate === true) {
							alert("이미 사용중인 아이디 입니다.");
							idCheck = false;
							if(idCheck === false){
								$("#btn").attr("disabled", "disabled");
								//btnStatus = false;
							}
						} else {
							alert("사용 가능한 아이디 입니다.");	
							idCheck = true;
							if(idCheck === true && emailCheck === true){
								$("#btn").removeAttr("disabled");
								//btnStatus = true;
							} 
						}
					}
					else{
						alert("아이디를 입력한 후 다시 검사해주세요.")
					}
				},
				error: (error) => {
					console.log(error);
				}
			});
		});
		
		
		$("#emailcheckDuplicate").on("click", () => {
			let userEmail = $("#email").val().trim();
			
			$.ajax({
				type: "post",
				url: "${ path }/member/emailCheck",
				dataType: "json",
				data: {
					userEmail
				},
				success: (data) => {
					console.log(data);
					if(userEmail !='' ){
						if(data.duplicate === true) {
							alert("이미 사용중인 이메일 입니다.");
							emailCheck = false;
							if(emailCheck === false){
								$("#btn").attr("disabled", "disabled");
								//btnStatus = false;
							}
						} else {
							alert("사용 가능한 이메일 입니다.");	
							emailCheck = true;
							if(idCheck === true && emailCheck === true){
								$("#btn").removeAttr("disabled");
								//btnStatus = true;
							} 
						}
					}
					else{
						alert("이메일을 입력한 후 다시 검사해주세요.")
					}
				},
				error: (error) => {
					console.log(error);
				}
			});
		});
		
	});
	
	
	       
	// 비밀번호 체크	
	function check_pw(){
	       var pw = document.getElementById('pass1').value;
	       var SC = ["!","@","#","$","%", "^", "&", "*", "(", ")", "_", "+", "-", "`", "~", "="];
	       var check_SC = 0;
	       
	 // 비밀번호 길이 체크
	       if(pw.length < 8){
	           alert('비밀번호는 8글자 이상만 이용 가능합니다.');
	           document.getElementById('pass1').value='';
	       }
	 // 특수문자 체크
	       for(var i=0;i<SC.length;i++){
	           if(pw.indexOf(SC[i]) != -1){
	               check_SC = 1;
	           }
	       }
	       if(check_SC == 0){
	           window.alert('특수문자가 들어가 있지 않습니다.')
	           document.getElementById('pass1').value='';
	       }
	 // 패스워드 일치여부 체크
	       if(document.getElementById('pass1').value !='' && document.getElementById('pass2').value!=''){
	           if(document.getElementById('pass1').value==document.getElementById('pass2').value){
	               document.getElementById('check').innerHTML='비밀번호가 일치합니다.'
	               document.getElementById('check').style.color='green';
	           }
	           else{
	               document.getElementById('check').innerHTML='비밀번호가 일치하지 않습니다.';
	               document.getElementById('check').style.color='red';
	           }
	       }
	   }
		 
	// 약관동의 검사
	var doc = document; 
	var form1 = doc.getElementById('enrollFrm'); 
	var inputs = form1.getElementsByTagName('INPUT');
	var form1_data = {
		"c1": false, 
		"c2": false
	}; 

	var c1 = doc.getElementById('c1');
	var c2 = doc.getElementById('c2');


	function checkboxListener() {
		form1_data[this.name] = this.checked; 

		if(this.checked) {
			// submit 할때 체크하지 않아 색이 변한 font 를 다시 원래 색으로 바꾸는 부분. 
			this.parentNode.style.color = "#000";
		}
	}

		c1.onclick = c2.onclick = checkboxListener;

		function setCheckbox(obj, state) {
			for (var x in obj) {
				obj[x] = state; 

				for(var i = 0; i < inputs.length; i++) {
					if(inputs[i].type == "checkbox") {
						inputs[i].checked = state; 
					}
				}

			}
		}

	enrollFrm.onsubmit = function(e) {
		e.preventDefault(); // 서브밋 될때 화면이 깜빡이지 않게 방지
		
		if ( !form1_data['c1'] ) {
			c1.parentNode.style.color = 'red'; 
			alert('이용약관 동의를 하지 않았습니다'); 
			return false; 
		}

		if ( !form1_data['c2'] ) {
			c2.parentNode.style.color = 'red';
			alert('개인정보 수집 및 이용에 대한 안내를 선택하지 않았습니다.'); 
			return false; 
		}
		
		this.submit();
	}; 
</script>
  </body>
</html>