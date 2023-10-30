package Controller;

import Utils.Encryption;
import Utils.SendEmail;
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

        String url = "/User/signin.jsp";
        if (user == null) {
            req.setAttribute("err_sign_in", "Email or Password is incorrect!");
        } else {
            // xw ly voi access cua tk user

            switch (user.getAccess()) {
                case -1:
                    // bi khoa
                    req.setAttribute("err", "Your account has violated our policies and terms. If you believe this is a misunderstanding, please contact us at 21130449@st.hcmuaf.edu.vn. Thank you so much.");
                    break;
                case 0:
                    // chua xac thuc
                    req.setAttribute("err", "Please check your mailbox n click on the link sent to you.");
                    break;
                case 1:
                    // thong thuong
                case 2:
                    // admin
                    HttpSession session = req.getSession();
                    session.setAttribute("User", user);
                    url = "/index.jsp";
                    break;
            }
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
     * Cause if an Account exist, we will return FALSE n forwards request to SIGN IN, else we need create Account (n send verify email)?
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
//            DAO_User.getDao_User().insert(user);
            SendEmail.verify(user);
            url = "/User/success.jsp"; // forward to success page or something like that
        } else {
            req.setAttribute("err", "Your account already exist! Please change to Sign In or Forget Password.");
            url = "/User/signup.jsp";
        }

        RequestDispatcher rd = req.getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    private void logout(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        HttpSession session = req.getSession();
        //destroy this session
        session.invalidate();
        // in this case, i will redirect it to index.jsp. If u want to change, u can overwrite /index.jsp
        resp.sendRedirect(req.getScheme() + "://" + req.getServerName() + ":" + req.getServerPort() + req.getContextPath() + "/index.jsp");
    }

    /**
     * @param req
     * @param resp
     * @throws ServletException
     * @throws IOException
     */
    private void forgotPw(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

        String url = "";

        User user = new User();
        user.setEmail(req.getParameter("email"));

        if (DAO_User.getDao_User().selectByEmail(user) == null) {
            req.setAttribute("err", "Email incorrect! Please try again.");
            url = "/User/signin.jsp";
        } else {
            // send email for reset password
            // ... code at here
            url = "/User/success.jsp";
        }
        RequestDispatcher rd = req.getServletContext().getRequestDispatcher(url);
        rd.forward(req, resp);
    }

    private void resetPwd(HttpServletRequest req, HttpServletResponse resp) {
    }

    private void verify(HttpServletRequest req, HttpServletResponse resp) {
    }

}
