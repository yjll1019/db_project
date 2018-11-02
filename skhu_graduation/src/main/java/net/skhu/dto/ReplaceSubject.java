package net.skhu.dto;

public class ReplaceSubject {
	int id;
	String subjectCode;
	String replaceSubject;
	/* 과목코드가 아닌 경우
	 * 1인 경우 전공선택과목으로 대체
	 * 2인 경우 경제학전공과목에서 대체
	 * 3인 경우 교양사회영역 선택과목으로 대체
	 * 4인 경우 교양선택과목으로 대체
	 * 5인 경우 교양인문영역 선택과목으로 대체
	 * 6인 경우 교양자연영역 선택과목으로 대체
	 * 7인 경우 사회진출실 개설 교과목으로 대체
	 * 8인 경우 사회학전공과목에서 선택
	 * 9인 경우 정치학전공과목에서 선택
	*/

	public ReplaceSubject(String subjectCode, String replaceSubject) {
		this.subjectCode = subjectCode;
		this.replaceSubject = replaceSubject;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSubjectCode() {
		return subjectCode;
	}

	public void setSubjectCode(String subjectCode) {
		this.subjectCode = subjectCode;
	}

	public String getReplaceSubject() {
		return replaceSubject;
	}

	public void setReplaceSubject(String replaceSubject) {
		this.replaceSubject = replaceSubject;
	}

}
