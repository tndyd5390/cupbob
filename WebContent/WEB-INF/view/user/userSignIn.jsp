<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	request.setCharacterEncoding("euc-kr");
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- Bootstrap core CSS -->
<link href="userBootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Bootstrap theme -->
<link href="userBootstrap/css/bootstrap-theme.min.css" rel="stylesheet">
<link rel="stylesheet" href="userBootstrap/css/turtle.min.css" />
<title>소라네 컵밥 회원가입</title>
<script>
var regExp = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
var ovlapE = false;
function overlapEmail() {
	$.ajax({
		type : "POST",
		dataType : 'text',
		url : "overlapEmail.do",
		data : {
			"email" : $('#email1').val() + "@" + $("#email2").val()
		},
		success : function(data) {
			 if ($.trim(data) == 1) {
				$('p.emailFont').html("이미 존재하는 아이디입니다")
				ovlapE = false;
			}   else if(!regExp.test($('#email1').val()+"@"+$('#email2').val())){
				$('p.emailFont').html("이메일을 입력해주세요")
				ovlapE = false;
			}   else if($('#email1').val() == "" || $('#email2').val() == ""){
				$('p.emailFont').html("이메일을 입력해주세요")
				ovlapE = false;
			}  else{
				$('p.emailFont').html("가능합니다")
				ovlapE = true;
			}
		}
	})
};

function pwCheck() {
	
	var str1 = $('#password').val();
	
	if(str1.length < 6 || str1.length > 12){
		$('#passwordFonts').html('* 비밀번호는 6글자에서 12글자 사이로 입력해주세요.').css("color","red");
		return false;
	}
	else if($('#password').val() != $('#confirm_password').val()){
		$('#passwordFonts').html('* 비밀번호가 일치하지 않습니다. 다시 입력해 주세요.').css("color","red");
		return false;
	}else{
		$('#passwordFonts').html('* 비밀번호가 일치합니다.').css("color", "skyblue");
		return true;
	}
}

	function doJoin() {
		var str1 = $('#password').val();
		var email1 = $('#email1');
		var email2 = $('#email2');
		var password = $('#password');
		var confirmPassword = $('#confirm_password');
		var user_name = $('#name');
		var gender = $('#gender');
		var contact_addr = $('#contact_addr');
		var year = $('#year');
		var month = $('#month');
		var day = $('#day');
		var checkBox1 = $('#checkBox1');
		var checkBox2 = $('#checkBox2');
		var checkBox3 = $('#checkBox3');

		if (email1.val() == "") {
			alert("이메일을 입력하세요")
			email1.focus();
			return false;
		} else if (email2.val() == "") {
			alert("이메일을 입력하세요")
			email2.focus();
			return false;
		} else if (user_name.val() == "") {
			alert("성명을 입력하세요");
			user_name.focus();
			return false;
		} else if (password.val() == "") {
			alert("비밀번호를 입력하세요");
			password.focus();
			return false;
		} else if (confirmPassword.val() == "") {
			alert("비밀번호 재확인을 입력하세요");
			confirmPassword.focus();
			return false;
		} else if (password.val() != confirmPassword.val()) {
			alert("비밀번호가 일치하지 않습니다");
			confirmPassword.focus();
			return false;
		} else if(str1.length < 6 || str1.length > 12){
			alert("비밀번호는 6자에서 12자 사이로 입력해주세요.");
			password.focus();
			return false;
		} else if (gender.val() == "") {
			alert("성별을 선택해주세요");
			gender.focus();
			return false;
		} else if (contact_addr.val() == "") {
			alert("휴대폰번호를 입력해주세요");
			contact_addr.focus();
			return false;
		} else if (year.val() == "") {
			alert("생년을 선택해 주세요");
			year.focus();
			return false;
		} else if (month.val() == "") {
			alert("월을 선택해 주세요");
			month.focus();
			return false;
		} else if (day.val() == "") {
			alert("일을 선택해 주세요");
			day.focus();
			return false;
		} else if ($('input:checkbox[id="checkBox1"]').is(":checked") == false) {
			alert("서비스 이용약관을 읽어보신 후 동의가 필요합니다");
			checkBox1.focus();
			return false;
		} else if ($('input:checkbox[id="checkBox2"]').is(":checked") == false) {
			alert("개인정보 수집 및 이용 동의 안내를 읽어보신 후 개인정보 취급방침에 동의가 필요합니다");
			checkBox2.focus();
			return false;
		} else if ($('input:checkbox[id="checkBox3"]').is(":checked") == false) {
			alert("개인정보 취급 위탁 안내를 읽어보신 후 개인정보 취급 위탁에 대해 동의가 필요합니다");
			checkBox3.focus();
			return false;
		} else if (ovlapE == false) {
			alert("아이디 중복확인이 필요합니다");
			email.focus();
			return false;
		} else {
			if (confirm("가입하시겠습니까?")) {
				return true;
			} else {
				return false;
			}
		}
	}


	function doKeyOnlyNumberPhone(event) {
		event = event || window.event;
		var keyID = (event.which) ? event.which : event.keyCode;

		if ((keyID >= 48 && keyID <= 57) || (keyID >= 96 && keyID <= 105)
				|| keyID == 8 || keyID == 109 || keyID == 189 || keyID == 16
				|| keyID == 20 || keyID == 9 || keyID == 13) {
			return true;
		} else {
			alert("숫자만 입력가능 합니다");
			var val = document.getElementById("phone");
			val.value = val.value.subString(0, val.value.length - 1);
			return false;
		}
	}


	function doCancel() {
		if (confirm("취소 하시겠습니까?")) {
			location.href("userSignIn.do")
		}
	}
