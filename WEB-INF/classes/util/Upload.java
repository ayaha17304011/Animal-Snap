package util;

import main.RequestContext;
import beans.PostBean;

import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletException;

@MultipartConfig(fileSizeThreshold=32768,maxFileSize=5242880,maxRequestSize=27262976)
public class Upload{
	public static PostBean uploadFile(RequestContext reqc){
		HttpServletRequest req = (HttpServletRequest)reqc.getRequest();

		String fileName = null;
		//"docBase" /post-url/
		String path = req.getServletContext().getRealPath("/WebContent/");
		PostBean post = new PostBean();
		try{
			String caption = req.getParameter("caption");
			String userId = req.getParameter("userId");
			post.setCaption(caption);
			post.setUserId(userId);
			Part file = req.getPart("post");

			if(req!=null) System.out.println(req.getServletPath());

			fileName = "user" + userId + "_" + getFileName(file);
			file.write(path+fileName);
			post.setImageURL(fileName);

		} catch (IOException e) {
			e.printStackTrace();
		}	catch (ServletException e){
			e.printStackTrace();
		}
		return post;
	}
	public static String getFileName(Part part){
		String fileName = null;
		String contentType = part.getContentType();
		//contentType = FileType / FileFormat => image/png
		//s[0] = image, s[1] = png
		String[] s = contentType.split("/");
		Date d = new Date();
	  SimpleDateFormat d1 = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
	  String date = d1.format(d);
		//image_1.png
		fileName = s[0] + "_" + date + "." + s[1];
		
		return fileName;
	}
}