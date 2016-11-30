package homepage.model;

import java.io.*;
import java.util.*;

import javax.servlet.*;

import org.apache.ibatis.session.*;
import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.web.multipart.*;

@Component
public class SettingService {
	@Autowired
	SqlSessionFactory fac;
	@Autowired
	ServletContext application;
	
	public boolean layout(String id, String homeType){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		switch(homeType){
		case "default":
			homeType = "homeType1";
			break;
		case "picture":
			homeType = "homeType2";
			break;
		case "sns":
			homeType = "homeType3";
			break;
		case "blog":
			homeType = "homeType4";
			break;
		}
		map.put("homeType", homeType);
		int r = ss.update("homepage.layout", map);
		ss.commit();
		ss.close();
		if(r==1){
			return true;
		} else {
			return false;
		}
	}
	
	public List music(String id){
		SqlSession ss = fac.openSession();
		List<HashMap> list = ss.selectList("homepage.music", id);
		ss.close();
		return list;
	}
	
	public boolean musicDelete(String id, String music){
		SqlSession ss = fac.openSession();
		String[] ar = music.split(",");
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		int n = 0;
		for(int i=0; i<ar.length; i++){
			map.put("music", ar[i]);
			n += ss.delete("homepage.musicDelete", map);
		}
		if(n>=0){
			return true;
		} else {
			return false;
		}
	}
	
	public boolean profile(String id, MultipartFile file){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		String uuid = UUID.randomUUID().toString().substring(0, 16);
		map.put("uuid", uuid);
		map.put("name", file.getOriginalFilename());
		try{
			ss.insert("homepage.profile", map);
			ss.commit();
			ss.close();
			String dir = application.getRealPath("/profile");
			File f = new File(dir, uuid);
			file.transferTo(f);
			return true;
		} catch(Exception e){
			ss.rollback();
			ss.close();
			e.printStackTrace();
			return false;
		}
	}
	
	public boolean initial(String id, String board, String picture, String visitors){
		SqlSession ss = fac.openSession();
		HashMap<String, String> map = new HashMap<>();
		map.put("id", id);
		if(board!=null){
			map.put("board", board);
			ss.delete("homepage.initialB", map);
			ss.commit();
		}
		if(picture!=null){
			map.put("picture", picture);
			ss.delete("homepage.initialP", map);
			ss.commit();
		}
		if(visitors!=null){
			map.put("visitors", board);
			ss.delete("homepage.initialV", map);
			ss.commit();
		}
		ss.close();
		return true;
	}
}
