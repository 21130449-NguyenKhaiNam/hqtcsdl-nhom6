package control;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "access", urlPatterns = { "/access" })
public class access extends HttpServlet {

	/**
	 * 
	 */
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
            if(signin(req.getParameter("tel"), req.getParameter("pass"))) {
            	
            } else {
            	
            }
            break;
        case "sign-up":
            signup(req, resp);
            break;
        case "logout":
            logout(req, resp);
            break;
        case "forgot":
            forgotPw(req, resp);
            break;
        case "verify":
            verify(req, resp);
            break;
        case "reset-password":
            resetPwd(req, resp);
            break;
    }
	}



	private boolean signin(String parameter, String parameter2) {
		// TODO Auto-generated method stub
		
		return false;
	}

}
