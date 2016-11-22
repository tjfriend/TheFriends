package notice.model;

import java.text.*;
import java.util.*;

public class ReviewData {
	int num;
	String title;
	String content;
	String id;
	String time;
	int inqutry;
	public int getNum() {   
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getTime() {
		return time;
	}
	public void setTime(Date time) {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		this.time = sdf.format(time);
	}
	public int getInqutry() {
		return inqutry;
	}
	public void setInqutry(int inqutry) {
		this.inqutry = inqutry;
	}

}
