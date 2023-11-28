package control;

import java.io.IOException;
import java.sql.Connection;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import database.ConnectDatabase;

@WebServlet("/access")
public class Access extends HttpServlet {
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String action = req.getParameter("action");
		switch (action) {
		case "sign-in":
			if (signin(req.getParameter("tel"), req.getParameter("pass"))) {
				HttpSession session = req.getSession();

			} else {
				req.setAttribute("status", "failed-0");
				resp.sendRedirect("hmtl/login.jsp");
			}
			break;
		case "register":
			String name = req.getParameter("name");
			String tel = req.getParameter("tel");
			String pass = req.getParameter("pass");
			String rePass = req.getParameter("rePass");

			if (register(name, tel, pass, rePass)) {

			} else {
				req.setAttribute("status", "failed-0");
				resp.sendRedirect("hmtl/login.jsp");
			}
			break;
		case "logout":
//            logout(req, resp);
			break;
		default:
			break;
		}

	}

	// Xử lý đăng ký
	private boolean register(String name, String tel, String pass, String rePass) {
		// TODO Auto-generated method stub
		return isNotNull(name, tel, pass, rePass) && pass.equals(rePass) && isPhone(tel);
	}

	// Kiểm tra các thông tin đăng nhập
	private boolean signin(String tel, String pass) {
		// TODO Auto-generated method stub
		return isNotNull(tel, pass) && isPhone(tel);
	}

	// Kiểm tra trường thông tin
	private boolean isNotNull(String... sts) {
		for (String s : sts)
			if (s == null && s.isBlank())
				return false;
		return true;
	}

	// Kiểm tra có là số điện thoại
	private boolean isPhone(String phone) {
		return Pattern.compile("^\\d{10}$").matcher(phone).matches();
	}
}
