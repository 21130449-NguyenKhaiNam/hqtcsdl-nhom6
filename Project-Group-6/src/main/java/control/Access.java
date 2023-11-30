package control;

import java.io.IOException;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AccountDao;
import model.Account;

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
		case "sign-in": {
			String tel = req.getParameter("tel");
			String pass = req.getParameter("pass");
			if (signin(tel, pass)) {
				Account ac = AccountDao.getAccount(tel, pass);
				if (ac == null) {
					req.setAttribute("status", "failed");
					resp.sendRedirect("hmtl/login.jsp");
				} else {
					HttpSession session = req.getSession();
					session.setAttribute("account", ac);
					resp.sendRedirect("hmtl/productDetail.jsp");
				}
			} else {
				req.setAttribute("status", "failed-0");
				resp.sendRedirect("hmtl/login.jsp");
			}
			break;
		}
		case "register": {
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
		}
		case "logout":
//            logout(req, resp);
			break;
		default:
			break;
		}

	}

	// Xử lý đăng ký
	private boolean register(String name, String tel, String pass, String rePass) {
		return isNotNull(name, tel, pass, rePass) && pass.equals(rePass) && isPhone(tel);
	}

	// Kiểm tra các thông tin đăng nhập
	private boolean signin(String tel, String pass) {
		return isNotNull(tel, pass) && isPhone(tel);
	}

	// Kiểm tra trường thông tin
	@SuppressWarnings("null")
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
