package Controller;

import java.io.IOException;
import java.util.ArrayList;

import Dao.Studentdao;
import Model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/details")
public class Detailscontroller extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		Studentdao dao = new Studentdao();
		
		ArrayList<Student> s = dao.Studentdetails();
		
		req.setAttribute("data", s);
		req.getRequestDispatcher("Details.jsp").forward(req, resp);
		
		
	}

}
