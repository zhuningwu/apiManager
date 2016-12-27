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

<title>Bootstrap第一个实例</title>
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
                   alert("用户不能为空！");
                   return false;
               }
               if(form.password.value == ""){
                   alert("密码不能为空！");
                   return false;
               }
               if(form.repassword.value == ""){
                   alert("确认密码不能为空！");
                   return false;
               }
               if(form.password.value != form.repassword.value){
                   alert("两次密码输入不一致！");
                   return false;
               }
               if(form.tel.value == ""){
                   alert("联系电话不能为空！");
                   return false;
               }
               if(form.email.value == ""){
                   alert("电子邮箱不能为空！");
                   return false;
               }
               if(form.email.value.match("^\\s*\\w+(?:\\.{0,1}[\\w-]+)*@[a-zA-Z0-9]+(?:[-.][a-zA-Z0-9]+)*\\.[a-zA-Z]+\\s*$")==null){
                   alert("邮箱地址 不正确 ");
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
				<td align="right">用户名：</td>
				<td><input type="text" name="username" />
				</td>
			</tr>
			<tr>
				<td align="right">密 码：</td>
				<td><input type="password" name="password" />
				</td>
			</tr>
			<tr>
				<td align="right">确认密码：</td>
				<td><input type="password" name="repassword" />
				</td>
			</tr>
			<tr>
				<td align="right">性 别：</td>
				<td><input type="radio" name="sex" value="男" checked="checked">男</input>
					<input type="radio" name="sex" value="女">女</input>
				</td>
			</tr>
			<tr>
				<td align="right">头 像：</td>
				<td><select name="photo" id="photo" onchange="change();">
						<option value="assets/images/boy.png" selected="selected">头像boy</option>
						<option value="assets/images/girl.png">头像girl</option>
				</select> <img id="photoImg" src="assets/images/boy.png"></td>
			</tr>
			<tr>
				<td align="right">联系电话：</td>
				<td><input type="text" name="tel" />
				</td>
			</tr>
			<tr>
				<td align="right">电子邮箱：</td>
				<td><input type="text" name="email" />
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center"><input type="submit" value="注 册">
					<input type="reset" value="重 置">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>