package QnA.model;

import java.util.Date;

public class CommentQnA {
	int qnanum;
	String id;
	String memo;
	Date day;

	public int getqnanum() {
		return qnanum;
	}

	public void setqnanum(int qnanum) {
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

	public Date getDay() {
		return day;
	}

	public void setDay(Date day) {
		this.day = day;
	}

}
