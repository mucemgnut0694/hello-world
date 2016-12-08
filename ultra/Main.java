package com.barry.allen;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import javax.xml.bind.DatatypeConverter;;

public class Main {
	
	public static String binaryFileToHexString(final String path)
		    throws FileNotFoundException, IOException
		{
		    final int bufferSize = 512;
		    final byte[] buffer = new byte[bufferSize];
		    final StringBuilder sb = new StringBuilder();

		    // open the file
		    FileInputStream stream = new FileInputStream(path);
		    int bytesRead;

		    // read a block
		    while ((bytesRead = stream.read(buffer)) > 0)
		    {
		        // append the block as hex
		        for (int i = 0; i < bytesRead; i++)
		        {
		            sb.append(String.format("%02X", buffer[i]));
		        }
		    }
		    stream.close();

		    return sb.toString();
		}
	
	public static void hexStringToStringFile(String fileName, String hexString)
			throws FileNotFoundException, IOException
	{
		FileOutputStream stream = new FileOutputStream(fileName);
		stream.write(hexString.getBytes());
		stream.close();
	}
	
	public static void hexStringToExeFile(String fileName, String hexString)
			throws FileNotFoundException, IOException
	{
		FileOutputStream stream = new FileOutputStream(fileName);
		byte[] hexBytes = toByteArray(hexString);
		stream.write(hexBytes);
		stream.close();
	}
	
	public static String toHexString(byte[] array) {
	    return DatatypeConverter.printHexBinary(array);
	}

	public static byte[] toByteArray(String s) {
	    return DatatypeConverter.parseHexBinary(s);
	}
	
	public static void main(String[] args) {
		try{
			String hex = binaryFileToHexString("u1603.exe");
			hexStringToStringFile("ultra.txt", hex);
			hexStringToExeFile("ultra.exe", hex);
		}
		catch(Exception e){
			e.printStackTrace();
		}
	}

}
