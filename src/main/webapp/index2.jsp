<%@page import="java.text.DecimalFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String m1, m2, m3, m4;
	m1 = (String)session.getAttribute("mid");
	m2 = (String)session.getAttribute("mname");
	m3 = (String)session.getAttribute("memail");
	m4 = (String)session.getAttribute("mtel");
	
	String product_code, product_name, product_money, product_ea;
	product_code = request.getParameter("product_code");
	product_name = request.getParameter("product_name");
	product_money = request.getParameter("product_money");
	
	/* int m = Integer.parseInt(product_money);
	DecimalFormat dc = new DecimalFormat("###,###");
	String money = dc.format(m); */
	
	product_ea = request.getParameter("product_ea");
	
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제자 정보 확인 및 배송 정보 확인 페이지</title>
</head>
<body>
	<form name="frm" id="frm" enctype="application/x-www-form-urlencoded">
		<!-- PG사에 제공되는 hidden값들 -->
		<input type="hidden" name="version" value="1.0">
		<input type="hidden" name="mid" value="">
		<input type="hidden" name="oid" value="">
		<!-- 결제금액 -->
		<input type="hidden" name="price" value="<%=product_money%>">
		<input type="hidden" name="timestamp" value="">
		<input type="hidden" name="currency" value="WON">
		<!-- 상품명 -->
		<input type="hidden" name="goodname" value="<%=product_name %>">
		<input type="hidden" name="buyername" value="<%=m2%>">
		<input type="hidden" name="buyertel" value="<%=m4%>">
		<input type="hidden" name="buyeremail" value="<%=m3%>">
		<input type="hidden" name="buyerid" value="<%=m1%>">
		<input type="hidden" name="goodcode" value="<%=product_code %>">
		<input type="hidden" name="goodea" value="<%=product_ea %>">
		<table border="1" cellpadding="0" cellspacing="0">
				<tr>
					<td colspan="2" style="text-align: center"><p style="font-weight: bold">결제정보확인</p></td>
				</tr>
				<tr>
					<td>상품코드</td>
					<td><%=product_code %></td>
				</tr>
				<tr>
					<td>상품명</td>
					<td><%=product_name %></td>
				</tr>
				<tr>
					<td>결제금액</td>
					<td><span id="m"></span> 원</td>
				</tr>
				<tr>
					<td>수량</td>
					<td><%=product_ea %> 개</td>
				</tr>
			</table>
			<p>----------배송정보 입력 및 최종 결제 금액 확정----------</p>
			수령인 <input type="text" name="rec_name" value="<%=m2%>"><br>
			수령인 연락처 <input type="text" name="rec_tel" value="<%=m4%>"><br>
			배송지 주소 <input type="text" name="rec_addr" value=""><br>
			적립금 사용 <input type="text" name="point" value="0"><br>
			최종 결제금액 <span id="total"></span> 원<br>
			<p>----------결제 파트----------</p>
			<input type="radio" name="gopaymethod" value="CARD" checked>신용카드
			<input type="radio" name="gopaymethod" value="Directbank">계좌이체
			<input type="radio" name="gopaymethod" value="vbank">가상계좌
			<br>
			<input type="button" id="payment" value="결제하기">
	</form>		
</body>
<script type="module">
	let money = <%=product_money%>;	// 상품 고유금액
	import {gopayment} from "./js/index.js?v=000000026";

	console.log(money);
	document.getElementById("m").innerText = money.toLocaleString();
	document.getElementById("total").innerText = money.toLocaleString();

	document.querySelector("#payment").addEventListener("click",function(){
		gopayment(money);
	});
</script>
</html>