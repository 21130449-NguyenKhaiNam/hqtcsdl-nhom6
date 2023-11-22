package Model;

public class Access {
//    NOT_EXIST ,LOCKED, UNAUTHENTICATED, NORMAL, ADMIN
    public static final int NOT_EXIST = -2;
    public static final int LOCKED = -1;
    public static final int UNAUTHENTICATED = 0;
    public static final int NORMAL = 1;
    public static final  int ADMIN = 2;

    public static final int[] ACCESS = {NOT_EXIST, LOCKED, UNAUTHENTICATED, NORMAL, ADMIN};

    /**
     * Một con số chỉ hợp lệ khi nó khi nó tôn tại trong khoảng giới hạn
     */
    public static boolean validAccess(int access) {
        for (int ac: ACCESS) {
            if(access == ac)
                return true;
        }
        return false;
    }
}
