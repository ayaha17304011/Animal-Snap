import java.io.IOException;
import java.io.File;
import java.io.InputStream;
import java.io.FileOutputStream;
import javax.servlet.annotation.MultipartConfig;
import java.io.PrintWriter;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletException;
import javax.servlet.http.Part;
@MultipartConfig(fileSizeThreshold=32768,maxFileSize=5242880,maxRequestSize=27262976)
public class servlet extends HttpServlet{
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws IOException, ServletException {
		request.setCharacterEncoding("Windows-31J");
		String caption = request.getParameter("caption");
		Part part = request.getPart("image");
		Upload up = new Upload();
		up.uploadPhoto(part, caption);
	}
}