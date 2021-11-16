package es.cd.dsnd.itog1.model.core.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import es.cd.dsnd.itog1.api.core.service.IEmployeesService;
import es.cd.dsnd.itog1.model.core.dao.EmployeesDao;
import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;



@Lazy
@Service("EmployeesService")
public class EmployeesService implements IEmployeesService {

	@Autowired
	private EmployeesDao employeesDao;

	@Autowired
	private DefaultOntimizeDaoHelper daoHelper;

	@Override
	public EntityResult employeeQuery(Map<String, Object> keyMap, List<String> attrList)
			throws OntimizeJEERuntimeException {
		return this.daoHelper.query(this.employeesDao, keyMap, attrList);
	}

	@Override
	public EntityResult employeeInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
		  return this.daoHelper.insert(this.employeesDao, attrMap);
	}

	@Override
	public EntityResult employeeUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap)
			throws OntimizeJEERuntimeException {
		  return this.daoHelper.update(this.employeesDao, attrMap, keyMap);
	}

	@Override
	public EntityResult employeeDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
		  return this.daoHelper.delete(this.employeesDao, keyMap);
	}

}
