/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class listplayers extends HttpServlet {
    @Override 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {
            String location=request.getParameter("location");
            Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
            PreparedStatement ps = con.prepareStatement("select * from records  where location='"+location+"'");
            ResultSet rs = ps.executeQuery();
            out.println("<h1 align=center>RECORDS</h1>");
            while ( rs.next()) {
          
                  out.println("<html>");
                  out.println("<head>");
                  out.println("<style>");
                  out.println("th{background-color: #3EB1DD;color:white;padding: 10px 10px 10px 10px;}");
                  out.println("h1{color:#3EB1DD;font-family: Helvetica, sans-serif;}");
                  out.println("table{table-layout: fixed;word-wrap:break-word;border-collapse: collapse;width:90%;margin-top:2em;border:2px solid #3EB1DD;}");
                  out.println("td{color: #888;text-align:center;padding: 6px 4px 4px 6px;margin: 2px 6px 6px 2px;font-family: Helvetica, sans-serif;height:available;}");
                  
                  out.println("</style>");
                  out.println("</head>");
                  out.println("<body>");
                  out.println("<table align=center>");
                  out.println("<tr>");
                  out.println("<th>ID</th>");
                  out.println("<th>NAME</th>");
                  out.println("<th>AGE</th>");
                  out.println("<th>DESCRIPTION</th>");
                  out.println("<th>LOCATION</th>");
                  out.println("<th>STATUS</th>");
                  out.println("<th>PHOTO</th>");
                  
                  out.println("</tr>");
                  out.println("<tr>");
                  out.println("<td>" + rs.getString("id") + "</td>");
                  out.println("<td>" + rs.getString("name") + "</td>");
                  out.println("<td>" + rs.getString("age") + "</td>");
                  out.println("<td>" + rs.getString("description") + "</td>");
                  out.println("<td>" + rs.getString("location") + "</td>");
                   out.println("<td>" + rs.getString("status") + "</td>");
                  out.println("<td>");
                  out.println("<img width='150' height='150' src=displayphoto?id=" +  rs.getString("id") + "></img> <p/>");
                  out.println("</td>");
                 
                  out.println("</tr>");
                  out.println("</table>");
                  out.println("</body>");
                  out.println("</html>");
            }
            con.close();
        }
        catch(Exception ex) {
            System.out.println(ex.getMessage());
        }
        
        finally {            
            out.close();
        }
    }
}