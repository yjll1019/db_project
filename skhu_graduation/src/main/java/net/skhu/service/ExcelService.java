package net.skhu.service;

import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

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

			// 업로드된 엑셀 파일을 읽기 위한 workbook 객체 생성
			Workbook workbook = WorkbookFactory.create(input);

			// 업로드된 파일의 첫번째 시트를 읽기 위한 sheet 객체 생성
			Sheet sheet = workbook.getSheetAt(0);

			for (int r = 1; r < sheet.getPhysicalNumberOfRows() ; ++r) {
				Row row = sheet.getRow(r);		// r번째 행의 데이터를 읽기 위한 row객체 생성
				if (row.getCell(0) == null) break;		// 데이터가 없으면 읽기를 종료
				String year = row.getCell(0).getStringCellValue();
				String semester = row.getCell(1).getStringCellValue();
				String code = row.getCell(2).getStringCellValue();
				String divisionClass = row.getCell(3).getStringCellValue();
				int departmentCode = (int)row.getCell(4).getNumericCellValue();
				String subjectName = row.getCell(5).getStringCellValue();
				String completionDivision = row.getCell(6).getStringCellValue();
				int credit = (int)row.getCell(7).getNumericCellValue();

				// 읽은 데이터로 객체를 생성하여 목록에 추가
				subjects.add(new Subject(year, semester, code, divisionClass, departmentCode,
						subjectName, completionDivision, credit));
			}
			return subjects;
		}

		// 업로드된 엑셀 파일에서 Subject 객체 목록을 읽어서 리턴하는 메소드
				public List<ReplaceSubject> getReplaceSubjectList(InputStream input) throws Exception {
					List<ReplaceSubject> replaceSubjects = new ArrayList<>();

					// 업로드된 엑셀 파일을 읽기 위한 workbook 객체 생성
					Workbook workbook = WorkbookFactory.create(input);

					// 업로드된 파일의 첫번째 시트를 읽기 위한 sheet 객체 생성
					Sheet sheet = workbook.getSheetAt(0);

					for (int r = 1; r < sheet.getPhysicalNumberOfRows() ; ++r) {
						Row row = sheet.getRow(r);		// r번째 행의 데이터를 읽기 위한 row객체 생성
						if (row.getCell(0) == null) break;		// 데이터가 없으면 읽기를 종료
						String subjectCode = row.getCell(0).getStringCellValue();
						String replaceSubject = row.getCell(1).getStringCellValue();

						// 읽은 데이터로 객체를 생성하여 목록에 추가
						replaceSubjects.add(new ReplaceSubject(subjectCode, replaceSubject));
					}
					return replaceSubjects;
				}

				// 업로드된 엑셀 파일에서 Subject 객체 목록을 읽어서 리턴하는 메소드
				public List<MySubject> getMySubjectList(InputStream input, String userId) throws Exception {
					List<MySubject> mySubjects = new ArrayList<>();

					// 업로드된 엑셀 파일을 읽기 위한 workbook 객체 생성
					Workbook workbook = WorkbookFactory.create(input);

					// 업로드된 파일의 첫번째 시트를 읽기 위한 sheet 객체 생성
					Sheet sheet = workbook.getSheetAt(0);

					for (int r = 1; r < sheet.getPhysicalNumberOfRows() ; ++r) {
						Row row = sheet.getRow(r);		// r번째 행의 데이터를 읽기 위한 row객체 생성
						if (row.getCell(0) == null) break;		// 데이터가 없으면 읽기를 종료
						String takeYear = row.getCell(0).getStringCellValue();
						String takeSemester = row.getCell(1).getStringCellValue();
						String subjectCode = row.getCell(2).getStringCellValue();
						String subjectName = row.getCell(3).getStringCellValue();
						String completionDivision = row.getCell(5).getStringCellValue();
						String credit = row.getCell(6).getStringCellValue();
						String score = row.getCell(7).getStringCellValue();

						// 읽은 데이터로 객체를 생성하여 목록에 추가
						mySubjects.add(new MySubject(takeYear, takeSemester, subjectCode, subjectName,
								completionDivision, credit, score, userId));
					}
					return mySubjects;
				}
}
