package utilitiespackage;

import dbpackages.DbConfig;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class Utilities {

    public static String getCategoriesList() {
        try {
            String output = "<select required  class=\"form-control\" name='categorynumber'>\n";
            Connection connection = DbConfig.connect();
            PreparedStatement ps = connection.prepareStatement("select * from roomcategories order by categoryname asc");
            ResultSet rs = ps.executeQuery();
             output += " <option value=''>Please Select</option>\n";
            while (rs.next()) {
                String categoryname = "" + rs.getObject("CATEGORYNAME");
                String categoryno = "" + rs.getObject("CATEGORYNUMBER");

                output += " <option value=" + categoryno + ">" + categoryname + "</option>\n";

            }
            output += "</select>";
            return output;
        } catch (Exception ex) {
            System.out.println(ex);
            return "";
        }
    }

    public static String getModal(String title, String message, String footer) {
        String code = "<div class=\"toast show\">\n"
                + "    <div class=\"toast-header\">\n"
                + "      <strong class=\"me-auto\">" + title + "</strong>\n"
                + "      <button type=\"button\" class=\"btn-close\" data-bs-dismiss=\"toast\"></button>\n"
                + "    </div>\n"
                + "    <div class=\"toast-body\">\n"
                + "      <p>" + message + "</p>\n"
                + "    </div>\n"
                + "  </div>";
        return code;
    }
}
