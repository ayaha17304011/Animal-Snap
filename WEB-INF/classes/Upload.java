import java.io.IOException;

import javax.servlet.http.Part;

public class Upload{
	DAO dao = new DAO();
	
	public void uploadPhoto(Part part, String caption){
		String fileName = getFileName(part);
		try{
			part.write(path+fileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		dao.post(path+fileName, caption);
	}
	public String getFileName(Part part){
		String fileName = null;
		String contentType = part.getContentType();
		//contentType = FileType / FileFormat => image/png
		//s[0] = image, s[1] = png
		String[] s = contentType.split("/");
		System.out.println(part.getContentType());
		//postTest　Tableの行をCount
		int i = dao.postCount();
		//image_1.png
		fileName = s[0] + "_" + i + "." + s[1];
		
		return fileName;
	}
}