</script>
</head>
<body>
	<%@include file="/include/nav.jsp"%>
	<br>
	<br>
	<br>
	<form class="form" method="post" action="userSignInProc.do" onsubmit="return doJoin();" name ="form1">
		<h4 class="formHead">필수 정보</h4>
		<div class="form-group">
			<input type="text" class="form-control email" id="email1"
				placeholder="이메일 입력" name="email1" onkeyup="overlapEmail()"> <label>@</label> <input type="text"
				class="form-control email" id="email2" name="email2" onkeyup="overlapEmail()">
			<p class="emailFont">회원님의 이메일은 추후 아이디로 사용됩니다.</p>
		</div>
		<div class="form-group">
			<input type="password" class="form-control password" id="password" 
				placeholder="비밀번호" onkeyup="pwCheck()"> <input type="password"
				class="form-control password" id="confirm_password" name="password" placeholder="비밀번호 재확인" onkeyup="pwCheck()">
			<p class="passwordFont" id="passwordFonts"></p>
		</div>
		<div class="form-group">
			<input type="text" class="form-control name" id="name" placeholder="이름" name="name">
			<select class="form-control selectSex" id="gender" name="gender">
				<option value="" selected>성별</option>
				<option value="남자">남</option>
				<option value="여자">여</option>
			</select> <input type="text" class="form-control phone" id="contact_addr"
				placeholder="휴대폰번호(ex01012345678)" name="contact_addr">  <!-- onKeyDown="return doKeyOnlyNumberPhone(event);" -->  
			<p class="nameFont">휴대폰 번호는 아이디 또는 비밀번호를 찾기 위한 정보이므로 정확하게 입력해
				주세요.</p>
		</div>
		<div class="form-group">
			<select class="form-control selectYear" name="year" id="year">
				<option value="" selected>생년</option>
				<% for(int i=1900;i<=2017;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%}%>
				</select> 
				<select class="form-control selectMonth" name="month" id="month">
				<option value="" selected>월</option>
				<% for(int i=1;i<=12;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%}%>
			</select> <select class="form-control selectDay" name="day" id="day">
				<option value="" selected>일</option>
				<% for(int i=1;i<=31;i++){ %>
				<option value="<%=i%>"><%=i%></option>
				<%}%>
			</select>
		</div>
		<h4 class="formHead">서비스 이용약관 동의</h4>
		<div class="service">
		제 1장 총칙

