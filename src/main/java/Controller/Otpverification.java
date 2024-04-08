package Controller;

import java.io.IOException;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/otpverify")
public class Otpverification  extends  HttpServlet{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String otp = req.getParameter("otp");
		
		ServletContext cx = req.getServletContext();
		String myotp = (String)cx.getAttribute("myotp");
		
		
		if(otp.equals(myotp))
		{
			req.getRequestDispatcher("Updatepassword.jsp").forward(req, resp);
		}
		else
		{
			req.setAttribute("err", "Invalid otp");
			req.getRequestDispatcher("otpverify.jsp").forward(req, resp);
		}
	}
}