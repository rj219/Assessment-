package Controller;

import java.io.IOException;

import Dao.Studentdao;
import Model.Student;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/reg")
public class SignupController extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String id = req.getParameter("id");
		String firstname = req.getParameter("firstname");
		String lastname = req.getParameter("lastname");
		String email = req.getParameter("email");
		String mobile = req.getParameter("mobile");
		String address = req.getParameter("address");
		String gender = req.getParameter("gender");
		String password = req.getParameter("password");
		String confirmpassword = req.getParameter("confirmpassword");
		
		Student s = new Student();
		
		s.setFirstname(firstname);
		s.setLastname(lastname);
		s.setEmail(email);
		s.setMobile(mobile);
		s.setAddress(address);
		s.setGender(gender);
		s.setPassword(password);
		s.setConfirmpassword(confirmpassword);
		
		Studentdao dao = new Studentdao();
		if(id.equals(null)||id.equals(""))
		{
			boolean b = dao.isEmailexist(s);
			
			if(b)
			{
				req.setAttribute("err", "Email Already Exist..!!!!");
				req.getRequestDispatcher("signup.jsp").forward(req, resp);
			}
			else
			{
				int i = dao.Registration(s);
				
				if(i>0)
				{
					req.setAttribute("msg", "Registration Successfull...!!!!");
					req.getRequestDispatcher("signup.jsp").forward(req, resp);
				}
				
			}
		}
		else
		{
			int uid = Integer.parseInt(id);
			s.setId(uid);
			
			boolean b = dao.isEmailexist(s);
			
			if(b)
			{
				req.setAttribute("err", "Email Already Exist..!!!");
				req.getRequestDispatcher("signup.jsp").forward(req, resp);
			}
			else
			{
				int i = dao.updateEmp(s);
				
				if(i>0)
				{
					req.setAttribute("msg", "Student update Successfull..!!!");
					req.getRequestDispatcher("signup.jsp").forward(req, resp);
				}
			}
		}
		
		
	}

}
