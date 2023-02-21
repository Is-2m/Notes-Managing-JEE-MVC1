package estm.dsic.DAL;

import estm.dsic.models.Note;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class NoteDAL {
    public ArrayList<Note> getNotes(int userid) {
        Connection con = Database.getConnection();
        Note note = null;
        ArrayList<Note> lst = new ArrayList<>();
        try (PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM note where user_id=?")) {
            ps.setInt(1, userid);
            ResultSet res = ps.executeQuery();
            if (res.isBeforeFirst() || res.getRow() != 0) {
                while (res.next()) {
                    note = new Note();
                    note.setId(res.getInt("id"));
                    note.setContent(res.getString("content"));
                    note.setTitle(res.getString("title"));
                    note.setCreationDate(res.getString("creationDate"));
                    note.setUserId(res.getInt("user_id"));
                    lst.add(note);
                }
                return lst;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return lst;
    }

    public Note getNote(int noteid) {
        Connection con = Database.getConnection();
        Note note = null;
        try (PreparedStatement ps = con.prepareStatement(
                "SELECT * FROM note where id=?")) {
            ps.setInt(1, noteid);
            ResultSet res = ps.executeQuery();
            if (res.isBeforeFirst() || res.getRow() != 0) {
                while (res.next()) {
                    note = new Note();
                    note.setId(res.getInt("id"));
                    note.setContent(res.getString("content"));
                    note.setTitle(res.getString("title"));
                    note.setCreationDate(res.getString("creationDate"));
                    note.setUserId(res.getInt("user_id"));
                }
                return note;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return note;
    }

    public Note addNote(Note note) {
        Connection con = Database.getConnection();
        try (PreparedStatement ps = con.prepareStatement(
                "INSERT INTO note (title, content, creationDate, user_id) VALUES (?, ?, ?, ?)")) {
            ps.setString(1, note.getTitle());
            ps.setString(2, note.getContent());
            ps.setString(3, note.getCreationDate());
            ps.setInt(4, note.getUserId());
            return ps.executeUpdate() == 1 ? note : null;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public void deleteNote(int noteId) {
        Connection con = Database.getConnection();
        try (PreparedStatement ps = con.prepareStatement(
                "DELETE FROM note WHERE id=?")) {
            ps.setString(1, String.valueOf(noteId));
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateNote(Note note) {
        Connection con = Database.getConnection();
        try (PreparedStatement ps = con.prepareStatement(
                "UPDATE note SET title= ?,content=? WHERE id=?")) {
            ps.setString(1, note.getTitle());
            ps.setString(2, note.getContent());
            ps.setInt(3, note.getId());
            ps.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
