package database;

import Model.User;

import java.util.ArrayList;

public class DAO_User implements IDAO<User> {

    public static DAO_User getDao_User() {
        return new DAO_User();
    }

    /**
     * @param user
     * @return user account
     */
    public User selectByEnP(User user) {

        //To do something

        return null;
    }

    @Override
    public int insert(User user) {
        return 0;
    }

    @Override
    public int update(User user) {
        return 0;
    }

    @Override
    public int delete(User user) {
        return 0;
    }

    @Override
    public ArrayList<User> select(String condition) {
        return null;
    }
}
