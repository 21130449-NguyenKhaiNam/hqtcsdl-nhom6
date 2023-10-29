package Utils;

import org.apache.commons.codec.binary.Base64;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Encryption {

    public static String encrypt(String input) {
        String salt = "dskue@KGhQ*%lk", result;
        input += salt;
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            result = Base64.encodeBase64String(input.getBytes("UTF-8"));
        } catch (UnsupportedEncodingException e) {
            throw new RuntimeException(e);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
        return result;
    }

    public static void main(String[] args) {
        String passwd = "09092008";
        System.out.println(encrypt(passwd));
    }
}
