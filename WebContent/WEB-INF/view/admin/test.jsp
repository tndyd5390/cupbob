<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<script src="//code.jquery.com/jquery.min.js"></script>

<script>
	$(function() {
		$('#test').bind("click", function() {
			$.ajax({
				url : "commJson.do",
				method : "post",
				type : "json",
				data : "json",
				success : function(data) {
					var contents = "";
					//	var content = "";
					$.each(data, function(key, value) {
						//			content +="<p>"+ key.user_no+ "</p>"
						//		contents += "<p>" + data.user_no +"</p>";
						//		contents += "<p>" + data.email +"</p>";
						//		contents += "<p>" + data.user_name +"</p>";
						contents += "<p>" + value.user_name + "</p>";

						$('#wewe').html(contents);
					})
				}
			})
		})

	});
</script>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>소라네 컵밥</title>
</head>
<body>
	<h2>commTest</h2>

	<input type="button" id="test" value="테스트">

	<input type="text" id="json1" value="">
	<div id="wewe"></div>
				<div class="act-time">
					<div class="activity-body act-in">
						<div class="text">
							<p class="attribution">
								<a href="#">최한용</a> at 4:25pm, 30th Octmber 2014
							</p>
							<textarea class="form-control " id="ccomment" name="comment"
								rows="4"></textarea>
							<br>
							<button class="btn btn-primary btn-sm" id="cmtCreate">등록</button>
						</div>
					</div>
				</div>

</body>
</html>