제 1조 (목적)<br />
본 약관은 거북목동아리 가 제공하는 모든 서비스(이하 '서비스')의 이용조건 및 절차, 이용자와 당사의 권리, 의무, 책임사항과 기타 필요한 사항을 규정함을 목적으로 합니다.<br />
제 2조 (약관의 효력과 변경)<br />
1. 당사는 귀하가 본 약관 내용에 동의하는 것을 조건으로 귀하에게 서비스를 제공할 것이며, 귀하가 본 약관의 내용에 동의하는 경우, 당사의 서비스 제공 행위 및 귀하의 서비스 사용 행위에는 본 약관이 우선적으로 적용될 것입니다.<br />
2. 당사는 본 약관을 사전 고지 없이 변경할 수 있으며, 변경된 약관은 당사 사이트 내에 공지함으로써 이용자가 직접 확인 하도록 할 것입니다. 이용자가 변경된 약관에 동의하지 아니하는 경우, 이용자는 본인의 회원등록을 취소(회원탈퇴)할 수 있으며, 계속 사용의 경우는 약관 변경에 대한 동의로 간주됩니다. 변경된 약관은 공지와 동시에 그 효력이 발생됩니다.<br />
제 3조 (약관외 준칙)<br />
1. 본 약관은 당사가 제공하는 서비스에 관한 이용규정 및 별도 약관과 함께 적용됩니다.<br />
2. 본 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신 윤리위원회 심의규정, 정보통신 윤리강령, 프로그램 보호법 및 기타관련 법령의 규정에 의합니다.<br />
제 4조 (용어의 정의)<br />
본 약관에서 사용하는 용어의 정의는 다음과 같습니다.<br />
<br />
1. 이용자 : 본 약관에 따라 당사가 제공하는 서비스를 받는 자.<br />
2. 가 입 : 모든 회원은 반드시 회원 본인의 이름과 생년월일, 성별을 제공하여야만 서비스를 이용할 수 있습니다.<br />
3. 회 원 : 이용자는 '회사'가 정한 가입 양식에 따라 회원정보를 기입한 후 이 약관에 동의한다는 의사표시를 함으로서 회원가입을 신청합니다.<br />
4. ID : 회원식별과 회원의 서비스 이용을 위하여 회원이 신청하는 고유 이메일 주소<br />
5. 비밀번호 : 이용자와 회원ID가 일치하는지를 확인하고 통신상의 자신의 비밀보호를 위하여 이용자 자신이 선정한 문자와 숫자의 조합.<br />
6. 탈퇴 : 회원이 이용계약을 종료 시키는 행위<br />
7. 본 약관에서 정의하지 않은 용어는 개별서비스에 대한 별도 약관 및 이용규정에서 정의 합니다.<br />
제 2장 서비스 제공 및 이용<br />
<br />
제 5조 (이용 계약의 성립)<br />
1. 이용계약은 신청자가 온라인으로 당사 소정의 가입신청 양식에서 요구하는 사항을 기록하여 가입을 완료 하는 것으로 성립됩니다.<br />
2. 당사는 다음 각 호에 해당하는 이용계약에 대하여는 가입을 취소할 수 있습니다.<br />
1) 다른 사람의 명의를 사용하여 신청하였을 때<br />
2) 이용 계약 신청서의 내용을 허위로 기재하였거나 허위서류를 첨부하여 신청하였을 때<br />
3) 사회의 안녕 질서 혹은 미풍양속을 저해할 목적으로 신청하였을 때<br />
4) 다른 사람의 당사서비스 이용을 방해하거나 그 정보를 도용하는 등의 행위를 하였을 때<br />
5) 당사 사이트를 이용하여 법령과 본 약관이 금지하는 행위를 하는 경우<br />
6) 기타 당사가 정한 이용신청요건이 미비 되었을 때<br />
3. 당사는 다음 각 항에 해당하는 경우 그 사유가 해소될 때까지 이용계약 성립을 유보할 수 있습니다.<br />
1) 서비스 관련 제반 용량이 부족한 경우<br />
2) 기술상 장애 사유가 있는 경우<br />
4. 당사가 제공하는 서비스는 아래와 같으며, 그 변경될 서비스의 내용을 이용자에게 공지하고 아래에서 정한 서비스를 변경하여 제공 할 수 있습니다.<br />
1) 전자 상거래 (인터넷 쇼핑)<br />
3) 기타 거북목동아리 자체 개발하거나 다른 회사와의 협력 계약 등을 통해 제공하는 일체의 서비스<br />
제 6조 (회원정보 사용에 대한 동의)<br />
1. 당사의 회원 정보는 다음과 같이 수집, 사용, 관리, 보호됩니다.<br />
1) 개인정보의 수집 : 당사는 귀하의 당사 서비스 가입 시 귀하가 제공하는 정보, 커뮤니티 활동을 위하여 귀하가 제공하는 정보, 각종 이벤트 참가를 위하여 귀하가 제공하는 정보, 광고나 경품의 취득을 위하여 귀하가 제공하는 정보 등을 통하여 귀하에 관한 정보를 수집합니다.<br />
2) 개인정보의 사용 : 당사는 당사 서비스 제공과 관련해서 수집된 회원의 신상정보를 본인의 승낙 없이 제3자에게 누설, 배포하지 않습니다. 단, 전기통신기본법 등 법률의 규정에 의해 국가기관의 요구가 있는 경우, 범죄에 대한 수사상의 목적이 있거나 정보통신윤리 위원회의 요청이 있는 경우 또는 기타 관계법령에서 정한 절차에 따른 요청이 있는 경우, 귀하가 당사에 제공한 개인정보를 스스로 공개한 경우에는 그러하지 않습니다<br />
3) 개인정보의 관리 : 귀하는 개인정보의 보호 및 관리를 위하여 서비스의 개인정보관리에서 수시로 귀하의 개인정보를 수정/삭제할 수 있습니다. 수신되는 정보 중 불필요하다고 생각되는 부분도 변경/조정할 수 있습니다.<br />
4) 개인정보의 보호 : 귀하의 개인정보는 오직 귀하만이 열람/수정/삭제 할 수 있으며, 이는 전적으로 귀하의 거북목동아리 ID와 비밀번호에 의해 관리되고 있습니다. 따라서 타인에게 본인의 거북목동아리 ID와 비밀번호를 알려주어서는 아니되며, 작업 종료 시에는 반드시 로그아웃 해 주시고, 웹 브라우저의 창을 닫아 주시기 바랍니다(이는 타인과 컴퓨터를 공유하는 인터넷 카페나 도서관 같은 공공장소에서 컴퓨터를 사용하는 경우에 귀하의 정보의 보호를 위하여 필요한 사항입니다).<br />
5) 기타 : 게시판이나, E-mail, 채팅 등 온라인상에서 귀하가 자발적으로 제공하는 개인정보는 다른 사람들이 수집하여 사용할 수 있음을 인지하시기 바랍니다. 공개적인 공간에 게재되는 개인정보로 인해 원하지 않는 상황이 발행할 수도 있습니다. 개인정보에 대한 비밀을 유지할 책임은 귀하에게 있으며, 당사는 개인정보 유출로 인해 발생한 결과에 대하여 어떤 책임도 부담하지 아니합니다.<br />
2. 회원이 당사에 본 약관에 따라 이용신청을 하는 것은 당사가 본 약관에 따라 신청서에 기재된 회원정보를 수집, 이용 및 제공하는 것에 동의하는 것으로 간주됩니다.<br />
제 7조 (사용자의 정보 보안)<br />
1. 가입 신청자가 당사 서비스 가입 절차를 완료하는 순간부터 귀하는 입력한 정보의 비밀을 유지할 책임이 있으며, 회원의 거북목 동아리 ID와 비밀번호를 사용하여 발생하는 모든 결과에 대한 책임은 회원 본인에게 있습니다.<br />
2. 소라네밥집 ID 와 비밀번호에 관한 모든 관리의 책임은 회원에게 있으며, 회원의 거북목동아리 ID나 비밀번호가 부정하게 사용되었다는 사실을 발견한 경우에는 즉시 당사에 신고하여야 합니다. 신고를 하지 않음으로 인한 모든 책임은 회원 본인에게 있습니다.<br />
3. 이용자는 당사 서비스의 사용 종료 시 마다 정확히 접속을 종료하도록 해야 하며, 정확히 종료하지 아니함으로써 제3자가 귀하에 관한 정보를 이용하게 되는 등의 결과로 인해 발생하는 손해 및 손실에 대하여 당사는 책임을 부담하지 아니합니다.<br />
제 8조 (서비스 이용시간)<br />
1. 서비스 이용시간은 당사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴, 1일 24시간을 원칙으로 합니다.<br />
2. 제1항의 이용시간은 정기점검 등의 필요로 인하여 당사가 정한 날 또는 시간은 예외로 합니다.<br />
제 9조 (서비스의 중지 및 정보의 저장과 사용)<br />
1. 귀하는 당사 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 국가의 비상사태, 정전, 당사의 관리범위 외의 서비스 설비 장애 및 기타 불가항력에 의하여 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 당사는 관련 책임을 부담하지 아니합니다.<br />
2. 당사가 정상적인 서비스 제공의 어려움으로 인하여 일시적으로 서비스를 중지하여야 할 경우에는 서비스 중지 1주일전의 고지 후 서비스를 중지할 수 있으며, 이 기간동안 귀하가 고지내용을 인지하지 못한데 대하여 당사는 책임을 부담하지 아니합니다. 부득이한 사정이 있을 경우 위 사전 고지기간은 감축되거나 생략될 수 있습니다. 또한 위 서비스 중지에 의하여 본 서비스에 보관되거나 전송된 메시지 및 기타 통신 메시지 등의 내용이 보관되지 못하였거나 삭제된 경우, 전송되지 못한 경우 및 기타 통신 데이터의 손실이 있을 경우에 대하여도 당사는 책임을 부담하지 아니합니다.<br />
3. 당사의 사정으로 서비스를 영구적으로 중단하여야 할 경우 전항에 의거합니다. 다만, 이 경우 사전 고지기간은 1개월로 합니다.<br />
4. 당사는 사전 고지 후 서비스를 일시적으로 수정, 변경 및 중단할 수 있으며, 이에 대하여 귀하 또는 제3자에게 어떠한 책임도 부담하지 아니합니다.<br />
5. 당사는 이용자가 본 약관의 내용에 위배되는 행동을 한 경우, 임의로 서비스 사용을 제한 및 중지 할 수 있습니다. 이 경우 당사는 위 이용자의 접속을 금지할 수 있으며, 위 이용자가 설정한 domain 명칭, 게시한 내용의 전부 또는 일부를 임의로 삭제할 수 있습니다.<br />
6. 장기간 휴면 회원인 경우 안내 메일 또는 공지사항 발표 후 1주일 간의 통지 기간을 거쳐 서비스 사용을 중지할 수 있습니다.<br />
7. 당사는 회원이 가입 시 설정하는 domain 명칭 기타 정보 (이하 'domain등')에 대한 심사 후 그 변경의 권유 및 삭제권한을 보유하게 됩니다.<br />
8. 당사는 가입자가 설정, 관리하는 'domain등'에 대하여 당해 'domain 등'의 이용율, 가입자의 본 서비스 이용 목적과 가입자가 설정, 관리하는 'domain등' 명칭의 적합성, 기타 제반 사유 등에 비추어 당해 'domain등'을 변경,삭제하여야 할 필요성이 있을 때에는 그 변경 또는 삭제를 가입자에게 1주일의 기간을 두어 권고하고, 그 기간 동안 가입자의 아무런 조치가 없을 경우 임의로 변경 또는 삭제 할 수 있습니다.<br />
제 10조 (서비스의 변경 및 해지)<br />
1. 당사는 귀하가 서비스를 이용하여 기대하는 손익이나 서비스를 통하여 얻은 자료로 인한 손해에 관하여 책임을 지지 않으며, 회원이 본 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 내용에 관하여는 책임을 지지 않습니다.<br />
2. 당사는 서비스 이용과 관련하여 가입자에게 발생한 손해 중 가입자의 고의, 과실에 의한 손해에 대하여 책임을 부담하지 아니합니다.<br />
제 11조 (정보 제공 및 광고의 게재)<br />
1. 당사는 서비스를 운영함에 있어서 각종 정보를 서비스에 게재하는 방법 등으로 회원에게 제공할 수 있습니다.<br />
2. 당사는 서비스에 적절하다고 판단되거나 활용 가능성 있는 광고를 게재할 수 있습니다<br />
제 12조 (당사에 제출된 게시물의 저작권)<br />
1. 귀하가 게시한 게시물의 내용에 대한 권리는 귀하에게 있습니다.<br />
2. 당사는 게시된 내용을 사전 통지 없이 편집, 이동 할 수 있는 권리를 보유하며, 다음의 경우 사전 통지 없이 삭제 할 수 있습니다.<br />
1) 본 서비스 약관에 위배되거나 상용 또는 불법, 음란, 저속하다고 판단되는 게시물을 게시한 경우<br />
2) 다른 회원 또는 제 3자를 비방하거나 중상 모략으로 명예를 손상시키는 내용인 경우<br />
3) 공공질서 및 미풍양속에 위반되는 내용인 경우<br />
4) 범죄적 행위에 결부된다고 인정되는 내용일 경우<br />
5) 제3자의 저작권 등 기타 권리를 침해하는 내용인 경우<br />
6) 탈퇴자가 게시한 게시물<br />
7) 기타 관계 법령에 위배되는 경우<br />
3. 귀하의 게시물이 타인의 저작권을 침해함으로써 발생하는 민, 형사상의 책임은 전적으로 귀하가 부담하여야 합니다.<br />
제 13조 (사용자의 행동규범 및 서비스 이용제한)<br />
1. 귀하가 제공하는 정보의 내용이 허위(차명, 비실명 등)인 것으로 판명되거나, 그러하다고 의심할 만한 합리적인 사유가 발생할 경우 당사는 귀하의 본 서비스 사용을 일부 또는 전부 중지할 수 있으며, 이로 인해 발생하는 불이익에 대해 책임을 부담하지 아니합니다.<br />
2. 귀하가 당사 서비스를 통하여 게시, 전송, 입수하였거나 전자메일 기타 다른 수단에 의하여 게시, 전송 또는 입수한 모든 형태의 정보에 대하여는 귀하가 모든 책임을 부담하며 당사는 어떠한 책임도 부담하지 아니합니다.<br />
3. 당사는 당사가 제공한 서비스가 아닌 가입자 또는 기타 제휴사가 제공하는 서비스의 내용상의 정확성, 완전성 및 질에 대하여 보장하지 않습니다. 따라서 당사는 귀하가 위 내용을 이용함으로 인하여 입게 된 모든 종류의 손실이나 손해에 대하여 책임을 부담하지 아니합니다.<br />
4. 귀하는 본 서비스를 통하여 다음과 같은 행동을 하지 않는데 동의합니다.<br />
1) 타인의 거북목동아리 ID와 비밀번호, 주민번호를 도용하는 행위<br />
2) 저속, 음란, 모욕적, 위협적이거나 타인의 프라이버시를 침해할 수 있는 내용을 전송, 게시, 게재, 전자 메일 또는 기타의 방법으로 전송하는 행위<br />
3) 서비스를 통하여 전송된 내용의 출처를 위장하는 행위<br />
4) 법률, 계약에 의하여 이용할 수 없는 내용을 게시, 게재, 전자메일 또는 기타 방법으로 전송하는 행위<br />
5) 타인의 특허, 상표, 영업비밀, 저작권, 기타 지적재산권을 침해하는 내용을 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위<br />
6) 당사의 승인을 받지 아니한 광고, 판촉물, 정크메일, 스팸, 행운의 편지, 피라미드 조직 기타 다른 형태의 권유를 게시, 게재, 전자메일 또는 기타의 방법으로 전송하는 행위.<br />
7) 다른 사용자의 개인정보를 수집 또는 저장하는 행위<br />
8) 실질적으로 사용하지 아니하는 domain 명칭의 등록행위, 이용하는 커뮤니티 및 기타 서비스의 본래 목적 또는 내용과 부합하지 아니하는 domain명칭의 등록행위, 서비스 이용을 주된 목적으로 하지 아니하는 일체의 행위.<br />
6. 당사는 회원이 본 약관을 위배했다고 판단되면 서비스와 관련된 모든 정보를 이용자의 동의 없이 삭제할 수 있습니다.<br />
제 3 장 의무 및 책임<br />
<br />
제 14조 (당사의 의무)<br />
1. 당사는 법령과 본 약관이 금지하거나 미풍양속에 반하는 행위를 하지않으며, 계속적, 안정적으로 서비스를 제공하기 위해 노력할 의무가 있습니다.<br />
2. 당사는 특별한 사정이 없는 한 이용자가 신청한 서비스 제공 개시일에 서비스를 이용할 수 있도록 합니다.<br />
3. 당사는 회원의 개인 신상 정보를 본인의 승낙 없이 타인에게 누설, 배포하여서는 아니 됩니다. 다만, 전기통신관련법령 등 관계법령에 의하여 관계 국가기관 등의 요구가 있는 경우에는 그러하지 아니합니다.<br />
4. 당사는 이용자가 안전하게 당사서비스를 이용할 수 있도록 이용자의 개인정보 (신용정보 포함) 보호를 위한 보안시스템을 갖추어야 합니다.<br />
5. 당사는 이용자의 귀책사유로 인한 서비스 이용 장애에 대하여 책임을 지지 않습니다.<br />
제 15조 (회원의 의무)<br />
1. 회원 가입 시에 요구되는 정보는 정확하게 기입하여야 합니다. 또한 이미 제공된 귀하에 대한 정보가 정확한 정보가 되도록 유지, 갱신하여야 하며, 회원은 자신의 거북목동아리 ID 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.<br />
2. 회원은 당사의 사전 승낙 없이 서비스를 이용하여 어떠한 영리행위도 할 수 없습니다.<br />
3. 회원은 당사 서비스를 이용하여 얻은 정보를 당사의 사전승낙 없이 복사, 복제, 변경, 번역, 출판,방송 기타의 방법으로 사용하거나 이를 타인에게 제공할 수 없습니다.<br />
4. 회원은 당사 서비스 이용과 관련하여 다음 각 호의 행위를 하여서는 안됩니다.<br />
1) 다른 회원의 거북목동아리 ID를 부정 사용하는 행위<br />
2) 범죄행위를 목적으로 하거나 기타 범죄행위와 관련된 행위<br />
3) 선량한 풍속, 기타 사회질서를 해하는 행위<br />
4) 타인의 명예를 훼손하거나 모욕하는 행위<br />
5) 타인의 지적재산권 등의 권리를 침해하는 행위<br />
6) 해킹 행위 또는 컴퓨터 바이러스의 유포행위<br />
7) 타인의 의사에 반하여 광고성 정보 등 일정한 내용을 지속적으로 전송하는 행위<br />
8) 서비스의 안전적인 운영에 지장을 주거나 줄 우려가 있는 일체의 행위<br />
9) 당사 사이트에 게시된 정보의 변경.<br />
10) 기타 전기통신법 제53조와 전기통신사업법 시행령 16조(불온통신), 통신사업법 제53조3항에 위배되는 행위<br />
제 4장 기 타<br />
<br />
제 16조 (당사의 소유권)<br />
1. 당사가 제공하는 서비스, 그에 필요한 소프트웨어, 이미지, 마크, 로고, 디자인, 서비스명칭, 정보 및 상표 등과 관련된 지적재산권 및 기타 권리는 당사에게 소유권이 있습니다.<br />
2. 귀하는 당사가 명시적으로 승인한 경우를 제외하고는 전항의 소정의 각 재산에 대한 전부 또는 일부의 수정, 대여, 대출, 판매, 배포, 제작, 양도, 재라이센스, 담보권 설정 행위, 상업적 이용 행위를 할 수 없으며, 제3자로 하여금 이와 같은 행위를 하도록 허락할 수 없습니다.<br />
제 17조 (양도금지)<br />
회원이 서비스의 이용권한, 기타 이용계약 상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.<br />
<br />
제 18조 (손해배상)<br />
당사는 무료로 제공되는 서비스와 관련하여 회원에게 어떠한 손해가 발생하더라도 당사가 고의로 행한 범죄행위를 제외하고 이에 대하여 책임을 부담하지 아니합니다.<br />
<br />
제 19조 (면책조항)<br />
1. 당사는 서비스에 표출된 어떠한 의견이나 정보에 대해 확신이나 대표할 의무가 없으며 회원이나 제3자에 의해 표출된 의견을 승인하거나 반대하거나 수정하지 않습니다. 당사는 어떠한 경우라도 회원이 서비스에 담긴 정보에 의존해 잃은 이득이나 입은 해에 대해 책임이 없습니다.<br />
2. 당사는 회원간 또는 회원과 제3자간에 서비스를 매개로 하여 물품거래 혹은 금전적 거래 등과 관련하여 어떠한 책임도 부담하지 아니하고, 회원이 서비스의 이용과 관련하여 기대하는 이익에 관하여 책임을 부담하지 않습니다.<br />
<br />
[부칙]<br />
이 약관은 2017년  08 월 08일부터 시행합니다.<br />
		</div>

		<div class="checkbox">
			<label> <input type="checkbox" name="checkBox1" id="checkBox1">
			<p class="checkboxFont">서비스 이용약관에 동의합니다.</p>
			</label>
		</div>
		<h4 class="formHead">개인정보 수집 및 이용동의 안내</h4>
		<div class="service">
			'거북목동아리'은 (이하 '회사'는) 고객님의 개인정보를 중요시하며, '정보통신망 이용촉진 및 정보보호'에 관한 법률을 준수하고 있습니다.회사는 개인정보취급방침을 통하여 고객님께서 제공하시는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며, 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려드립니다.회사는 개인정보취급방침을 개정하는 경우 웹사이트 공지사항(또는 개별공지)을 통하여 공지할 것입니다.<br />
