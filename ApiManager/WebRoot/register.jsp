<%@ page language="java" import="java.util.*" pageEncoding="gb2312"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>Bootstrap��һ��ʵ��</title>
<meta http-equiv="content-type" content="text/html;charset=gb2312">
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link rel="stylesheet" type="text/css" href="assets/css/styles.css">
<script type="text/javascript">
           function reg(form){
               if(form.username.value == ""){
                   alert("�û�����Ϊ�գ�");
                   return false;
               }
               if(form.password.value == ""){
                   alert("���벻��Ϊ�գ�");
                   return false;
               }
               if(form.repassword.value == ""){
                   alert("ȷ�����벻��Ϊ�գ�");
                   return false;
               }
               if(form.password.value != form.repassword.value){
                   alert("�����������벻һ�£�");
                   return false;
               }
               if(form.tel.value == ""){
                   alert("��ϵ�绰����Ϊ�գ�");
                   return false;
               }
               if(form.email.value == ""){
                   alert("�������䲻��Ϊ�գ�");
                   return false;
               }
               if(form.email.value.match("^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$")==null){
                   alert("�����ַ ����ȷ ");
                   return false;
               }
           }
           
           function change(){
				var photo = document.getElementById("photo");
				var photoImg = document.getElementById("photoImg");
				photoImg.src = photo.value;
	    	}
</script>
</head>
<body>
	<form action="RegServlet" method="post" onsubmit="return reg(this);">
		<table align="center" width="450" border="0">
			<tr>
				<td align="right">�û�����</td>
				<td><input type="text" name="username" />
				</td>
			</tr>
			<tr>
				<td align="right">�� �룺</td>
				<td><input type="password" name="password" />
				</td>
			</tr>
			<tr>
				<td align="right">ȷ�����룺</td>
				<td><input type="password" name="repassword" />
				</td>
			</tr>
			<tr>
				<td align="right">�� ��</td>
				<td><input type="radio" name="sex" value="��" checked="checked">��</input>
					<input type="radio" name="sex" value="Ů">Ů</input>
				</td>
			</tr>
			<tr>
				<td align="right">ͷ ��</td>
				<td><select name="photo" id="photo" onchange="change();">
						<option value="assets/images/boy.png" selected="selected">ͷ��boy</option>
						<option value="assets/images/girl.png">ͷ��girl</option>
				</select> <img id="photoImg" src="assets/images/boy.png"></td>
			</tr>
			<tr>
				<td align="right">��ϵ�绰��</td>
				<td><input type="text" name="tel" />
				</td>
			</tr>
			<tr>
				<td align="right">�������䣺</td>
				<td><input type="text" name="email" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="ע ��">
					<input type="reset" value="�� ��">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>