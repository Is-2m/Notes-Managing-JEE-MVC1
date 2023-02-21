package estm.dsic.controllers;

import estm.dsic.business.NoteBusiness;
import estm.dsic.business.UserBusiness;
import estm.dsic.models.Note;
import estm.dsic.models.User;
import jakarta.jms.Session;
import jakarta.servlet.*;
import jakarta.servlet.http.*;
import jakarta.servlet.annotation.*;

import java.io.IOException;
import java.util.Enumeration;

@WebServlet(name = "NoteServlet", urlPatterns = "/NoteServlet")
public class NoteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String operation = request.getParameter("op");
        String self = request.getParameter("self");
        int noteid = (request.getParameter("note_id") == null) ? -1 :
                Integer.parseInt(request.getParameter("note_id"));

        HttpSession session = request.getSession();
        User currentUser = ((User) session.getAttribute("currentUser"));

        if (operation.equals("delete") && noteid != -1) {
            NoteBusiness noteB = new NoteBusiness();
            noteB.deleteNote(noteid);
            if (self.equals("yes")) {
                currentUser.setNotes(noteB.getNotes(currentUser.getId()));
                session.setAttribute("currentUser", currentUser);
            } else if (self.equals("no")) {
                User inspectedUser = (User) session.getAttribute("inspectedUser");
                inspectedUser.setNotes(noteB.getNotes(inspectedUser.getId()));
                session.setAttribute("inspectedUser", inspectedUser);
            }

            response.sendRedirect(request.getHeader("referer"));
        }
        if (operation.equals("edit") && noteid != -1) {
            session.setAttribute("note", new NoteBusiness().getNote(noteid));
            response.sendRedirect((currentUser.isAdmin() ? "Admin" : "User") + "/createNote.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        int id = Integer.parseInt(request.getParameter("id"));

        HttpSession session = request.getSession();
        User currentUser = ((User) session.getAttribute("currentUser"));

        if (title == null || title.isEmpty() || content == null || content.isEmpty()) {
            request.setAttribute("error", "Title and content cannot be empty.");
            request.getRequestDispatcher((currentUser.isAdmin() ? "Admin" : "User") + "/createNote.jsp").forward(request, response);
//            return;
        } else {
            int counter = session.getAttribute("counter") == null ? 0 :
                    (Integer) session.getAttribute("counter");

            Note note = new Note();
            note.setTitle(title);
            note.setContent(content);
            note.setUserId(currentUser.getId());
            NoteBusiness noteB = new NoteBusiness();
            if (id == -1) {
                if (noteB.addNote(note) != null) {
                    session.setAttribute("counter", ++counter);
                    currentUser.setNotes(noteB.getNotes(currentUser.getId()));
                    session.setAttribute("currentUser", currentUser);
                    response.sendRedirect((currentUser.isAdmin() ? "Admin" : "User") + "/listAllNotes.jsp");
//            request.getRequestDispatcher("User/listAllNotes.jsp").forward(request, response);
                } else {
                    System.out.println("Error NoteServlet doPost: creating note");
                }
            } else {
                note.setId(id);
                noteB.updateNote(note);
                currentUser.setNotes(noteB.getNotes(currentUser.getId()));
                session.setAttribute("currentUser", currentUser);
                session.setAttribute("note", null);

                response.sendRedirect((currentUser.isAdmin() ? "Admin" : "User") + "/index.jsp");

            }
        }
    }
}
