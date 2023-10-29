package model;

public class AccessLevel {
    private Account c1;

    public AccessLevel(Account c1) {
        super();
        this.c1 = c1;
    }

    public Account Level() {
        if (c1.getAccess() == 1) {
            c1 = (Admin) c1;
        } else {
            c1 = (User) c1;
        }
        return c1;
    }


}

