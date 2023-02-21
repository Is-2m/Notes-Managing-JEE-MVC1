package estm.dsic.business;

import estm.dsic.DAL.UserDAL;
import estm.dsic.models.User;

import java.text.SimpleDateFormat;
import java.util.ArrayList;

public class UserBusiness {


    public User getUser(String email, String password) {
        UserDAL userDAL = new UserDAL();
        User user = userDAL.getUser(email);
        if (user != null) {
            return user.getPassword().equals(password) ? user : null;
        }
        return user;
    }

    public User getUser(int userId) {
        UserDAL userDAL = new UserDAL();
        return userDAL.getUser(userId);
    }

    public boolean addUser(User user) {
        UserDAL userDAL = new UserDAL();
        return userDAL.addUser(user);
    }

    public ArrayList<User> getAllUsers() {
        UserDAL userDAL = new UserDAL();
        return userDAL.getAllUsers();
    }

    public void deleteUser(int userId) {
        UserDAL userDAL = new UserDAL();
        userDAL.deleteUser(userId);
    }

    public boolean updateUser(User user) {
        UserDAL userDAL = new UserDAL();
        return userDAL.updateUser(user);
    }
    public boolean isExist(String email){
        UserDAL userDAL = new UserDAL();
        return userDAL.isExist(email);
    }
}
