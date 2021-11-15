package es.cd.dsnd.itog1.api.core.service;

import java.util.List;
import java.util.Map;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;

public interface IEmployeesService {

	 // Employee
	 public EntityResult employeesQuery(Map<String, Object> keyMap, List<String> attrList) throws OntimizeJEERuntimeException;
	 public EntityResult employeesInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException;
	 public EntityResult employeesUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap) throws OntimizeJEERuntimeException;
	 public EntityResult employeesDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException;

	}
