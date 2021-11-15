package es.cd.dsnd.itog1.api.core.service;

import java.util.List;
import java.util.Map;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

public interface IProjectsService {

	 // CANDIDATE
	 public EntityResult projectsQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
	 public EntityResult projectsInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
	 public EntityResult projectsUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult projectsDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;

	}
