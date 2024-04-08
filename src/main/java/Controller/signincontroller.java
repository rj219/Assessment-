package Controller;

import java.io.IOException;

import Dao.Studentdao;
import Model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@WebServlet("/signin")
public class signincontroller  extends HttpServlet{
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		
		Student s = new Student();
		
		s.setEmail(email);
		s.setPassword(password);
		
		Studentdao dao = new Studentdao();
		
		String lastname = dao.loginstudent(s);
		
		
		
		if(lastname==null)
		{
			req.setAttribute("err", "Invalid Credentials..!!!!");
			req.getRequestDispatcher("signin.jsp").forward(req, resp);
		}
		else
		{
			HttpSession session = req.getSession();
			session.setAttribute("name", lastname);
			req.getRequestDispatcher("Home.jsp").forward(req, resp);
		}
		
	}

}