<br />
ο 본 방침 시행일 : 2017 년 08 월 08 일<br />
ο 본 방침 개정일 : 2017 년 08 월 08 일<br />
■ 수집하는 개인정보 항목<br />
<br />
ο 수집항목<br />
1) 회원정보 : 이름 , 이메일 ,휴대폰 전화번호,주소정보<br />
2) 고객문의 : 이름, 이메일, 휴대전화번호,주소정보 (내용변경)<br />
3) 비회원 주문정보 : 이름 , 휴대폰 전화번호 , 주소정보<br />
■ 개인정보 수집방법<br />
<br />
ο 개인정보 수집방법 : 온라인/모바일 홈페이지 및 거북목동아리 앱<br />
<br />
■ 개인정보의 수집 및 이용목적<br />
<br />
회사는 수집한 개인정보를 다음의 목적을 위해 활용합니다..<br />
<br />
ο 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 콘텐츠 제공<br />
ο 회원 관리<br />
회원제 서비스 이용에 따른 본인확인, 불량회원의 부정 이용 방지와 비인가 사용 방지, 가입 의사 확인, 불만처리 등 민원처리, 고지사항 전달<br />
ο 마케팅 및 광고에 활용<br />
신규 서비스(제품) 개발 및 특화, 이벤트 등 광고성 정보 전달<br />
■ 개인정보의 제 3자 제공<br />
<br />
딜리버리 주문품의 배달서비스를 위해 가맹점주 및 배달대행 업체에게 개인정보 (배달주소지/연락처)가 제공될 수 있습니다.<br />
<br />
[개인정보를 제공받는자] 가맹점주/ 배달대행업체<br />
[개인정보 이용목적] 딜리버리 배달서비스<br />
[개인정보 제공항목] 연락처, 주소지<br />
■ 개인정보의 보유 및 파기<br />
<br />
이용자로부터 제공된 모든 정보는 보관 목적 또는 관련법의 준수 목적 이외의 용도로 사용되는 것이 금지되며, 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 해당 정보를 지체 없이 파기합니다.<br /> 
그러나, 이용자가 개인정보 파기를 요청하는 경우, 관련 법률이 그러한 정보를 보유할 것을 요구하는 일정 기간이 파기 요청 시점보다 뒤에 종료하는 경우가 아닌 한, 해당 요청이 접수된 즉시 이용자의 정보는 일체 파기되며 어떠한 보관 정보도 남지 않으며, 파기 절차 및 방법은 다음과 같습니다.<br />
<br />
가. 보유 및 이용기간<br />
1) 회원가입/등록/조회<br />
- 보유항목 : 이름, 생년월일, 성별, 이메일, 비밀번호, 배달 주소, 휴대전화번호 <br />
- 보유기간 : 온라인 홈페이지 및 모바일 홈페이지 탈퇴 시 24시간 이내 삭제<br />
- 보유이유 : 배달 정보 조회를 위한 정보 조회<br />
- 보유항목 : 접속 로그, 접속 IP 정보 (내용 변경)<br />
- 보유기간 : 3년<br />
- 보유이유 : 사용자의 서비스 이용 통계 수집<br />
2) 고객문의<br />
- 보유항목 : 이름, 이메일, 휴대전화번호<br />
- 보유기간 : 1년<br />
- 보유이유 : 사용자 문의/요청 관리, 사용자 식별 등<br />
- 보유항목 : 접속 로그, 접속 IP 정보<br />
- 보유기간 : 3년<br />
- 보유이유 : 사용자의 서비스 이용 통계 수집<br />
3) 개인 정보 취급 위탁에 대한 안내 (추가) 회사는 서비스 향상을 위해서 아래와 같이 개인정보를 위탁하고 있으며, 관계 법령에 따라 위탁계약 시 개인정보가 안전하게 관리될 수 있도록 필요한 사항을 규정하고 있습니다. 회사의 개인정보 위탁처리 기관 및 위탁업무 내용은 아래와 같습니다.<br />
수탁업체	위탁업무내용	개인정보의 보유 및 이용기간<br />
딜리버리 회원/주문정보 관리	위탁계약 종료시까지<br />
나. 파기절차<br />
회원님이 입력하신 정보는 목적이 달성된 후 별도의 DB로 옮겨져(종이의 경우 별도의 서류함) 내부 방침 및 기타 관련 법령에 의한 정보보호 사유에 따라(보유 및 이용기간 참조) 일정 기간 저장된 후 파기되어집니다. 별도 DB로 옮겨진 개인정보는 법률에 의한 경우가 아니고서는 보유 되어지는 이외의 다른 목적으로 이용되지 않습니다.<br />
<br />
다. 파기방법<br />
전자적 파일형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br />
<br />
쿠키(Cookie) (추가)<br />
- 회사는 웹사이트에서 고객의 정보를 수시로 저장하고 찾아내는 개인정보 자동수집 장치인 ‘쿠키(cookie)’ 등을 운용합니다. 쿠키란 회사 웹사이트를 운영하는데 이용되는 서버가 고객의 브라우저에 보내는 아주 작은 텍스트 파일로서 고객의 컴퓨터 하드디스크에 저장됩니다.<br />
- 고객은 쿠키 설치에 대한 선택권을 가지고 있습니다. 따라서 고객은 사용하는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.<br />
개인정보보호 관련 불만이나 질의 사항 문의<br />
- 회사는 고객의 개인정보를 보호하고 개인정보와 관련한 불만을 처리하기 위하여 아래와 같이 개인정보관리책임자를 지정하고 있습니다. 고객은 회사의 서비스를 이용하시며 발생하는 모든 개인정보보호 관련 민원을 개인정보관리책임자에게 신고하실 수 있습니다. 회사는 고객의 신고사항에 대해 신속하게 충분한 답변을 드릴 것입니다.<br />
- 전화번호: 010-0000-0000<br />
신고나 상담 기관<br />
기타 개인정보침해에 대한 신고나 상담이 필요하신 경우에는 아래 기관에 문의하시기 바랍니다.<br />
<br />
- 개인정보침해신고센터 (www.118.or.kr / 118)<br />
- 정보보호마크인증위원회 (www.eprivacy.or.kr / 02-580-0533~4)<br />
- 대검찰청 첨단범죄수사과 (www.spo.go.kr / 02-3480-2000)<br />
- 경찰청 사이버테러대응센터 (www.ctrc.go.kr / 02-392-0330)<br />
<br />
		</div>

		<div class="checkbox">
			<label> <input type="checkbox" name="checkBox2" id="checkBox2">
			<p class="checkboxFont">개인정보 취급방침에 동의합니다.</p>
			</label>
		</div>
		<h4 class="formHead">개인정보 취급 위탁 안내</h4>
		<div class="service">
			거북목동아리는 이용자들의 개인정보보호를 매우 중요시하며, 이용자가 회사의 서비스를 이용함과 동시에 온라인상에서 회사에 제공한 개인정보가 보호 받을 수 있도록 최선을 다하고 있습니다. 이에 거북목동아리는 통신비밀보호법, 전기통신사업법, 정보통신망 이용촉진 및 정보보호 등 에관한 법률 등 정보통신서비스제공자가 준수하여야 할 관련 법규상의 개인정보보호 규정 및 정보통신부가 제정한 개인정보보호지침을 준수하고 있습니다.<br /> 
