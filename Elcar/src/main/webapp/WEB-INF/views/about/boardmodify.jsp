<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="resources/js/ckeditor/ckeditor.js"></script>
<script src="http://code.jquery.com/jquery-latest.js"></script>
</head>
<body>
	<section style="margin-bottom: 100px; margin-top: 30px; height: 700px;">
		<form action="modify" method="post">
			<div>
			<c:if test="${boardlist.type eq '1'}">
				<input type="radio" name="type" id="type1" autocomplete="off" required value="1" checked>자유
			    <input type="radio"	name="type" id="type2" autocomplete="off" required value="2">후기
			</c:if>   
			<c:if test="${boardlist.type eq '2'}">
				<input type="radio" name="type" id="type1" autocomplete="off" required value="1" >자유
			    <input type="radio"	name="type" id="type2" autocomplete="off" required value="2" checked>후기
			</c:if> 	 
			</div>
			<div id="location" style=display:none>
				지역<input type="text" name="location" style="width: 300px" value="${board.location}"/>
			</div>
			<div>
				제목<input type="text" name="title" style="width: 300px" value="${board.title }"></input>
				유저아이디<input type="text" name="id" value="${id }" readonly></input>
			</div>
			
			
			<!-- CKEDITOR -->
			<textarea id="editor4" name="content">
			${board.content }
			</textarea>
			<script>
			 CKEDITOR.replace('editor4');
 			</script>


			<input type="submit" value="수정하기">
			</form>
			<input type="button" onclick="location.href='/boardlist'" value="목록으로">
	</section>
</body>
<script>
$(document).ready(function(){
	 
    // 라디오버튼 클릭시 이벤트 발생
    $("input:radio[name=type]").click(function(){
 
        if($("input:radio[name=type]:checked").val() == "2"){
            $("#location").css("display","block");
            // radio 버튼의 value 값이 1이라면 활성화
 
        }else if($("input:radio[name=type]:checked").val() == "1"){
        	$("#location").css("display","none");
            // radio 버튼의 value 값이 0이라면 비활성화
        }
    });
});
</script>
</html>