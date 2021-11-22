package es.cd.dsnd.itog1.api.core.service;

import java.util.List;
import java.util.Map;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

public interface IProjectsService {

	 public EntityResult projectQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
	 public EntityResult projectInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
	 public EntityResult projectUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult projectDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;

	}
