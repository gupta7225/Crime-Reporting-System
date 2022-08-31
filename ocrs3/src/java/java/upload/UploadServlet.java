
package upload;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Scanner;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

    // specify urlPattern for servlet
@MultipartConfig                                               // specifies servlet takes multipart/form-data
public class UploadServlet extends HttpServlet {
   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
         PrintWriter out = response.getWriter();
        try {
            
             Part photo = request.getPart("file");
            
            Part p = request.getPart("filename");
            Scanner scanner = new Scanner(p.getInputStream());
            String id = scanner.nextLine();
          
           

           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
            con.setAutoCommit(false);

            PreparedStatement ps = con.prepareStatement("insert into files values(?,?)");
            
           
            ps.setBinaryStream(1, photo.getInputStream(), (int) photo.getSize());
            ps.setString(2,id);
            ps.executeUpdate();
            con.commit();
            con.close();
            out.println("Record added Successfully. <p> <a href=listplayers>list records </a>");
 } 
        catch(Exception ex) {
            System.out.println(ex.getMessage());

        } finally {
            out.close();
        }
    }
}