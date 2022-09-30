/*	js파일에는 jsp코드 사용 불가	*/

/*	기본 상품 정보 입력	*/
export function gopage(){
	if(frm.product_name.value==""){
		alert("상품명 입력");
		focus.frm.product_name();
	}
	else if(frm.product_money.value==""){
		alert("상품가격 입력");
	}
	else if(frm.product_ea.value==""){
		alert("상품수량 입력");
	}
	else{
		if(frm.product_money.value < 1000){
			alert("상품가격 1000 이상 입력");
		}
		else if(frm.product_ea.value <= 0){
			alert("상품수량 0 이상 입력");
		}
		else{
			frm.method="POST";
			frm.action="./index2.jsp";
			frm.submit();
		}
	}
	
}

/*	기본 적립금 확인 및 실제 결제할 금액 체크	*/

export function gopayment(money){
	let oksign = "no";
	if(frm.point.value > 0){
		var ori_m = frm.price.value;
      	var point = frm.point.value;
      	var new_m = ori_m-point;
      	frm.price.value = new_m;
      	document.getElementById("total").innerText=new_m.toLocaleString();
      	oksign="ok";

	}
	else if(frm.point.value == "" || frm.point.value == "0"){
		frm.point.value = 0;
		frm.price.value = money;
		document.getElementById("total").innerText = money;
		oksign = "ok";
	}
		// oksign
		if(oksign = "ok"){
			frm.method = "POST";
			frm.action = "./index3.jsp";
			frm.submit();
		}
			
	else{
//		frm.method = "POST";
//		frm.action = "index3.jsp";
//		frm.submit();
	}
}