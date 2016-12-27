package com.uptolearn.apimanager.service;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.uptolearn.apimanager.dao.UserDao;
import com.uptolearn.apimanager.model.User;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
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
		
		request.setCharacterEncoding("GB2312");
		// 获取用户名
		String username = request.getParameter("username");
		// 获取密码
		String password = request.getParameter("password");
		// 实例化UserDao对象
		System.out.println("======================"+username);
		UserDao userDao = new UserDao();	
		// 根据用户密码查询用户
		User user = userDao.login(username, password);
		// 判断user是否为空
		if(user != null){
			// 将用户对象放入session中
			request.getSession().setAttribute("user", user);
			// 转发到result.jsp页面
			request.getRequestDispatcher("message.jsp").forward(request, response);
		}else{
			// 登录失败
			request.setAttribute("info", "错误：用户名或密码错误！");
			request.getRequestDispatcher("message.jsp").forward(request, response);
		}
	}

}
