package Controller;

import java.io.IOException;

import Dao.Studentdao;
import Model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/updatepass")
public class Updatepassword extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String password = req.getParameter("password");
		
		Student s = new Student();
		
		s.setPassword(password);
		
		Studentdao dao = new Studentdao();
		
		int i = dao.updateEmp(s);
		
		if(i>0)
		{
			req.setAttribute("msg","password set Succesfully..!!!!");
			req.getRequestDispatcher("signin.jsp").forward(req, resp);
		}
		else
		{
			req.getRequestDispatcher("Updatepass.jsp").forward(req, resp);
		}
		
		
		
	}

}
