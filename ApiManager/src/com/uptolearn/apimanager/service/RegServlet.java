package com.uptolearn.apimanager.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uptolearn.apimanager.dao.UserDao;
import com.uptolearn.apimanager.model.User;

/**
 * Servlet implementation class regServlet
 */
public class RegServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RegServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=GB2312");
		request.setCharacterEncoding("GB2312");

		// 获取用户名
		String username = request.getParameter("username");
		// 获取密码
		String password = request.getParameter("password");
		// 获取性别
		String sex = request.getParameter("sex");
		// 获取头像
		String photo = request.getParameter("photo");
		// 获取联系电话
		String tel = request.getParameter("tel");
		// 获取电子邮箱
		String email = request.getParameter("email");
		// 实例化UserDao对象
		 
		UserDao userDao = new UserDao();
		if(username != null && !username.isEmpty()){
			if(userDao.userIsExist(username)){
				// 实例化一个User对象
				User user = new User();		
				// 对用户对象中的属性赋值
				user.setUsername(username);	
				user.setPassword(password);
				user.setSex(sex);
				user.setPhoto(photo);
				user.setTel(tel);
				user.setEmail(email);
				// 保存用户注册信息
				if(!userDao.saveUser(user)){
					request.setAttribute("info", "sorry，系统错误！<br>");
				}
				else{
					request.setAttribute("info", "恭喜，注册成功！<br>");
				}
			}else{
				request.setAttribute("info", "错误：此用户名已存在！");
			}
		}
		// 转发到message.jsp页面
		request.getRequestDispatcher("message.jsp").forward(request, response);
	}

}
