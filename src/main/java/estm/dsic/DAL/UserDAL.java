package estm.dsic.DAL;

import estm.dsic.models.User;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class UserDAL {
    public User getUser(String email) {
        Connection con = Database.getConnection();
        User user = null;
        try (PreparedStatement ps = con.prepareStatement("SELECT * FROM user where email=?")) {
            ps.setString(1, email);
            ResultSet res = ps.executeQuery();
            if (res.isBeforeFirst() || res.getRow() != 0) {
                while (res.next()) {
                    user = new User();
                    user.setId(res.getInt("id"));
                    user.setName(res.getString("name"));
                    user.setEmail(res.getString("email"));
                    user.setPassword(res.getString("password"));
                    user.setAdmin(res.getBoolean("isAdmin"));
                    user.setNotes(new NoteDAL().getNotes(user.getId()));
                }
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getUser(int userId) {
        Connection con = Database.getConnection();
        User user = null;
        try (PreparedStatement ps = con.prepareStatement("SELECT * FROM user where id=?")) {
            ps.setInt(1, userId);
            ResultSet res = ps.executeQuery();
            if (res.isBeforeFirst() || res.getRow() != 0) {
                while (res.next()) {
                    user = new User();
                    user.setId(res.getInt("id"));
                    user.setName(res.getString("name"));
                    user.setEmail(res.getString("email"));
                    user.setPassword(res.getString("password"));
                    user.setAdmin(res.getBoolean("isAdmin"));
                    user.setNotes(new NoteDAL().getNotes(user.getId()));
                }
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean addUser(User user) {

        Connection con = Database.getConnection();
        PreparedStatement stmt = null;
        try {
            String sql = "INSERT INTO user (name,email, password) VALUES (?, ?, ?)";
            stmt = con.prepareStatement(sql);
            stmt.setString(1, user.getName());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());

            int numRows = stmt.executeUpdate();
            return numRows == 1;
        } catch (Exception e) {
            e.printStackTrace();
            return false; // Failed to add user
        }
    }

    public ArrayList<User> getAllUsers() {
        Connection con = Database.getConnection();
        User user = null;
        ArrayList<User> lst = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement("SELECT * FROM user where isAdmin=0")) {
            ResultSet res = ps.executeQuery();
            if (res.isBeforeFirst() || res.getRow() != 0) {
                while (res.next()) {
                    user = new User();
                    user.setId(res.getInt("id"));
                    user.setName(res.getString("name"));
                    user.setEmail(res.getString("email"));
                    user.setPassword(res.getString("password"));
                    user.setAdmin(res.getBoolean("isAdmin"));
                    lst.add(user);
                }
                return lst;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }

    public void deleteUser(int userId) {
        Connection con = Database.getConnection();
        try (PreparedStatement ps = con.prepareStatement("DELETE FROM user WHERE id=?")) {
            ps.setInt(1, userId);
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean updateUser(User user) {
        Connection con = Database.getConnection();
        try (PreparedStatement ps = con.prepareStatement
                ("UPDATE user SET name=?,password=? WHERE id=?")) {
            ps.setString(1, user.getName());
            ps.setString(2, user.getPassword());
            ps.setInt(3, user.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
        return true;
    }

    public boolean isExist(String email) {
        Connection con = Database.getConnection();
        try (PreparedStatement ps = con.prepareStatement("SELECT * FROM user where email=?")) {
            ps.setString(1, email);
            ResultSet res = ps.executeQuery();
            if (res.isBeforeFirst() || res.getRow() != 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
}
