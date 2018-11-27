import java.io.IOException;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
// import javax.servlet.ServletContext;

@MultipartConfig(fileSizeThreshold=32768,maxFileSize=5242880,maxRequestSize=27262976)
public class servlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {
		request.setCharacterEncoding("Windows-31J");
		String caption = request.getParameter("caption");

		Part part = request.getPart("image");
/*
*		ServletContext servletContext = getServletContext();
*		String contextPath = servletContext.getRealPath(File.separator) + "/post-url/";
*		uploadPhoto(contextPath);
*/
		Upload up = new Upload();
		up.uploadPhoto(part, caption);
	}
}