<br />
거북목 동아리는 개인정보 취급방침을 통하여 이용자들이 제공하는 개인정보가 어떠한 용도와 방식으로 이용되고 있으며 개인정보보호를 위해 어떠한 조치가 취해지고 있는지 알려 드립니다. 거북목 동아리는 개인정보 취급방침을 홈페이지 첫 화면에 공개함으로써 이용자들이 언제나 용이하게 보실수 있도록 조치하고 있습니다.<br />
<br />
회사의 개인정보 취급방침은 정부의 법률 및 지침 변경이나 회사의 내부 방침 변경 등으로 인하여 수시로 변경될 수 있고, 이에 따른 개인정보 취급방침의 지속적인 개선을 위하여 필요한 절차를 정하고 있습니다. 그리고 개인정보 취급방침을 개정하는 경우나 개인정보 취급방침 변경될 경우 쇼핑몰의 첫 페이지의 개인정보취급방침을 통해 고지하고 있습니다. 이용자들께서는 사이트 방문 시 수시로 확인하시기 바랍니다.<br /> 
<br />
거북목 동아리의 개인정보 취급방침은 다음과 같은 내용을 담고 있습니다.<br />
o 1. 개인정보 수집에 대한 동의<br />
o 2. 개인정보의 수집목적 및 이용목적<br />
o 3. 수집하는 개인정보 항목 및 수집방법<br />
o 4. 수집하는 개인정보의 보유 및 이용기간<br />
o 5. 수집한 개인정보의 공유 및 제공<br />
o 6. 이용자 자신의 개인정보 관리(열람,정정,삭제 등)에 관한 사항<br />
o 7. 쿠키(cookie)의 운영에 관한 사항<br />
o 8. 비회원 고객의 개인정보 관리<br />
o 9. 개인정보의 위탁처리<br />
o 10. 개인정보관련 의견수렴 및 불만처리에 관한 사항<br />
o 11. 개인정보 관리책임자 및 담당자의 소속-성명 및 연락처<br />
o 12. 고지의 의무<br />
<br />
1. 개인정보 수집에 대한 동의<br />
거북목 동아리는 이용자들이 회사의 개인정보 취급방침 또는 이용약관의 내용에 대하여 「동의」버튼 또는「취소」버튼을 클릭할 수 있는 절차를 마련하여, 「동의」버튼을 클릭하면 개인정보 수집에 대해 동의한 것으로 봅니다.<br /> 
<br />
2. 개인정보의 수집목적 및 이용목적<br />
"개인정보"라 함은 생존하는 개인에 관한 정보로서 당해 정보에 포함되어 있는 성명 등의 사항에 의하여 당해 개인을 식별할 수 있는 정보(당해 정보만으로는 특정 개인을 식별할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수 있는 것을 포함)를 말합니다.<br />
대부분의 서비스는 별도의 사용자 등록이 없이 언제든지 사용할 수 있습니다. 그러나 거북목동아리는 회원서비스를 통하여 이용자들에게 맞춤식 서비스를 비롯한 보다 더 향상된 양질의 서비스를 제공하기 위하여 이용자 개인의 정보를 수집하고 있습니다. 거북목동아리는 이용자의 사전 동의 없이는 이용자의 개인 정보를 공개하지 않으며, 수집된 정보는 아래와 같이 이용하고 있습니다.<br />
o 첫째, 이용자들이 제공한 개인정보를 바탕으로 보다 더 유용한 서비스를 개발할 수 있습니다.<br />
거북목동아리는 신규 서비스개발이나 컨텐츠의 확충 시에 기존 이용자들이 회사에 제공한 개인정보를 바탕으로 개발해야 할 서비스의 우선 순위를 보다 더 효율적으로 정하고, 거북목동아리는 이용자들이 필요로 할 컨텐츠를 합리적으로 선택하여 제공할 수 있습니다.<br />
o 둘째, 수집하는 개인정보 항목과 수집 및 이용목적은 다음과 같습니다.<br />
1) 성명, 아이디, 비밀번호 : 회원제 서비스 이용에 따른 본인 확인 절차에 이용<br />
2) 이메일주소, 전화번호 : 고지사항 전달, 불만처리 등을 위한 원활한 의사소통 경로의 확보, 새로운 서비스 및 신상품이나 이벤트 정보 등의 안내<br />
3) 주소, 전화번호 : 청구서, 제품배송시 정확한 배송지의 확보<br />
4) 기타 선택항목 : 개인맞춤 서비스를 제공하기 위한 자료<br />
5) IP Address : 불량회원의 부정 이용 방지와 비인가 사용 방지<br />
<br />
3. 수집하는 개인정보 항목 및 수집방법<br />
거북목동아리는 이용자들이 회원서비스를 이용하기 위해 회원으로 가입하실 때 서비스 제공을 위한 필수적인 정보들을 온라인상에서 입력 받고 있습니다. 회원 가입 시에 받는 필수적인 정보는 이름, 이메일 주소 휴대폰 번호를 입력 받고 있습니다.<br />
또한 소네네밥집 이나 이벤트 행사 시 통계분석이나 경품제공 등을 위해 선별적으로 개인정보 입력을 요청할 수 있습니다.<br />
그러나, 이용자의 기본적 인권 침해의 우려가 있는 민감한 개인정보(인종 및 민족, 사상 및 신조, 출신지 및 본적지, 정치적 성향 및 범죄기록, 건강상태 및 성생활 등)는 수집하지 않으며 부득이하게 수집해야 할 경우 이용자들의 사전동의를 반드시 구할 것입니다. 그리고, 어떤 경우에라도 입력하신 정보를 이용자들에게 사전에 밝힌 목적 이외에 다른 목적으로는 사용하지 않으며 외부로 유출하지 않습니다.<br />
<br />
4. 수집하는 개인정보의 보유 및 이용기간<br />
이용자가 거북목동아리 회원으로서 회사에 제공하는 서비스를 이용하는 동안 케이에프씨코리아 주식회사는 이용자들의 개인정보를 계속적으로 보유하며 서비스 제공 등을 위해 이용합니다. 다만, 아래의 "6. 이용자 자신의 개인정보관리(열람,정정,삭제 등)에 관한 사항" 에서 설명한 절차와 방법에 따라 회원 본인이 직접 삭제하거나 수정한 정보, 가입해지를 요청한 경우에는 재생할 수 없는 방법에 의하여 디스크에서 완전히 삭제하며 추후 열람이나 이용이 불가능한 상태로 처리됩니다.<br />
그리고 "3. 수집하는 개인정보 항목 및 수집방법"에서와 같이 일시적인 목적 (설문조사, 이벤트, 본인확인 등)으로 입력 받은 개인정보는 그 목적이 달성된 이후에는 동일한 방법으로 사후 재생이 불가능한 상태로 처리됩니다.<br />
귀하의 개인정보는 다음과 같이 개인정보의 수집목적 또는 제공받은 목적이 달성되면 파기하는 것을 원칙으로 합니다.<br />
그리고 상법, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계법령의 규정에 의하여 보존할 필요가 있는 경우 케이에프씨코리아 주식회사는 관계법령에서 정한 일정한 기간 동안 회원정보를 보관합니다. 이 경우 거북목동아리는 보관하는 정보를 그 보관의 목적으로만 이용하며 보존기간은 아래와 같습니다.<br />
o 계약 또는 청약철회 등에 관한 기록 : 5년<br />
o 대금결제 및 재화 등의 공급에 관한 기록 : 5년<br />
o 소비자의 불만 또는 분쟁처리에 관한 기록 : 3년<br />
거북목 동아리는 귀중한 회원의 개인정보를 안전하게 처리하며, 유출의 방지를 위하여 다음과 같은 방법을 통하여 개인정보를 파기합니다.<br />
o 종이에 출력된 개인정보는 분쇄기로 분쇄하거나 소각을 통하여 파기합니다.<br />
o 전자적 파일 형태로 저장된 개인정보는 기록을 재생할 수 없는 기술적 방법을 사용하여 삭제합니다.<br />
<br />
5. 수집한 개인정보의 공유 및 제공<br />
거북목 동아리는 이용자들의 개인정보를 "2. 개인정보의 수집목적 및 이용목적"에서 고지한 범위 내에서 사용하며, 이용자의 사전 동의 없이는 동 범위를 초과하여 이용하거나 원칙적으로 이용자의 개인정보를 외부에 공개하지 않습니다. 다만, 아래의 경우에는 예외로 합니다.<br />
o 이용자들이 사전에 공개에 동의한 경우<br />
o 서비스 제공에 따른 요금정산을 위하여 필요한 경우<br />
o 홈페이지에 게시한 서비스 이용 약관 및 기타 회원 서비스 등의 이용약관 또는 운영원칙을 위반한 경우<br />
o 자사 서비스를 이용하여 타인에게 정신적, 물질적 피해를 줌으로써 그에 대한 법적인 조치를 취하기 위하여 개인정보를 공개해야 한다고 판단되는 충분한 근거가 있는 경우<br />
o 기타 법에 의해 요구된다고 선의로 판단되는 경우 (ex. 관련법에 의거 적법한 절차에 의한 정부/수사기관의 요청이 있는 경우 등)<br />
o 통계작성, 학술연구나 시장조사를 위하여 특정개인을 식별할 수 없는 형태로 광고주, 협력업체나 연구단체 등에 제공하는 경우<br />
o 이용자의 서비스 이용에 따른 불만사항 및 문의사항(민원사항)의 처리를 위하여 고객센터를 위탁하는 경우<br />
o 고객센터를 운영하는 전문업체에 해당 민원사항의 처리에 필요한 개인 정보를 제공하는 경우<br />
<br />
6. 이용자 자신의 개인정보 관리(열람,정정,삭제 등)에 관한 사항<br />
o 회원님이 원하실 경우 언제라도 당사에서 개인정보를 열람하실 수 있으며 보관된 필수 정보를 수정하실 수 있습니다.<br />
o 또한 회원 가입 시 요구된 필수 정보 외의 추가 정보는 언제나 열람, 수정, 삭제할 수 있습니다.<br />
o 회원님의 개인정보 변경 및 회원탈퇴는 당사의 마이페이지 에서 로그인(Login) 후 이용하실 수 있습니다.<br />
<br />
7. 쿠키(cookie)의 운영에 관한 사항<br />
당사는 회원인증을 위하여 Cookie 방식을 이용하고 있습니다. 이는 로그아웃(Logout)시 자동으로 컴퓨터에 저장되지 않고 삭제되도록 되어 있으므로 공공장소나 타인이 사용할 수 있는 컴퓨터를 사용 하 실 경우에는 로그인(Login)후 서비스 이용이 끝나시면 반드시 로그아웃(Logout)해 주시기 바랍니다.<br />
o 쿠키 설정 거부 방법<br />
쿠키 설정을 거부하는 방법으로는 회원님이 사용하시는 웹 브라우저의 옵션을 선택함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다.<br />
1) 설정방법 예(인터넷 익스플로어의 경우) : 웹 브라우저 상단의 도구 > 인터넷 옵션 > 개인정보<br />
2) 단, 귀하께서 쿠키 설치를 거부하였을 경우 서비스 제공에 어려움이 있을 수 있습니다.<br /> 
<br />
8. 비회원고객의 개인정보관리<br />
o 당사는 비회원 고객 또한 물품 및 서비스 상품의 구매를 하실 수 있습니다. 당사는 비회원 주문의 경우 배송 및 대금 결제, 상품 배송에 반드시 필요한 개인정보만을 고객님께 요청하고 있습니다.<br />
o 당사에서 비회원으로 구입을 하신 경우 비회원 고객께서 입력하신 지불인 정보 및 수령인 정보는 대금 결제 및 상품 배송에 관련한 용도 외에는 다른 어떠한 용도로도 사용되지 않습니다.<br /> 
<br />
9. 개인정보의 위탁처리<br />
거북목 동아리 (는) 서비스 향상을 위해서 귀하의 개인정보를 필요한 경우 동의 등 법률상의 요건을 구비하여 외부에 수집 · 취급 · 관리 등을 위탁하여 처리할 있으며, 제 3자에게 제공할 수 있습니다.<br /> 
<br />
o 다만, 아래의 경우에는 예외로 합니다.<br />
1) 이용자들이 사전에 동의한 경우<br />
2) 법령의 규정에 의거하거나, 수사 목적으로 법령에 정해진 절차와 방법에 따라 수사기관의 요구가 있는 경우<br />
o 개인정보의 처리를 위탁하거나 제공하는 경우에는 수탁자, 수탁범위, 공유 정보의 범위 등에 관한 사항을 서면, 전자우편, 전화 또는 홈페이지를 통해 미리 귀하에게 고지합니다.<br /> 
<br />
10. 개인정보관련 의견수렴 및 불만처리에 관한 사항<br />
당사는 개인정보보호와 관련하여 이용자 여러분들의 의견을 수렴하고 있으며 불만을 처리하기 위하여 모든 절차와 방법을 마련하고 있습니다. 이용자들은 하단에 명시한 "11. 개인정보관리책임자 및 담당자의 소속-성명 및 연락처"항을 참고하여 전화나 메일을 통하여 불만사항을 신고할 수 있고, 거북목 동아리는 이용자들의 신고사항에 대하여 신속하고도 충분한 답변을 해 드릴 것 입니다.<br /> 
<br />
11. 개인정보 관리책임자 및 담당자의 소속-성명 및 연락처<br />
당사는 귀하가 좋은 정보를 안전하게 이용할 수 있도록 최선을 다하고 있습니다. 개인정보를 보호하는데 있어 귀하께 고지한 사항들에 반하는 사고가 발생할 경우 개인정보관리책임자가 책임을 집니다.<br />
o 이용자 개인정보와 관련한 아이디(ID)의 비밀번호에 대한 보안유지책임은 해당 이용자 자신에게 있습니다.<br />
o 거북목 동아리는 비밀번호에 대해 어떠한 방법으로도 이용자에게 직접적으로 질문하는 경우는 없으므로 타인에게 비밀번호가 유출되지 않도록 각별히 주의하시기 바랍니다.<br />
o 특히 공공장소에서 온라인상에서 접속해 있을 경우에는 더욱 유의하셔야 합니다.<br />
o 거북목 동아리는 개인정보에 대한 의견수렴 및 불만처리를 담당하는 개인정보 관리책임자 및 담당자를 지정하고 있고, 연락처는 아래와 같습니다.<br />
<br />
<br />
12. 고지의 의무<br />
현 개인정보취급방침의 내용은 정부의 정책 또는 보안기술의 변경에 따라 내용의 추가 삭제 및 수정이 있을 시에는 홈페이지의 '커뮤니티'을 통해 고지할 것입니다.<br /> 
<br />
부칙<br />
본 개인정보 취급방침은 2017년 08월 08일부터 시행합니다.<br />
종전의 개인정보취급방침은 본 개인정보취급방침으로 대체합니다<br />
<br />
		</div>

		<div class="checkbox">
			<label> <input type="checkbox" name="checkBox3" id="checkBox3">
			<p class="checkboxFont">개인정보 취급 위탁에 대해 동의합니다.</p>
			</label>
		</div>
		<button type="button" class="detailCart" onclick="doCancel();">취소</button>
		<button type="submit" class="detailSubmit">회원가입</button>
	</form>

	<br>
	
	<div align="center">
	<%@include file="/include/footer.jsp"%>
	</div>
</body>
</html>
