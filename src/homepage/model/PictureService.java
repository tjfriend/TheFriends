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
	
	// 댓글 등록
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
	
	// 전체목록
	public List view(String id, int p){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("id", id);
		map.put("start", (p*10)-9);
		map.put("end", p*10);
		List li = ss.selectList("picture.boardpage",map);
		ss.close();
		return li;
	}
	
	// 전체페이지
	public int total(String id){
		SqlSession ss = fac.openSession();
		int a = ss.selectOne("picture.total", id);
		return a%10==0 ? a/10 : a/10+1;
	}
	
	// 좋아요
	public int good(int num){
		SqlSession ss = fac.openSession();
		int a = ss.update("picture.upgood",num);
		return a;
	}
	
	// 조회수
	public int count(int num){
		SqlSession ss = fac.openSession();
		int a = ss.update("picture.upcount",num);
		return a;
	}
	
	// 공개, 비공개
	public List pri(String open, String id){
		SqlSession ss = fac.openSession();
		HashMap map = new HashMap<>();
		map.put("open", open);
		map.put("id", id);
		List li = ss.selectList("picture.private",map);
		ss.close();
		return li;
	}
	
	// 친구
	public List find(String id, String fid){
		SqlSession ss =fac.openSession();
		HashMap map = new HashMap<>();
		map.put("id", id);
		map.put("friend", fid);
		List li = ss.selectList("picture.find",map);
		ss.close();
		return li;
	}
	
	// 좋아요 갯수
	public int goodcount(int num){
		SqlSession ss = fac.openSession();
		HashMap map = ss.selectOne("picture.goodCount",num);
		int  a = ((BigDecimal)map.get("GOOD")).intValue();
		return a;
	}
}
