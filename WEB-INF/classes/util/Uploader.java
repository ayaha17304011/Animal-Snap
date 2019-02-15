package util;

import main.RequestContext;
import beans.PostBean;

import java.io.IOException;
import java.util.Date;
import java.util.Collection;
import java.util.Iterator;
import java.text.SimpleDateFormat;

import javax.servlet.http.Part;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.ServletException;
import javax.servlet.http.HttpSession;

@MultipartConfig(fileSizeThreshold=32768,maxFileSize=5242880,maxRequestSize=27262976)
public class Uploader{
	//loacl upload
	public static PostBean uploadFile(RequestContext reqc){
		HttpServletRequest req = (HttpServletRequest)reqc.getRequest();

		String fileName = null;
		String allFileName = "";
		//"docBase" /post-url/
		String path = req.getServletContext().getRealPath("/WebContent/");
		PostBean post = new PostBean();
		try{
			String caption = req.getParameter("caption");

			HttpSession session = req.getSession();
			String userId = (String)session.getAttribute("userId");

			post.setCaption(caption);
			post.setUserId(userId);

			Date d = new Date();
			SimpleDateFormat d1 = new SimpleDateFormat("yyyy-MM-dd_HH-mm-ss");
			String date = d1.format(d);

			Collection<Part> part = req.getParts();
			Iterator it = part.iterator();
			int i = 0;
			while(it.hasNext()){
				
				Part file = (Part)it.next();
				System.out.println(file.getName());
				if(file.getName().equals("post")){
					System.out.println("File = "+file);
					String[] contentType = file.getContentType().split("/");
					System.out.println("type = "+contentType[0]);
					//contentType = FileType / FileFormat => image/png
					//s[0] = image, s[1] = png
					if(contentType[0].equals("image")){
						fileName = "images/user" + userId + "_" + i + "_" + date + ".jpg";
					}else if(contentType[0].equals("video")){
						fileName = "videos/user" + userId + "_" + i + "_" + date + ".mp4";
					}
				i++;
				file.write(path+fileName);
				allFileName += "," + fileName;
				}
			}
			String URL = allFileName.substring(1);
			post.setImageURL(URL);
			
		} catch (IOException e) {
			e.printStackTrace();
		}	catch (ServletException e){
			e.printStackTrace();
		}
		return post;
	}

	//uploadcare
	/*** 
	* single upload
	***/
	public static PostBean singleUpload(RequestContext reqc){
		HttpServletRequest req = (HttpServletRequest)reqc.getRequest();
		PostBean post = new PostBean();
		//変数を準備する
		String caption = req.getParameter("caption");
		String url = req.getParameter("url");
		String userId = null;
		try{
			//userIdはログインnoユーザーID=セッションのユーザーID
			HttpSession session = req.getSession();
			userId = (String)session.getAttribute("userId");
		}catch(IllegalStateException e){//if call on invalidate session
			e.printStackTrace();
			// something
		}
		//ファイルのurlがない場合例外をthrow
		if(url.equals("") || url == null){
			//throw NoFileUploadException();
		}
		//変数をPostBeanにsetする
		post.setCaption(caption);
		post.setUserId(userId);
		post.setImageURL(url);

		return post;
	}
}