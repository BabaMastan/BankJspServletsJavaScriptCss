package dao;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import java.sql.ResultSet;

public class BankUserPhotoDao 
{
	 public Connection conn;

	    public void createConnection() {
	        try {

	            Class.forName("oracle.jdbc.OracleDriver").newInstance();
	            String url = "jdbc:oracle:thin:@localhost:1521:XE";
	            conn = DriverManager.getConnection(url, "system", "system");

	            System.out.println("COnnection Successful");

	        } catch (Exception e) {

	            System.err.println(e.getMessage());
	        }

	    }
	    public void uploadphoto(String username,InputStream inputStream) throws IOException
	    {
	    	PreparedStatement pstmt;
			  System.out.print("\n[Performing UPDATE] ... ");
		    try
		    {
		     pstmt = conn.prepareStatement("insert into bankuserphotos values(?,?)");
		     pstmt.setString(1, username);
				pstmt.setBinaryStream(2, inputStream,inputStream.available());
		    int i= pstmt.executeUpdate();
		     System.out.println("Deposited");
		     
		    }
		    catch (SQLException ex)
		    {
		      System.err.println(ex.getMessage());
		    }
	    }
	    public String getphoto(String username) throws IOException
	    {
	    	PreparedStatement pstmt;
			  System.out.print("\n[Performing UPDATE] ... ");
			  byte barr[]=null;
		    try
		    { 
	    PreparedStatement ps=conn.prepareStatement("select * from bakuserphotos where username like ?");  
	    ResultSet rs=ps.executeQuery();  
	    if(rs.next())
	    {//now on 1st row  
	    int  i=1;      
	    Blob b=rs.getBlob(2);//2 means 2nd column data  
	    barr=b.getBytes(i,(int)b.length());//1 means first image  
	    i++;
	    }
		    }
	    catch (SQLException ex)
	    {
	      System.err.println(ex.getMessage());
	    }
		    sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
		    System.out.println(encoder);
		    String photo=encoder.encode(barr);
		    return photo;
    }
	    
	    
	    
	    
	    
	    
	    
	    public void closeConnection() {

	        try {
	            conn.close();
	        } catch (SQLException e) {
	            // TODO Auto-generated catch block
	            e.printStackTrace();
	        }
	    }


}
