package net.skhu.model;
/*
 * pagination 로직에 필요한 데이터를 전달하기 위한 클래스
 * getQueryString() : 멤버 변수 값들을 query string 형태로 출력하기 위해 사용된다.
 */
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class Pagination {
	int pg =1; //현재 페이지
	int sz =10;//페이지 당 레코드 수
	int sb; //search by
	String st; //search text
	int recordCount;

	public String getQueryString() {
		String url = null;
		try {
			String temp = (st == null) ? "" : URLEncoder.encode(st, "UTF-8");
			url = String.format("pg=%d&sz=%d&sb=%d&st=%s", pg, sz, sb, temp);
		} catch (UnsupportedEncodingException e) { }
		return url;

	}

	public int getPg() {
		return pg;
	}

	public void setPg(int pg) {
		this.pg = pg;
	}

	public int getSz() {
		return sz;
	}

	public void setSz(int sz) {
		this.sz = sz;
	}

	public int getSb() {
		return sb;
	}

	public void setSb(int sb) {
		this.sb = sb;
	}

	public String getSt() {
		return st;
	}

	public void setSt(String st) {
		this.st = st;
	}

	public int getRecordCount() {
		return recordCount;
	}

	public void setRecordCount(int recordCount) {
		this.recordCount = recordCount;
	}


}
