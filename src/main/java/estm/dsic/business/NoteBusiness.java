package estm.dsic.business;

import estm.dsic.DAL.NoteDAL;
import estm.dsic.models.Note;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class NoteBusiness {
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");

    public ArrayList<Note> getNotes(int userId) {
        NoteDAL noteDAL = new NoteDAL();
        return noteDAL.getNotes(userId);
    }
    public Note getNote(int noteId) {
        NoteDAL noteDAL = new NoteDAL();
        return noteDAL.getNote(noteId);
    }

    public Note addNote(Note note) {
        NoteDAL noteDAL = new NoteDAL();
        note.setCreationDate(sdf.format(new Date()));
        return noteDAL.addNote(note);
    }

    public void deleteNote(int noteId) {
        NoteDAL noteDAL = new NoteDAL();
        noteDAL.deleteNote(noteId);
    }

    public void updateNote(Note note) {
        NoteDAL noteDAL = new NoteDAL();
        noteDAL.updateNote(note);
    }
}
