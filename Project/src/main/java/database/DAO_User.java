package database;

import Model.User;

import java.util.ArrayList;

public class DAO_User implements IDAO<User> {

    public static DAO_User getDao_User() {
        return new DAO_User();
    }

    /**
     * Searching in Database an object like <b>user</b>
     *
     * @param user an user just has Email n Password
     * @return an object instance of User, or return null if can't find it.
     */
    public User selectByEnP(User user) {

        //To do something

        return null;
    }

    /**
     * Searching in Database an object like <b>user</b>
     *
     * @param user an account just has Email
     * @return an object instance of User, or return null if can't find it.
     */
    public User selectByEmail(User user){
        // to do something
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
