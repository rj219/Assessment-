package Controller;

import java.io.IOException;
import java.util.Random;

import Dao.Studentdao;
import Model.Student;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
@WebServlet("/forgotpass")
public class Forgotpassword extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String email = req.getParameter("email");
		
		Studentdao dao = new Studentdao();
		
		Student s = new Student();
		
		s.setEmail(email);
		
		boolean b = dao.isEmailexist(s);
		
		if(b)
		{
			Random r = new Random();
			int num = r.nextInt(1000,9999);
			
			ServletContext cx = req.getServletContext();
			cx.setAttribute("myotp", num+"");
			cx.setAttribute("email",email );

			Mailer.send(email,"OTP verification","OTP : "+num);
			req.getRequestDispatcher("otpverify.jsp").forward(req, resp);
		}
		else
		{
			req.setAttribute("err", "User not found..!!!");
			req.getRequestDispatcher("otpverify.jsp").forward(req, resp);
		}
		
	}
}
