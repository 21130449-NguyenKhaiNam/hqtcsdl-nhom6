package Utils;

import Model.User;

import java.util.Date;
import java.util.Properties;

import javax.mail.*;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class SendEmail {

    private static final String FROM = "khuong4work@gmail.com", PASSWORD = "ltakpgizwnqqsgkt";

    /**
     * @param user
     * @return
     */
    public static boolean verify(User user) {
        // Properties
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        Authenticator auth = new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new javax.mail.PasswordAuthentication(FROM, PASSWORD);
            }
        };

        // Session
        Session session = Session.getInstance(props, auth);

        // Create a text
        MimeMessage msg = new MimeMessage(session);

        try {
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(FROM);
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(user.getEmail(), false));
            msg.setSubject("Activate account");
            msg.setSentDate(new Date());

            // Set content
            msg.setContent("http://localhost:8080/Project/user-controller?action=verify&id=" +
                    user.getId() +
                    "&code=" +
                    user.getCode() +
                    "", "text/HTML; charset=UTF-8");

            Transport.send(msg);
            System.out.println("Send email is successfully!");
            return true;
        }catch (Exception e){
            System.out.println("Send email is failed!");
            e.printStackTrace();
            return false;
        }
    }

    public static void main(String[] args) {
        User user = new User();
        user.setEmail("khuongvo2105@gmail.com");
        System.out.println(verify(user));
    }
}
