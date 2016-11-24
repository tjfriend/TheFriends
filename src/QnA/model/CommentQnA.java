package QnA.model;

import java.text.*;
import java.util.Date;

public class CommentQnA {
	int qnanum;
	String id;
	String memo;
	String day;
	int commentnum;
	public int getQnanum() {
		return qnanum;
	}
	public void setQnanum(int qnanum) {
		this.qnanum = qnanum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public String getDay() {
		return day;
	}
	public void setDay(Date day) {
		SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd");
		this.day = sdf.format(day);
	}
	public int getCommentnum() {
		return commentnum;
	}
	public void setCommentnum(int commentnum) {
		this.commentnum = commentnum;
	}

	
}
