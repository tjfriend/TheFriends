package homepage.model;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.mail.Multipart;
import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component 
public class PictureUploadService {
	@Autowired
	SqlSessionFactory fac;
	
	@Autowired
	ServletContext application;
	
	public int upload(String id, String title, String content, MultipartFile picture, String uuid){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		String name = picture.getOriginalFilename();
		map.put("id", id);
		map.put("title", title);
		map.put("content", content);
		map.put("picture", name);
		map.put("uuid", uuid);
		try{
			ss.insert("picture.upload",map);
			ss.close();    
			return 1;
		}catch(Exception e){
			e.printStackTrace();
			ss.rollback();
			ss.close();
			return 0;
		}
	}
	
	// 서버에 저장
	public String execute(MultipartFile picture){
		if(picture.isEmpty()){
			return null;
		}
		try{
			String uuid = UUID.randomUUID().toString();
			String filename = uuid.substring(0,23);
			String fileDir = application.getRealPath("/files");
			File file = new File(fileDir, filename);
			picture.transferTo(file);
			return filename;
		}catch(Exception e){
			e.printStackTrace();
			return null;
		}
	}
	
	// 전체 목록
	public List view(String id){
		SqlSession ss = fac.openSession();
		List li = ss.selectList("picture.view",id);
		ss.close();
		return li;
	}
	

}
