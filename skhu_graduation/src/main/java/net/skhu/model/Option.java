/*
 * 컨트롤러와 뷰 사이에 양방향으로 전달되는 데이터를 모델이라고 부른다.
 * select 태그의 option 태그를 출력하기 위한 데이터를 전달하기 위한 클래스이다.
 * 교수님 강의 자료(mybatis pagination)에 있음
 */
package net.skhu.model;

public class Option {
	int value;
	String label;

	public Option(int value, String label) {
		this.value=value;
		this.label=label;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	public String getLabel() {
		return label;
	}

	public void setLabel(String label) {
		this.label = label;
	}


}
