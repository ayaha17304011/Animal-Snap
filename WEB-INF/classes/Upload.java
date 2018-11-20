import java.io.IOException;

import javax.servlet.http.Part;

public class Upload{
	final String url = "C:/github/Animal-Snap/post-url/";
	DAO dao = new DAO();
	
	public void uploadPhoto(Part part, String caption){
		String fileName = getFileName();
		try{
			part.write(url+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		dao.post(url+fileName, caption);
	}
	public String getFileName(){
		String fileName = "image";
		int i = dao.postCount();
		return fileName + i + ".png";
	}
}