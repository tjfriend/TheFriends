package board.model;

import java.util.Date;

public class ReviewData {
	int num;
	String title;
	String content;
	String id;
	Date time;
	int inqutry;
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public int getInqutry() {
		return inqutry;
	}
	public void setInqutry(int inqutry) {
		this.inqutry = inqutry;
	}

}
