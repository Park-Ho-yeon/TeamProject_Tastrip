package dto;

public class Notice_dto {

	String n_no, title, content, reg_date, reg_id;

	public Notice_dto(String n_no, String title, String content, String reg_date, String reg_id) {
		super();
		this.n_no = n_no;
		this.title = title;
		this.content = content;
		this.reg_date = reg_date;
		this.reg_id = reg_id;
	}

	public String getN_no() {
		return n_no;
	}

	public void setN_no(String n_no) {
		this.n_no = n_no;
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

	public String getReg_date() {
		return reg_date;
	}

	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}

	public String getReg_id() {
		return reg_id;
	}

	public void setReg_id(String reg_id) {
		this.reg_id = reg_id;
	}
	
}
