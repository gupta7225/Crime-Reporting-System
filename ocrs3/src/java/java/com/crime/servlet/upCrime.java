package com.crime.servlet;

import java.lang.ClassNotFoundException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig
public class upCrime extends HttpServlet{

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        try {

            Part p = request.getPart("id");
            Scanner scanner = new Scanner(p.getInputStream());
            String id = scanner.nextLine();
            p = request.getPart("name");
            scanner = new Scanner(p.getInputStream());
            String name = scanner.nextLine();
            p = request.getPart("age");
            scanner = new Scanner(p.getInputStream());
            String age = scanner.nextLine();
            p = request.getPart("desc");
            scanner = new Scanner(p.getInputStream());
            String description = scanner.nextLine();
            p = request.getPart("loc");
            scanner = new Scanner(p.getInputStream());
            String location = scanner.nextLine();
            p = request.getPart("stat");
            scanner = new Scanner(p.getInputStream());
            String status = scanner.nextLine();

            Part photo = request.getPart("photo");

           Class.forName("com.mysql.cj.jdbc.Driver");
           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ocrs?useSSL=false&allowPublicKeyRetrieval=true","root","root");
            con.setAutoCommit(false);

            PreparedStatement ps = con.prepareStatement("insert into records values(?,?,?,?,?,?,?)");
            ps.setString(1, id);
            ps.setString(2, name);
            ps.setString(3, age);
            ps.setString(4, description);
            ps.setString(5, location);
            ps.setString(6, status);
            ps.setBinaryStream(7, photo.getInputStream(), (int) photo.getSize());
            ps.executeUpdate();
            con.commit();
            con.close();
            out.println("Record added Successfully. <p> <a href=up.jsp>go back </a>");
 } 
        catch(Exception ex) {
            System.out.println(ex.getMessage());

        } finally {
            out.close();
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP
     * <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(upCrime.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(upCrime.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP
     * <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(upCrime.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(upCrime.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>
}
