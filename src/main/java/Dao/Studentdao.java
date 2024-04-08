package Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Student;

public class Studentdao {
	Connection cn = null;
	public Studentdao() {
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			cn = DriverManager.getConnection("jdbc:mysql://localhost:3308/assessment","root","");
			
		} catch (ClassNotFoundException | SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	public int Registration(Student s) {
		
		int i = 0;
		
		try 
		{
			PreparedStatement ps = cn.prepareStatement("insert into Student values (?,?,?,?,?,?,?,?,?)");
			ps.setInt(1,0);
			ps.setString(2, s.getFirstname());
			ps.setString(3, s.getLastname());
			ps.setString(4, s.getEmail());
			ps.setString(5, s.getMobile());
			ps.setString(6, s.getAddress());
			ps.setString(7, s.getGender());
			ps.setString(8, s.getPassword());
			ps.setString(9, s.getConfirmpassword());
			
			i = ps.executeUpdate();
			
		}
		catch (SQLException e)
		{
		
			e.printStackTrace();
		}
		
		return i;
	}
	public String loginstudent(Student s)
	{
		String lastname = null;
		
		try {
			PreparedStatement ps = cn.prepareStatement("select * from Student where email=(?) and password=(?)");
			ps.setString(1, s.getEmail());
			ps.setString(2, s.getPassword());
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				lastname = rs.getString(3);
			}
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return lastname;
	}
	public ArrayList<Student> Studentdetails() {
		
		ArrayList<Student> s = new ArrayList<Student>();
		PreparedStatement ps;
		
		try {
			ps=cn.prepareStatement("select * from Student");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				Student st = new Student();
				st.setId(rs.getInt(1));
				st.setFirstname(rs.getString(2));
				st.setLastname(rs.getString(3));
				st.setEmail(rs.getString(4));
				st.setMobile(rs.getString(5));
				st.setAddress(rs.getString(6));
				st.setGender(rs.getString(7));
				st.setPassword(rs.getString(8));
				st.setConfirmpassword(rs.getString(9));
				
				s.add(st);
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return s;
	}
	public Student getStudentbyId(int id) {
		
		Student s = new Student();
		
		try
		{
			PreparedStatement ps = cn.prepareStatement("select * from Student where id=?");
			ps.setInt(1, id);
			
			ResultSet rs = ps.executeQuery();
			
			while(rs.next())
			{
				s.setId(rs.getInt(1));
				s.setFirstname(rs.getString(2));
				s.setLastname(rs.getString(3));
				s.setEmail(rs.getString(4));
				s.setMobile(rs.getString(5));
				s.setAddress(rs.getString(6));
				s.setGender(rs.getString(7));
				s.setPassword(rs.getString(8));
				s.setConfirmpassword(rs.getString(9));
			}
		} 
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return s;
	}
	public int deleteStudent(int id) {
		int i = 0;
		
		try 
		{
			PreparedStatement ps = cn.prepareStatement("delete from Student where id=?");
			ps.setInt(1, id);
			
			i = ps.executeUpdate();
		
		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return i;
	}
	public boolean isEmailexist(Student s) {
		boolean b = false;
		
		try {
			PreparedStatement ps = cn.prepareStatement("select * from Student where email=?");
			ps.setString(1, s.getEmail());
			
			ResultSet rs = ps.executeQuery();
			
			if(rs.next())
			{
				b = true;
			}
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return b;
	}
	public int updateEmp(Student s) 
	{
		int i = 0;
		
		try
		{
			PreparedStatement ps = cn.prepareStatement("update Student set firstname=?, lastname=?, email=?, mobile=?, address=?, gender=?, password=?, confirmpassword=? where id=?");
			ps.setString(1, s.getFirstname());
			ps.setString(2, s.getLastname());
			ps.setString(3, s.getEmail());
			ps.setString(4, s.getMobile());
			ps.setString(5, s.getGender());
			ps.setString(6, s.getGender());
			ps.setString(7, s.getPassword());
			ps.setString(8, s.getConfirmpassword());
			ps.setInt(9, s.getId());
			
			 i = ps.executeUpdate();
		}
		catch (SQLException e) {
			
			e.printStackTrace();
		}
		
		return i;
	}
	public int updatePass(Student s)
	{
		int i = 0;
		
		try 
		{
			PreparedStatement ps = cn.prepareStatement("update Student set password=? where email=?");
			ps.setString(1, s.getPassword());
			ps.setString(2, s.getEmail());
			
			i = ps.executeUpdate();
			
		}
		catch (SQLException e) {
		
			e.printStackTrace();
		}
		return i;
	}

}
