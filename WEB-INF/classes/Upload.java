import java.io.IOException;
import java.io.File;
import java.io.InputStream;
import java.io.FileOutputStream;

import javax.servlet.http.Part;

public class Upload{
	final byte[] buff=new byte[4*1024];
	final String url = "C:/LittlePlayground/uploadTest/image/";
	
	InputStream input;
	FileOutputStream output;
	int read = 0;
	DAO dao = new DAO();
	
	public void uploadPhoto(Part part, String caption){
		String fileName = getFileName();
		try{
			input = part.getInputStream();
			File file = new File(url+fileName);
			output = new FileOutputStream(file);
			while((read = input.read(buff)) != -1) {
				output.write(buff, 0, read);
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try{
				if (output != null) {
					output.close();
				}
				if (input != null) {
					input.close();
				}
			}catch(IOException e){
				e.printStackTrace();
			}
		}
		dao.post(url+fileName, caption);
	}
	public String getFileName(){
		String fileName = "image";
		int i = dao.postCount();
		return fileName + i + ".png";
	}
}