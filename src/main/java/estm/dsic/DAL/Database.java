package estm.dsic.DAL;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Database {
    private static Connection connection;

    public static Connection getConnection() {
        if (connection == null) {
            try {
                Context ctx = new InitialContext();
                DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/db_notes");
                connection = ds.getConnection();
                return connection;
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return connection;
    }
}
