package dbpackages;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import oracle.jdbc.OracleDriver;

public class DbConfig {

    public static Connection connect() {
        try {
            DriverManager.registerDriver(new OracleDriver());
            String username = "library", password = "library";
            Connection connection = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521", username, password);
            return connection;
        } catch (SQLException ex) {
            System.out.println(ex);
            return null;
        }

    }
}
