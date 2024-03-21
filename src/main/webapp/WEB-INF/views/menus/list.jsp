<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>menus/list.jsp</title>
<link rel="stylesheet" href="/css/common.css">
<link rel="icon" type="image/png" href="./img/favicon.png">
<!-- css내부에 css적용할 수 있는 scss 문법 적용 -->
<script src="https://cdn.jsdelivr.net/npm/browser-scss@1.0.3/dist/browser-scss.min.js"></script>
<style>
	td {
		padding: 10px;
		width: 150px;
		text-align: center;
	}
	
	tr:first-child {
		background-color: black;
		color: white;
		font-weight: bold;
		text-align: right;
		/*scss 문법을 이용한 표현(script로 설치 필요)*/
		td{
			border-color: #dbb1ff;
		}
		
	}
	<!-- tr 안에 td를 사용하려면 추가 적인 설정이 필요 아니면 그냥 원래 css 처럼 아래와 같이 사용 -->
	/* tr:first-child > td {border-color: white}  */
	
	tr:nth-child(2) td {
		text-align: right;
	}
</style>
</head>
<body>
	<!-- list.jsp 수정 -->
	<!-- jstl(java standard tag library)를 사용해 목록을 출력 - c:foreach -->
	<main>
		<h2>메뉴 목록</h2>
		<table>
			<tr>
				<td>Menu_id</td>
				<td>Menu_name</td>
				<td>Menu_seq</td>
				<td>삭제</td>
				<td>수정</td>
			</tr>
			<tr>
				<td colspan="5">
					[<a href="/Menus/WriteForm">메뉴 등록</a>]
					&nbsp;&nbsp;&nbsp;
					[<a href="/Menus/WriteForm2">메뉴 등록2</a>]
				</td>
			</tr>
			<!-- 추가 후 menuList를 부를 때 빈값이 넘어오는 오류로 insert도 모델을 사용하도록 수정 -->
			<c:forEach var="menu" items="${menuList}"> <!-- menuList를 할 때 forEach는 무시지만 %는 오류이기 때문에 forEach 사용 -->
				<tr>
					<td>${menu.menu_id}</td>
					<td>${menu.menu_name}</td>
					<td>${menu.menu_seq}</td>
					<td><a href="/Menus/Delete?menu_id=${menu.menu_id}">삭제</a></td> <!-- href에 #은 페이지 새로고침 -->
					<td><a href="#">수정</a></td>
				</tr>
			</c:forEach>
		</table>
	</main>
</body>
</html>