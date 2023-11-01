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

    public static String decrypt(String encodedInput) {
        String salt = "dskue@KGhQ*%lk";
        try {
            // Giải mã Base64 để nhận lại chuỗi gốc
            byte[] decodedBytes = Base64.decodeBase64(encodedInput);
            String input = new String(decodedBytes, "UTF-8");

            // Loại bỏ salt (số lượng ký tự bằng độ dài của salt)
            input = input.substring(0, input.length() - salt.length());

            // Tính mã băm SHA-1 cho chuỗi đã giải mã
            MessageDigest md = MessageDigest.getInstance("SHA-1");
            byte[] hashBytes = md.digest(input.getBytes("UTF-8"));

            // Chuyển kết quả mã băm sang dạng chuỗi hex
            StringBuilder hexString = new StringBuilder();
            for (byte hashByte : hashBytes) {
                hexString.append(String.format("%02x", hashByte));
            }

            return hexString.toString();
        } catch (UnsupportedEncodingException | NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        }
    }

    public static void main(String[] args) {
        String passwd = "09092008";
        System.out.println(encrypt(passwd));
    }
}
