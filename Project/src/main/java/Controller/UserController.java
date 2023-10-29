package Controller;

import Model.Account;
import Model.User;
import Utils.Encryption;
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
        user.setPassword(Encryption.encrypt(password));
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

    /**
     * Are Email n Passwd already exists?
     * <ul>
     *     <li><b>False</b> if it's exits</li>
     *     <li><b>True</b> if not</li>
     * </ul>
     * <b>Why return false if it's exists?</b></br>
     * Cause if an Account exist, we will return FALSE n forwards request to SIGN IN, else we need create Account n send verify email
     *
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    private void signup(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String url;

        User user = new User();
        user.setEmail(req.getParameter("email"));
        user.setPassword(Encryption.encrypt(req.getParameter("password")));
        if (DAO_User.getDao_User().selectByEnP(user) == null) {
            DAO_User.getDao_User().insert(user);
            url = "/User/success.jsp"; // forward to success page or something like that
        } else {
            req.setAttribute("err", "Your account already exist! Please change to Sign In or Forget Password.");
            url = "/User/signup.jsp";
        }

        RequestDispatcher rd = req.getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }
}
