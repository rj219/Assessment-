package Controller;

import java.io.IOException;

import Dao.Studentdao;
import Model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/update")
public class UpdateController extends HttpServlet {
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String action = req.getParameter("action");
		int id = Integer.parseInt(req.getParameter("id"));
		
		Studentdao dao = new Studentdao();
		
		if(action.equals("edit"))
		{
			Student s = dao.getStudentbyId(id);
			req.setAttribute("sdata", s);
			req.getRequestDispatcher("signup.jsp").forward(req, resp);
			
		}
		else if(action.equals("delete"))
		{
			int i = dao.deleteStudent(id);
			
			if(i>0)
			{
			
				req.getRequestDispatcher("details").forward(req, resp);
			}
		}
		
	}

}
