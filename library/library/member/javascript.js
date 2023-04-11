function inputCheck() {
	if (document.regFrm.id.value == "") {
		alert("아이디를 입력해주세요");
		document.regFrm.id.focus();
		return;
	}
	if (document.regFrm.pw.value == "") {
		alert("비밀번호를 입력해주세요");
		document.regFrm.pw.focus();
		return;
	}
	if (document.regFrm.repw.value == "") {
		alert("비밀번호를 확인해주세요");
		document.regFrm.repw.focus();
		return;
	}
	
	if(document.regFrm.pw.value != document.regFrm.repw.value) {
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repw.value = "";
		document.regFrm.repw.focus();
		return;
	}
	if (document.regFrm.name.value == "") {
		alert("이름을 입력해주세요");
		document.regFrm.namep.focus();
		return;
	}
	if (document.regFrm.tel.value == "") {
		alert("전화번호를 입력해주세요");
		document.regFrm.tel.focus();
		return;
	}
	
	var str = document.regFrm.mail.value;
	var atPos = str.indexOf('@');
	var atLastPos = str.lastIndexOf('@');
	var dotPos = str.indexOf('.');
	var spacePos = str.indexOf(' ');
	var commaPos = str.indexOf(',');
	var mailSize = str.length;
	if (atPos > 1 && atPos == atLastPos && dotPos > 3 && spacePos == -1 
		&& commaPos == -1 && atPos + 1 < dotPos && dotPos + 1 < mailSize);
	else {
		alert('E-mail주소 형식이 잘못되었습니다\n\r 다시 입력해주세요!');
		document.regFrm.mail.focus();
		return;
	}
	document.regFrm.submit();
}

function win_close() {
	self.close();
}

function PostCheck() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                addr += (extraAddr !== '' ? '(' + extraAddr + ')' : '');
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById("zip").value = data.zonecode;
            document.getElementById("post").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("post2").focus();
        }
    }).open();
}