package mypack;

import java.net.*;
import java.io.*;

import javax.crypto.Cipher;
import javax.crypto.CipherInputStream;
import javax.crypto.CipherOutputStream;
import javax.crypto.SecretKey;
import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.DESKeySpec;


public class SimpleFTPClient
{
    private URLConnection m_client;

	String key = "squirrel123"; // needs to be at least 8 characters for DES
   
    private String host;
   
    private String user;
   
    private String password;
   
    private String remoteFile;
   
    public SimpleFTPClient()
	{
		//no-operation
    }

    public void setHost(String host)
	{
        this.host = host;
    }

    public void setUser(String user)
	{
        this.user = user;
    }

    public void setPassword(String p)
	{
        this.password = p;
    }

    public void setRemoteFile(String d)
	{
        this.remoteFile = d;
    }

   public synchronized boolean uploadFile(InputStream is)
   {
        try
        {
            BufferedInputStream bis = new BufferedInputStream(is);
            
			OutputStream os = m_client.getOutputStream();
            
			BufferedOutputStream bos = new BufferedOutputStream(os);
            
			byte[] buffer1 = new byte[1024];
            
			FileOutputStream fos1=new FileOutputStream("D:/alibaba/encripttest.txt");

			int readCount1=0;
			int readCount=0;

			 while ((readCount1 = bis.read(buffer1)) > 0)
			 {
                fos1.write(buffer1, 0, readCount1);

             }//while

			 
			  

				FileInputStream fis = new FileInputStream("D:/alibaba/encripttest.txt");
				
				FileOutputStream fos = new FileOutputStream("D:/alibaba/encryptedtest.txt");
				
				encrypt(key, fis, fos);

				FileInputStream fis2 = new FileInputStream("D:/alibaba/encryptedtest.txt");

				byte[] buffer= new byte[1024];

				 while ((readCount = fis2.read(buffer)) > 0)
				 {
					bos.write(buffer, 0, readCount);

				 }//while

				bos.close();

				System.out.println("file uploadded successfully");
        }//try

		catch (Exception ex)
		{
            ex.printStackTrace();

            StringWriter sw0 = new StringWriter();

            PrintWriter p0 = new PrintWriter(sw0, true);

            ex.printStackTrace(p0);

            return false;

        }//catch

		catch (Throwable e) {
			e.printStackTrace();
		}

		return true;

		

    }//upLoadFile


	public static void encrypt(String key, InputStream is, OutputStream os) throws Throwable {
		encryptOrDecrypt(key, Cipher.ENCRYPT_MODE, is, os);
	}


	public static void encryptOrDecrypt(String key, int mode, InputStream is, OutputStream os) throws Throwable {

		DESKeySpec dks = new DESKeySpec(key.getBytes());
		SecretKeyFactory skf = SecretKeyFactory.getInstance("DES");
		SecretKey desKey = skf.generateSecret(dks);
		Cipher cipher = Cipher.getInstance("DES"); // DES/ECB/PKCS5Padding for SunJCE

		if (mode == Cipher.ENCRYPT_MODE) {
			cipher.init(Cipher.ENCRYPT_MODE, desKey);
			CipherInputStream cis = new CipherInputStream(is, cipher);
			doCopy(cis, os);
		} else if (mode == Cipher.DECRYPT_MODE) {
			cipher.init(Cipher.DECRYPT_MODE, desKey);
			CipherOutputStream cos = new CipherOutputStream(os, cipher);
			doCopy(is, cos);
		}
	}

	public static void doCopy(InputStream is, OutputStream os) throws IOException {
		byte[] bytes = new byte[64];
		int numBytes;
		while ((numBytes = is.read(bytes)) != -1) {
			os.write(bytes, 0, numBytes);
		}
		os.flush();
		os.close();
		is.close();
	}

  
    public synchronized boolean downloadFile(String localfilename)
	{
        try
        {

			System.out.println("srinu file name is "+localfilename);

			InputStream is = m_client.getInputStream();

			System.out.println("1");
            
			BufferedInputStream bis = new BufferedInputStream(is);

			System.out.println("2");
            
			OutputStream os = new FileOutputStream(localfilename);

			System.out.println("3");
            
			BufferedOutputStream bos = new BufferedOutputStream(os);

			System.out.println("4");

            byte[] buffer = new byte[1024];
            
			int readCount1=0;
	
			FileOutputStream fos1 = new FileOutputStream("D:/alibaba/decripttest.txt");

			 while ((readCount1 = bis.read(buffer)) > 0)
			 {
					fos1.write(buffer, 0, readCount1);

			 }//while

			 FileInputStream fis2 = new FileInputStream("D:/alibaba/decripttest.txt");

			 FileOutputStream fos2 = new FileOutputStream(localfilename);

			 decrypt(key, fis2, fos2);


			System.out.println("after while");
            
			bos.close();
            
			is.close();
            
			System.out.println("successfully downloadded");

        }//try

		catch (Exception ex)
		{
            ex.printStackTrace();
            
			StringWriter sw0 = new StringWriter();
            
			PrintWriter p0 = new PrintWriter(sw0, true);
            
			ex.printStackTrace(p0);
    
            return false;

        }//catch
		catch (Throwable e) {
			e.printStackTrace();
		}

		return true;


    }//downloadFile

	public static void decrypt(String key, InputStream is, OutputStream os) throws Throwable {
		encryptOrDecrypt(key, Cipher.DECRYPT_MODE, is, os);
	}

    public synchronized boolean connect()
	{
        try
        {
			URL url = new URL("ftp://" + user + ":" + password + "@" + host + "/" + remoteFile + ";type=i");
            
			m_client = url.openConnection();
        
            return true;

        }//try

		catch (Exception ex)
		{
            ex.printStackTrace();
            
			StringWriter sw0 = new StringWriter();
            
			PrintWriter p0 = new PrintWriter(sw0, true);
            
			ex.printStackTrace(p0);
           
			return false;

        }//catch

    }//connect

}//class
