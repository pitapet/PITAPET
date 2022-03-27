<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>api테스트/title>
</head>

<body>
 <h1>GET 방식 요청</h1>
  <button type="button" onclick="GetRequest()">GET</button>
  <p id="get"></p>
  <h1>POST 방식 요청</h1>
  <button type="button" onclick="PostRequest()">POST</button>
  <p id="post"></p>
  <script>
    function GetRequest() {
      //XMLhttpRequest object생성
      var Request = new XMLHttpRequest();
      //onreadystatechagne : 요청에 대한 상태가 변화할 때 마다 function호출
      Request.onreadystatechange = function(){
        if (Request.readyState == 4 && Request.status == 200 ) {
          //readyState의 상태 값 : 1(open메소드 실행 성공) | 2(서버와 연결 완료) | 3(request요청 처리중) | 4(request처리 끝 = 응답 준비 완료)
          //status의 상태 값 : 200(OK)
          document.getElementById("get").innerHTML = Request.responseText;
          //응답 데이터의 종류 : responseText | responseXML
        }
      }
      //open() : 요청방식, url, 비동기여부(true = 비동기)
      Request.open("GET", "/study/sample.txt", true);
      //요청 보내기
      Request.send();
    }
    function PostRequest(){
      var Request = new XMLHttpRequest();
      Request.onreadystatechange = function(){
        if(Request.readyState == 4 && Request.status == 200){
          document.getElementById('post').innerHTML = Request.responseText;
        }
      }
      Request.open("POST", "/study/sample.txt", true);
      //POST방식 사용시 아래 메소드 추가(MIME type 설정)
      Request.setRequestHeader('Content-Type', 'application/x-www-form-urlencoded');
      Request.send();
    }
  </script>
</body>
</html>