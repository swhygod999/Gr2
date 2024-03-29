﻿<html>
<head>
<meta http-equiv="Content-Type" content="text/html" />
<meta charset="UTF-8" />
<title>雲元件-圖形驗證碼</title>
<style type="text/css">
table.table_b {
	border-color: #DADADA;
	border-style: solid;
	border-width: 1px 0 0 1px;
	color: #385B6B;
	margin: 0 0 15px;
	width: 100%;
}

table.table_b th {
	background: none repeat scroll 0 0 #EDF2F1;
	color: #385B6B;
	font-weight: bold;
	text-align: center;
}

table.table_b td,table.table_b th {
	border-color: #DADADA;
	border-style: solid;
	border-width: 0 1px 1px 0;
	padding: 5px;
}

body,input,textarea {
	font-family: "微軟正黑體", "HelveticaNeue-Regular", "Helvetica Neue Regular",
		"Helvetica Neue", Arial, sans-serif;
	font-weight: 400;
	vertical-align: baseline;
	padding: 0;
	margin: 0;
}
</style>
<script src="scripts/jquery-1.10.1.min.js"></script>
</head>
<body>
	<div align="center">
		<table>
			<tr>
				<td 
					style="background-color: red; color: #FFFFFF; font-family: 微軟正黑體; font-size: 200%;"
					height="50">雲元件-圖形驗證碼</td>
			</tr>
			<tr>
				<td valign="top"><br />
					<table class="table_b">
						<form method="POST" action="#">
							
							
							<tr>
								<td>圖片驗證碼：</td>
								<td><img id="image_container" src="simpleCaptcha.png" /><br>
									請輸入六位驗證碼：<input type="text" id="answer" value="" maxlength="6" />
									<br>
									<input type="button" value="重新產生驗證碼" onclick="reloadImage();" /></td>
							</tr>
							<tr>
								<td colspan="2"><input type="button" value="提交驗證" onclick="submitMessage();"/></td>
							</tr>
						</form>
					</table></td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		$(document).ready(function() {
			initialize();
			//reloadImage();
		});

		function reloadImage() {
			var url = 'simpleCaptcha.png';
			$("#image_container").attr("src", url + "?cache=" + Math.random());
			$("#answer").val("");
		}

		function submitMessage() {
			$.ajax({
				type : "POST",
				url : "captchasubmit.jsp",
				dataType : "json",
				data : {
					tel : $("#tel").val(),
					msgtxt : $("#msgtxt").val(),
					answer : $("#answer").val()
				},
				success : onSubmitMessageSuccess
			});
		}

		function onSubmitMessageSuccess(data, status, jqXHR) {
			if (data.status == "100") {
				alert('驗證碼 驗證成功!');
			}
			else {
				alert('驗證碼輸入錯誤，敬請重新輸入!');
			}
			reloadImage();
		}
	</script>
</body>
</html>
