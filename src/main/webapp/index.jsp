<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	//setAttribute, getAttribute 같이 사용 금지
	String mid, mname, memail, mtel;
	mid = "hong";
	mname = "홍길동";
	memail = "11jangwoon0518@gmail.com";
	mtel = "01023866958";
	
	session.setAttribute("mid",mid);
	session.setAttribute("mname",mname);
	session.setAttribute("memail",memail);
	session.setAttribute("mtel",mtel);
	
	
	String m1, m2, m3, m4;
	m1 = "mid";
	m2 = "mname";
	m3 = "memail";
	m4 = "mtel";
	
	Object mid1 = session.getAttribute(m1);
	Object mname1 = session.getAttribute(m2);
	Object memail1 = session.getAttribute(m3);
	Object mtel1 = session.getAttribute(m4);
// 	session.removeAttribute(mid);
// 	session.removeAttribute(mname);

	/*	상품코드 6자리 난수코드 생성	*/
	Random rd = new Random();
	int number;
	String nb = "";
	for(int a = 1; a <= 6; a++){
		number = rd.nextInt(9);
		nb += number;
	}
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 선택 부분</title>
</head>
<body>
	<form name="frm" id="frm">
		<!-- 결제시스템에는 상품코드는 최소 6자리 ~ 최대 12자리 -->
		<!-- 결제금액/상품수량 : 무조건 숫자만/ 금액은 1000원부터 -->
		<!-- 상품명 : 부적절한 단어 (술, 담배, 마약 등등) -->
		<table>
			<tr>
				<td>상품코드</td>
				<td><input type="text" id="" name="product_code" value="<%=nb %>" readonly="readonly"></td>
			</tr>
			<tr>
				<td>상품명</td>
				<td><input type="text" id="" name="product_name" value="" placeholder="상품명 입력"></td>
			</tr>
			<tr>
				<td>결제금액</td>
				<td><input type="text" id="" name="product_money" value="" placeholder="결제금액 입력"></td>
			</tr>
			<tr>
				<td>수량</td>
				<td><input type="text" id="" name="product_ea" value="" placeholder="수량 입력"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="button" id="btn" value="상품구매확정"></td>
			</tr>
		</table>
	</form>
	<!-- ECMA 형태의 script -->
	<script type="module">
		import {gopage} from "./js/index.js?v=00000000";
		document.querySelector("#btn").addEventListener("click",gopage);
	</script>
</body>
</html>