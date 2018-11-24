package net.skhu.service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

import org.apache.poi.ss.usermodel.DataFormatter;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.springframework.stereotype.Service;

import net.skhu.dto.MySubject;
import net.skhu.dto.ReplaceSubject;
import net.skhu.dto.Subject;

@Service
public class ExcelService {

	// 업로드된 엑셀 파일에서 Subject 객체 목록을 읽어서 리턴하는 메소드
	public List<Subject> getSubjectList(InputStream input) throws Exception {
		List<Subject> subjects = new ArrayList<>();
		DataFormatter formatter = new DataFormatter();

		// 업로드된 엑셀 파일을 읽기 위한 workbook 객체 생성
		Workbook workbook = WorkbookFactory.create(input);

		// 업로드된 파일의 첫번째 시트를 읽기 위한 sheet 객체 생성
		Sheet sheet = workbook.getSheetAt(0);

		for (int r = 1; r < sheet.getPhysicalNumberOfRows() ; ++r) {
			Row row = sheet.getRow(r);		// r번째 행의 데이터를 읽기 위한 row객체 생성
			if (row.getCell(0) == null) break;		// 데이터가 없으면 읽기를 종료
			String year = formatter.formatCellValue(row.getCell(0));
			String semester = formatter.formatCellValue(row.getCell(1));
			String code = formatter.formatCellValue(row.getCell(2));
			String divisionClass = formatter.formatCellValue(row.getCell(3));
			String departmentCode = formatter.formatCellValue(row.getCell(4));
			String subjectName = formatter.formatCellValue(row.getCell(5));
			String completionDivision = formatter.formatCellValue(row.getCell(6));
			String credit = formatter.formatCellValue(row.getCell(7));

			// 읽은 데이터로 객체를 생성하여 목록에 추가
			subjects.add(new Subject(year, semester, code, divisionClass, departmentCode,
					subjectName, completionDivision, credit));
		}
		return subjects;
	}

	// 업로드된 엑셀 파일에서 Subject 객체 목록을 읽어서 리턴하는 메소드
	public List<ReplaceSubject> getReplaceSubjectList(InputStream input) throws Exception {
		List<ReplaceSubject> replaceSubjects = new ArrayList<>();
		DataFormatter formatter = new DataFormatter();

		// 업로드된 엑셀 파일을 읽기 위한 workbook 객체 생성
		Workbook workbook = WorkbookFactory.create(input);

		// 업로드된 파일의 첫번째 시트를 읽기 위한 sheet 객체 생성
		Sheet sheet = workbook.getSheetAt(0);

		for (int r = 1; r < sheet.getPhysicalNumberOfRows() ; ++r) {
			Row row = sheet.getRow(r);		// r번째 행의 데이터를 읽기 위한 row객체 생성
			if (row.getCell(0) == null) break;		// 데이터가 없으면 읽기를 종료
			String subjectCode = formatter.formatCellValue(row.getCell(0));
			String replaceSubject = formatter.formatCellValue(row.getCell(1));
			String completionDivision = formatter.formatCellValue(row.getCell(2));
			
			// 읽은 데이터로 객체를 생성하여 목록에 추가
			replaceSubjects.add(new ReplaceSubject(subjectCode, replaceSubject, completionDivision));
		}
		return replaceSubjects;
	}

	public List<MySubject> getMySubjectList(InputStream input, String userId) throws Exception {
		List<MySubject> mySubjects = new ArrayList<>();
		DataFormatter formatter = new DataFormatter();

		// 업로드된 엑셀 파일을 읽기 위한 workbook 객체 생성
		Workbook workbook = WorkbookFactory.create(input);

		// 업로드된 파일의 첫번째 시트를 읽기 위한 sheet 객체 생성
		Sheet sheet = workbook.getSheetAt(0);

		for (int r = 1; r < sheet.getPhysicalNumberOfRows() ; ++r) {
			Row row = sheet.getRow(r);		// r번째 행의 데이터를 읽기 위한 row객체 생성
			if (row.getCell(0) == null) break;		// 데이터가 없으면 읽기를 종료
			String takeYear = formatter.formatCellValue(row.getCell(0));
			String takeSemester = formatter.formatCellValue(row.getCell(1));
			String subjectCode = formatter.formatCellValue(row.getCell(2));
			String subjectName = formatter.formatCellValue(row.getCell(3));
			String completionDivision = formatter.formatCellValue(row.getCell(4));
			String credit = formatter.formatCellValue(row.getCell(5));
			String score = formatter.formatCellValue(row.getCell(6));

			// 읽은 데이터로 객체를 생성하여 목록에 추가
			mySubjects.add(new MySubject(takeYear, takeSemester, subjectCode, subjectName,
					completionDivision, credit, score, userId));
		}
		return mySubjects;
	}
}
