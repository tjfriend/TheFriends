package board.model;

import java.text.*;
import java.util.*;

public class ReviewData {
	int num;
	String title;
	String content;
	String id;
	String time;
	int inquiry;
	String category;
	public int getNum() {
		return num;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
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
	public int getInquiry() {
		return inquiry;
	}
	public void setInquiry(int inquiry) {
		this.inquiry = inquiry;
	}

}
