package db;
import java.sql.*;
import java.util.*;
import java.io.*;

public class MyConnection 
{
	static Connection con=null;

	public static Connection getConnection(String path)
	{
		try
		{
			if(con==null)
			{
				FileInputStream fis=new FileInputStream(path);

				Properties p=new Properties();
				p.load(fis);

				String driver=p.getProperty("driver");
				String url=p.getProperty("url");
				String username=p.getProperty("username");
				String password=p.getProperty("password");

				Class.forName(driver);
	
				con=DriverManager.getConnection(url,username,password);
			}
			return con;
		}
		catch (SQLException se)
		{
			se.printStackTrace();
		}
		catch(Exception e)
		{
			e.printStackTrace();

		}
		
		return con;
	}
}
