package homepage.model;

import java.io.File;
import java.math.BigDecimal;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.mail.Multipart;
import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Component 
public class PictureService {
	@Autowired
	SqlSessionFactory fac;
	
	@Autowired
	ServletContext application;
	
	// ��� ���
	public int upload(String id, String title, String content, MultipartFile picture, String uuid, String open){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		String name = picture.getOriginalFilename();
		map.put("id", id);
		map.put("title", title);
		map.put("content", content);
		map.put("picture", name);
		map.put("uuid", uuid);
		map.put("open", open);
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
	
	// ������ ����
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
	
	// ��ü���
	public List view(String id, int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("id", id);
//		map.put("start", (p*10)-9);
//		map.put("end", p*10);
		List<HashMap> list = ss.selectList("picture.boardpage",map);
		for(int i=0; i<list.size(); i++){
			list.get(i).put("ran", Math.random());
		}
		ss.close();
		return list;
	}
	
	// ģ������
	public List viewFriend(String id, int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
//		map.put("start", (p*10)-9);
//		map.put("end", p*10);
		List<HashMap> list = ss.selectList("picture.viewFriend", map);
		for(int i=0; i<list.size(); i++){
			list.get(i).put("ran", Math.random());
		}
		return list;
	}
	
	// ��ü����
	public List viewAll(String id, int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
//		map.put("start", (p*10)-9);
//		map.put("end", p*10);
		List<HashMap> list = ss.selectList("picture.viewAll", map);
		for(int i=0; i<list.size(); i++){
			list.get(i).put("ran", Math.random());
		}
		return list;
	}
	
	// ��ü������
	public int total(String id){
		SqlSession ss = fac.openSession();
		int a = ss.selectOne("picture.total", id);
		return a%10==0 ? a/10 : a/10+1;
	}
	
	// ���ƿ�
	public int good(int num){
		SqlSession ss = fac.openSession();
		int a = ss.update("picture.upgood",num);
		ss.commit();
		ss.close();
		return a;
	}
	
	// ��ȸ��
	public int count(int num){
		SqlSession ss = fac.openSession();
		int a = ss.update("picture.upcount",num);
		ss.commit();
		ss.close();
		return a;
	}
	
	// ����, �����
	public List pri(String open, String id){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("open", open);
		map.put("id", id);
		List li = ss.selectList("picture.private",map);
		ss.close();
		return li;
	}
	
	// ģ��
	public List find(String id, String fid){
		SqlSession ss =fac.openSession();
		HashMap map = new HashMap<>();
		map.put("id", id);
		map.put("friend", fid);
		List li = ss.selectList("picture.find",map);
		ss.close();
		return li;
	}
	
	// ���ƿ� ����
	public int goodcount(int num){
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("picture.goodCount",num);
		int  a = ((BigDecimal)map.get("GOOD")).intValue();
		return a;
	}
}
