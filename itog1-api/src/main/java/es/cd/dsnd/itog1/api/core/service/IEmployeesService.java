package es.cd.dsnd.itog1.api.core.service;

import java.util.List;
import java.util.Map;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

public interface IEmployeesService {

	 // Employee
	 public EntityResult employeeQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
	 public EntityResult employeeInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
	 public EntityResult employeeUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult employeeDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;

	}
