package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;
import java.sql.PreparedStatement;
import dbpackages.DbConfig;
import java.sql.Connection;

public final class Update_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(3);
    _jspx_dependants.add("/includes/header.jsp");
    _jspx_dependants.add("/includes/menu.jsp");
    _jspx_dependants.add("/includes/footer.jsp");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");

    String result="";
    boolean ispostback = (request.getParameter("check") == null) ? false : true;
    String categoryno="0";
    String categoryname="",description="",roomcharge="" ;
    if(ispostback)
    {
        //****************Get Starts Here***************************
        try
        {
        String cmd=request.getParameter("cmd");
        System.out.println(cmd);
        if(cmd.equals("get"))
        {
   categoryno=request.getParameter("categoryno");
   Connection connection=DbConfig.connect();
   PreparedStatement ps= connection.prepareStatement("select * from roomcategories where categorynumber=?");
   
      
   ps.setString(1, categoryno);
   ResultSet rs=ps.executeQuery();
   if(rs.next())
   {
       categoryname="" + rs.getObject("categoryname");
       description="" + rs.getObject("description");
       roomcharge="" + rs.getObject("roomcharge");
       result="Record Found";
   }
   else 
   {
       result="Record Not Found";
   categoryname="Not found";
   }
   //****************Get Ends Here***************************
        }  
        // ***********UPDATE Starts here*****************
        if(cmd.equals("submit"))
        {
             Connection connection=DbConfig.connect();
             categoryname = request.getParameter("categoryname");
            description = request.getParameter("description");
            roomcharge = request.getParameter("roomcharge");
            categoryno =request.getParameter("categoryno");
            PreparedStatement ps = connection.prepareStatement("update roomcategories set categoryname=?, description=?, roomcharge=? where categorynumber=?");
            ps.setString(1, categoryname);
            ps.setString(2, description);
            ps.setString(3, roomcharge);
            ps.setString(4, categoryno);
          int n=  ps.executeUpdate();
           if(n>0)
          {
              result="Record Update " + n;
          }
          else 
          {
              result="Record Not Update";
          }
              out.println(categoryno);
          
          // ***********UPDATE Ends here*****************
        }
        //**************Delete starts here*********************
        if(cmd.equals("delete"))
        {
            Connection connection=DbConfig.connect();
             categoryname = request.getParameter("categoryname");
            description = request.getParameter("description");
            roomcharge = request.getParameter("roomcharge");
            categoryno =request.getParameter("categoryno");
            PreparedStatement ps = connection.prepareStatement("delete from roomcategories where categorynumber=?");
            ps.setString(1, categoryno);
          int n =  ps.executeUpdate();
        
            
          if(n>0)
          {
              result="Record Deleted " + n;
          }
          else 
          {
              result="Record Not Deleted";
          }
              out.println(categoryno);
        } 
        //**************Delete ends here*********************
        }
        catch(Exception ex)
        {
            System.out.println(ex);
            result=ex.getMessage();
        }
   }
    //**********************************************************

      out.write("\n");
      out.write("\n");
      out.write("  ");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"en\">\n");
      out.write("<head>\n");
      out.write("  \n");
      out.write("  <meta charset=\"utf-8\">\n");
      out.write("  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\n");
      out.write("  <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\">\n");
      out.write("  <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\"></script>\n");
      out.write(" \n");
      out.write("  <!--<link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css\">-->\n");
      out.write("  <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js\"></script>\n");
      out.write("  <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js\"></script>\n");
      out.write("  <link href=\"styles/hotelstyle.css\" rel=\"stylesheet\"/>");
      out.write("\n");
      out.write("<title>Update </title>\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("             <!--************Header Form  Start************-->\n");
      out.write("             \n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        .                                                                                                                                 \n");
      out.write("        <div style=\"background-size: cover ;background-image: url('images/people.jpg')\"  class=\"p-5 bg-primary text-white text-center\">\n");
      out.write("            <h1 class=\"display-1\">Hotel Star</h1>\n");
      out.write("            <p class=\"fw-bold\">A hotel is just a place to lay your head.\n");
      out.write("                !</p> \n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("        \n");
      out.write("          <!--************Header Form Ends ************-->\n");
      out.write("\n");
      out.write("           <!--************Menu Form Starts ************-->\n");
      out.write("        ");
      out.write("<nav class=\"navbar navbar-expand-sm bg-dark navbar-dark\">\n");
      out.write("    <div class=\"container-fluid\">\n");
      out.write("        <a class=\"navbar-brand\" href=\"#\"><img class=\"imgstyle\" src=\"images/logo3.jpg\"></a>\n");
      out.write("        <button class=\"navbar-toggler\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapsibleNavbar\">\n");
      out.write("            <span class=\"navbar-toggler-icon\"></span>\n");
      out.write("        </button>\n");
      out.write("        <div class=\"collapse navbar-collapse\" id=\"collapsibleNavbar\">\n");
      out.write("            <ul class=\"navbar-nav\">\n");
      out.write("                <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"index.jsp\">Home</a>\n");
      out.write("                </li>\n");
      out.write("                 <li class=\"nav-item\">\n");
      out.write("                    <a class=\"nav-link\" href=\"contact.jsp\">Contact</a>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("\n");
      out.write("                <li class=\"nav-item dropdown\">\n");
      out.write("                    <a class=\"nav-link dropdown-toggle\" href=\"#\" role=\"button\" data-bs-toggle=\"dropdown\">Utilities</a>\n");
      out.write("                    <ul class=\"dropdown-menu\">\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"categorymaster.jsp\">Booking</a></li>\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"roomcategory.jsp\">Lookup</a></li>\n");
      out.write("                        <li><a class=\"dropdown-item\" href=\"#\">Cancellation</a></li>\n");
      out.write("                    </ul>\n");
      out.write("                </li>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("            </ul>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("</nav>\n");
      out.write("\n");
      out.write("  \n");
      out.write("        \n");
      out.write("        <!--************Menu Form Ends ************-->\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        <!--************Body Starts ************-->\n");
      out.write("        \n");
      out.write("          <div class=\"container-fluid\">\n");
      out.write("  <div class=\"row\">\n");
      out.write("    <div class=\"col-sm-3 banner\"></div>\n");
      out.write("    \n");
      out.write("    \n");
      out.write("    <div class=\"col-sm-6 banner\" style=\"background-color:lavenderblush;\">\n");
      out.write("        \n");
      out.write("        <!--Form Start-->\n");
      out.write("        <form method=\"post\">\n");
      out.write("            <h1>");
      out.print(result);
      out.write("</h1>\n");
      out.write("                \n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-sm-8 banner\">\n");
      out.write("                <div class=\"form-floating mb-3 mt-3\">\n");
      out.write("                        <input value=\"");
      out.print(categoryno);
      out.write("\" type=\"number\" required class=\"form-control\" id=\"categoryno\" placeholder=\"Enter Category No\" name=\"categoryno\">\n");
      out.write("                        <label for=\"categoryno\">Category No</label>\n");
      out.write("                        <div class=\"valid-feedback\">Category Name ok.</div>\n");
      out.write("                        <div class=\"invalid-feedback\">Please fill out Category Name.</div>\n");
      out.write("                    </div>\n");
      out.write("            \n");
      out.write("            </div>       \n");
      out.write("            <div class=\"col-sm-4 banner\"><br>\n");
      out.write("                <button type=\"submit\" name=\"cmd\" formnovalidate=\"formnovalidate\" value=\"get\" class=\"btn-block btn btn-primary\">Get</button>\n");
      out.write("                \n");
      out.write("            </div>\n");
      out.write("        \n");
      out.write("        </div>\n");
      out.write("      \n");
      out.write("        <!--Form End -->\n");
      out.write("        \n");
      out.write("        \n");
      out.write("        \n");
      out.write("                    <h2 class=\"\"></h2>\n");
      out.write("                    <input type=\"hidden\" name=\"check\"> \n");
      out.write("                    <div class=\"form-floating mb-3 mt-3\">\n");
      out.write("                        <input  value=\"");
      out.print(categoryname);
      out.write("\"  type=\"text\" required class=\"form-control\" id=\"categoryname\" placeholder=\"Enter Category\" name=\"categoryname\">\n");
      out.write("                        <label for=\"categoryname\">Category Name</label>\n");
      out.write("                        <div class=\"valid-feedback\">Category Name ok.</div>\n");
      out.write("                        <div class=\"invalid-feedback\">Please fill out Category Name.</div>\n");
      out.write("                    </div>\n");
      out.write("\n");
      out.write("                    <div class=\"form-floating mt-3 mb-3\">\n");
      out.write("                        <input required value=\"");
      out.print(roomcharge);
      out.write("\" type=\"number\" class=\"form-control\" id=\"roomcharge\" placeholder=\"Room Charge\" name=\"roomcharge\">\n");
      out.write("                        <label for=\"roomcharge\">Room Charge</label>\n");
      out.write("                        <div class=\"valid-feedback\">Room Charge ok.</div>\n");
      out.write("                        <div class=\"invalid-feedback\">Please fill out Room Charge.</div>\n");
      out.write("\n");
      out.write("                    </div> \n");
      out.write("\n");
      out.write("                    <div class=\"form-floating mb-3 mt-3\">\n");
      out.write("                        <textarea required  class=\"form-control\" id=\"comment\" name=\"description\" placeholder=\"Comment goes here\">\n");
      out.write("                            ");
      out.print(description);
      out.write("\n");
      out.write("                        </textarea>\n");
      out.write("                        <label for=\"comment\">Comments</label>\n");
      out.write("                        <div class=\"valid-feedback\">Comments ok.</div>\n");
      out.write("                        <div class=\"invalid-feedback\">Please fill out Comment.</div>\n");
      out.write("\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"row\">\n");
      out.write("                            <div class=\"col-sm-6 banner\"\n");
      out.write("                        <div class=\"form-floating mb-3 mt-3\">\n");
      out.write("                        <div class=\"d-grid\">\n");
      out.write("                            <button type=\"submit\" name=\"cmd\" value=\"submit\" class=\"btn-block btn btn-primary\">Update</button></div>\n");
      out.write("                        </div>\n");
      out.write("                                 <div class=\"col-sm-6 banner\" \n");
      out.write("                                     <div class=\"form-floating mb-3 mt-3\">\n");
      out.write("                        <div class=\"d-grid\">\n");
      out.write("                            <button type=\"submit\" name=\"cmd\" value=\"delete\" class=\"btn-block btn btn-primary\">Delete</button></div>\n");
      out.write("                               </div>       \n");
      out.write("                          </div> \n");
      out.write("                                  </form>\n");
      out.write("                      <div class=\"col-sm-3 banner\"></div>               \n");
      out.write("                 </div>\n");
      out.write("            </div>     \n");
      out.write("      </div> \n");
      out.write("                     <!--************Body Ends ************--> \n");
      out.write("                     \n");
      out.write("                     \n");
      out.write("                     \n");
      out.write("                     \n");
      out.write("                      <!--************Footer Form Starts ************-->  \n");
      out.write("                      ");
      out.write("<div class=\"mt-5 p-4 bg-dark text-white text-center\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("    <p>Developed by :</p>\n");
      out.write("    <p> GOVIND KUMAR</p>\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!-- Add font awesome icons -->\n");
      out.write("<a href=\"#\" class=\"fa fa-facebook\"></a>\n");
      out.write("<a href=\"#\" class=\"fa fa-twitter\"></a>\n");
      out.write("<a href=\"#\" class=\"fa fa-instagram\"></a>\n");
      out.write("</div>");
      out.write("\n");
      out.write("                      <!--************Footer Form Ends ************-->\n");
      out.write("                      \n");
      out.write("        </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
