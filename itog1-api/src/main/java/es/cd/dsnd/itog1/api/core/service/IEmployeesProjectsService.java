package es.cd.dsnd.itog1.api.core.service;

import java.util.List;
import java.util.Map;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

public interface IEmployeesProjectsService {

	 // CANDIDATE
	 public EntityResult EmployeesProjectsQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
	 public EntityResult EmployeesProjectsInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
	 public EntityResult EmployeesProjectsUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult EmployeesProjectsDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;

	}
