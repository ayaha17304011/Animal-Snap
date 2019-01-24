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

			Date d = new Date();
			SimpleDateFormat d1 = new SimpleDateFormat("yyyy_MM_dd_HH_mm_ss");
			String date = d1.format(d);

			String[] contentType = ((String)file.getContentType()).split("/");
			//contentType = FileType / FileFormat => image/png
			//s[0] = image, s[1] = png
			if(contentType[0].equals("image")){
				fileName = "images/user" + userId + "_" + date + ".jpg";
			}else if(contentType[0].equals("video")){
				fileName = "videos/user" + userId + "_" + date + ".mp4";
			}
			System.out.println(fileName);
			post.setImageURL(fileName);
			file.write(path+fileName);

		} catch (IOException e) {
			e.printStackTrace();
		}	catch (ServletException e){
			e.printStackTrace();
		}
		return post;
	}
}