package es.cd.dsnd.itog1.api.core.service;

import java.util.List;
import java.util.Map;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

public interface IEmployeesService {

	 public EntityResult employeeQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
	 public EntityResult employeeInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
	 public EntityResult employeeUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult employeeDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult employeeProjectQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
	 public EntityResult employeeProjectInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
	 public EntityResult employeeProjectUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult employeeProjectDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult employeeProjectDetailsQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
//	 public EntityResult employeeProjectDetailsInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
//	 public EntityResult employeeProjectDetailsUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
//	 public EntityResult employeeProjectDetailsDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult jobRoleQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
//	 public EntityResult jobRoleInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
//	 public EntityResult jobRoleUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
//	 public EntityResult jobRoleDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult employeeDetailsQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
	}
