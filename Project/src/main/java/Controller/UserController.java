package Controller;

import Model.Account;
import Model.User;
import database.DAO_User;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet("/user-controller")
public class UserController extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doGet(req, resp);
        String action = req.getParameter("action");
        switch (action) {
            case "sign-in":
                signin(req, resp);
                break;
            case "sign-up":
                signup(req, resp);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doGet(req, resp);
    }

    private void signin(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        //get username, password from FE
        String email = req.getParameter("email"), password = req.getParameter("password");
        //find in DB
        User user = new User();
        user.setEmail(email);
        user.setPassword(password);
        user = DAO_User.getDao_User().selectByEnP(user);

        String url = "";
        if (user == null) {
            req.setAttribute("err_sign_in", "Email or Password is incorrect!");
            url = "/User/signin.jsp";
        } else {
            HttpSession session = req.getSession();
            session.setAttribute("User", user);
            url = "/index.jsp";
        }

        RequestDispatcher rd = req.getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    private void signup(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email;
    }
}
