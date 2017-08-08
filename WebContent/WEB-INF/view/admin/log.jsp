<%@ page import="java.io.*"%>
<%@ page import="java.net.URLEncoder"%>
<%@ page import="java.util.*"%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
	pageEncoding="UTF-8"%>

<%
	String fileDir = "/www/cupbobs_com/tomcat/logs"; //파일을 보여줄 디렉토리

	File f = new File(fileDir);
	File[] files = f.listFiles(); //파일의 리스트를 대입
	Arrays.sort(files);
%>

<html>
<head>
    <script src="//code.jquery.com/jquery-1.11.2.min.js"></script>
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
        }
        #header {
            position: fixed;
            top: 0;
            left: 50px;
            width: 100%;
            height: 10%;
        }
        #console {
            position: fixed;
            bottom: 0;
            width: 100%;
            height: 90%;
            background-color: black;
            color:white;
            font-size: 15px;
        }
        #runningFlag {
            color: red;
        }
    </style>
        <script type="text/javascript">
        var fileName;
        var consoleLog;
        var runningFlag;


        $(document).ready(function() {
            consoleLog = $('#console');
            runningFlag = $('#runningFlag');
		
            function startTail() {
                runningFlag.html('Running');
                fileName = $('#fileName').val();
                function requestLog() {
                        $.ajax({
                            type : 'POST',
                            url : 'logAjax.do',   // #### Caution: The name of the source file
                            dataType : 'json',
                            data : {
                                'log_filename' : fileName,
                            },
                            success : function(data) {
                            	$.each(data,function(key,value){
                                    consoleLog.val(consoleLog.val() + value.log +"\n");
                            	})
				consoleLog.val(consoleLog.val()+"----여기까지 보셨습니다----"+"\n");
                                consoleLog.scrollTop(consoleLog.prop('scrollHeight'));
                            },
            				error:function(x,e){
            					if(x.status==0){
            			            alert('네트워크가 정상적으로 동작하지 않습니다.');
            			            alert('네트워크 상태를 확인 하거나 업체에게 문의해 주세요.')
            			            }else if(x.status==404){
            			            alert('페이지를 찾을수가 없습니다.');
            			            }else if(x.status==500){
            			            alert('서버에서 오류가 발생했습니다.');
            			            }else if(e=='parsererror'){
            			            alert('json파싱에 실패했습니다.');
            			            }else if(e=='timeout'){
            			            alert('응답 요청 시간이 지났습니다.');
            			            }else {
            			            alert('Unknow Error.n'+x.responseText);
            			            }
            			    }

                        });
                    }
                requestLog();
            }
            $('#startTail').on('click', function() { startTail();});
            $('#fileName').change(function() {
                runningFlag.html('Stop');
            });
	$('#clear').on('click', function(){
		consoleLog.val("");
		runningFlag.html("Stop");
		
	});	
        });


    </script>
    

</head>
<body>
	<div id="header">
		<h2>Log Tail</h2>
		tail -f <select id="fileName">
			<%
				for (File file : files) {
			%>
			<option value="<%=file.getName()%>"><%=file.getName()%></option>
			<%
				}
			%>
		</select> <br /> <input id="startTail" type="button" value="startTail" /> <input id="clear" type="button" value="clear">&nbsp;&nbsp;&nbsp;
		<span id="runningFlag">Stop</span><br />
	</div>
	
	<textarea id="console"></textarea>
</body>
</html>
