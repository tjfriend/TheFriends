package notice.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestParam;

import java.text.SimpleDateFormat;
import java.util.*;

@Component
public class noticewrite {

	@Autowired
	SqlSessionFactory fac;

	public int noticewrite(String id, String title, String content) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("id", id);
		map.put("title", title);
		map.put("content", content);
		try{
			int w = sql.insert("notice.write", map);
			sql.commit();
			sql.close();
			return w;
		} catch(Exception e){
			e.printStackTrace();
			sql.rollback();
			sql.close();
			return -1;
		}

	}

	// ��ȸ�� ����
	public int upinquiry(int num) {
		HashMap map = new HashMap();
		map.put("num", num);
		SqlSession sql = fac.openSession();
		int up = sql.update("notice.upinqu", map);
		sql.commit();
		sql.close();
		return up;

	}

	// ��ۼ���
	public int CommentAdjust(String memo, int commentnum) {
		HashMap map = new HashMap();
		map.put("commentnum", commentnum);
		map.put("memo", memo);
		SqlSession sql = fac.openSession();
		int li = sql.update("notice.noticecommentupdate", map);
		sql.commit();
		sql.close();
		return li;
	}

	// �Խñ� ����
	public List num(int num) {
		SqlSession sql = fac.openSession();
		HashMap map = new HashMap();
		map.put("num", num);
		List<HashMap> li = sql.selectList("notice.noticedetails", map);
		sql.close();
		for(int i=0; i<li.size(); i++){
			Date date = (Date)li.get(i).get("TIME");
			SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
			String time = sdf.format(date);
			li.get(i).put("TIME", time);
			li.set(i, li.get(i));
		}
		return li;

	}
	public int Adjust(int num, String content,String title){
		HashMap map = new HashMap();
			map.put("num", num);
			map.put("title", title);
			map.put("content", content);
		SqlSession sql = fac.openSession();
		int li = sql.update("notice.noticeadjust",map);
		sql.close();
		return li;
	}
	
	public int comment(@RequestParam int num, String id, String memo) {
		HashMap<String, Object> map = new HashMap<>();
		map.put("num", num);
		map.put("id", id);
		map.put("memo", memo);
		SqlSession sql = fac.openSession();
		try {
			int rst = sql.insert("notice.noticecomment", map);
			sql.commit();
			sql.close();
			return rst;

		} catch (Exception e) {
			e.printStackTrace();
			sql.rollback();
			sql.close();
			return -1;
		}
	}
	// ������ ã��
	public List membernickname(String id){
		SqlSession sql = fac.openSession();
		List r = sql.selectList("notice.member",id);
		sql.close();
		return r;
	}

}
