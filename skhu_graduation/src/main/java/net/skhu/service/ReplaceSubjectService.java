package net.skhu.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import net.skhu.dto.AdminReplaceListDTO;
import net.skhu.mapper.ReplaceSubjectMapper;
import net.skhu.model.Option;
import net.skhu.model.Pagination;

@Service
public class ReplaceSubjectService {

	@Autowired ReplaceSubjectMapper replaceSubjectMapper;

	public List<AdminReplaceListDTO> findByType(Pagination pagination){
		int count = replaceSubjectMapper.count(pagination);
		pagination.setRecordCount(count);
		return replaceSubjectMapper.findByType(pagination);
	}

	public Option[] getSerachByOptions() {
		return replaceSubjectMapper.searchBy;
	}
}
