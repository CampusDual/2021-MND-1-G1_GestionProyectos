package es.cd.dsnd.itog1.model.core.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import es.cd.dsnd.itog1.api.core.service.IEmployeesService;
import es.cd.dsnd.itog1.model.core.dao.EmployeesDao;
import es.cd.dsnd.itog1.model.core.dao.EmployeesProjectsDao;
import es.cd.dsnd.itog1.model.core.dao.ProjectsDao;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.dto.EntityResultMapImpl;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;

@Lazy
@Service("EmployeesService")
public class EmployeesService implements IEmployeesService {

	@Autowired
	private EmployeesDao employeesDao;

	@Autowired
	private EmployeesProjectsDao employeesProjectsDao;

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

	@Override
	public EntityResult employeeProjectQuery(Map<String, Object> keyMap, List<String> attrList)
			throws OntimizeJEERuntimeException {
		return this.daoHelper.query(this.employeesProjectsDao, keyMap, attrList);
	}

//	@Override
//	public EntityResult employeeProjectInsert(Map<String, Object> attrMap) 
//			throws OntimizeJEERuntimeException {
//	return this.daoHelper.insert(this.employeesProjectsDao, attrMap);
//	}
//	
	@Override
	public EntityResult employeeProjectInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
		Map<String, Object> employee_id = new HashMap<String, Object>();
		employee_id.put(EmployeesProjectsDao.ATTR_ID_EMPLOYEE, attrMap.get(EmployeesProjectsDao.ATTR_ID_EMPLOYEE));
		List<String> projectList = new ArrayList<String>();
		projectList.add(EmployeesProjectsDao.ATTR_ID_PROJECT);
		projectList.add(EmployeesProjectsDao.ATTR_EP);
		EntityResult employeeProjectQuery = this.employeeProjectQuery(employee_id, projectList);

		if (employeeProjectQuery.getCode() != EntityResult.OPERATION_WRONG
				&& employeeProjectQuery.calculateRecordNumber() > 0) {
			List<Integer> object = (List<Integer>) employeeProjectQuery.get(EmployeesProjectsDao.ATTR_EP);
			int suma = 0;
			for (int actual : object) {
				suma += actual;
			}
			int value = Integer.parseInt(attrMap.get(EmployeesProjectsDao.ATTR_EP).toString());
			suma = suma + value;
			if (suma <= 100) {
				return this.daoHelper.insert(this.employeesProjectsDao, attrMap);
			} else {
				EntityResult toret = new EntityResultMapImpl();
				toret.setCode(EntityResult.OPERATION_WRONG);
				toret.setMessage("La suma del % de implicación de un empleado no puede superar el 100%. Carga de trabajo actual: "
						+ (suma - value) + "%. Límite de asignación: " + (100-(suma-value)) + "%.");
				return toret;
			}

		} else {
			if (employeeProjectQuery.getCode() == EntityResult.OPERATION_WRONG) {
				return employeeProjectQuery;
			} else {
				int value = Integer.parseInt(attrMap.get(EmployeesProjectsDao.ATTR_EP).toString());
				if (value <= 100) {
					return this.daoHelper.insert(this.employeesProjectsDao, attrMap);
				} else {
					EntityResult toret = new EntityResultMapImpl();
					toret.setCode(EntityResult.OPERATION_WRONG);
					toret.setMessage("La suma del % de implicación de un empleado no puede superar el 100%");
					return toret;
				}
			}
		}
	}

//	@Override
//	public EntityResult employeeProjectUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap)
//			throws OntimizeJEERuntimeException {
//		  return this.daoHelper.update(this.employeesProjectsDao, attrMap, keyMap);
//	}

	@Override
	public EntityResult employeeProjectUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap)
			throws OntimizeJEERuntimeException {

		List<String> attr_employee_id = new ArrayList<String>();
		attr_employee_id.add(EmployeesProjectsDao.ATTR_ID_EMPLOYEE);
		attr_employee_id.add(EmployeesProjectsDao.ATTR_ID_PROJECT);
		EntityResult employeeIdER = this.employeeProjectQuery(keyMap, attr_employee_id);
		if (employeeIdER.getCode() != EntityResult.OPERATION_WRONG && employeeIdER.calculateRecordNumber() == 1) {

			int idEmployeeInt = Integer
					.parseInt(employeeIdER.getRecordValues(0).get(EmployeesProjectsDao.ATTR_ID_EMPLOYEE).toString());
			int idProjectInt = Integer
					.parseInt(employeeIdER.getRecordValues(0).get(EmployeesProjectsDao.ATTR_ID_PROJECT).toString());

			Map<String, Object> employeeId = new HashMap<>();
			employeeId.put(EmployeesProjectsDao.ATTR_ID_EMPLOYEE, idEmployeeInt);
			List<String> projectList = new ArrayList<>();
			projectList.add(EmployeesProjectsDao.ATTR_ID_PROJECT);
			projectList.add(EmployeesProjectsDao.ATTR_EP);
			EntityResult employeeProjectQuery = this.employeeProjectQuery(employeeId, projectList);

			if (employeeProjectQuery.getCode() != EntityResult.OPERATION_WRONG
					&& employeeProjectQuery.calculateRecordNumber() > 0) {
				int suma = 0;
				for (int i = 0; i < employeeProjectQuery.calculateRecordNumber(); i++) {
					Map recordValues = employeeProjectQuery.getRecordValues(i);
					if (Integer.parseInt(recordValues.get(EmployeesProjectsDao.ATTR_ID_PROJECT).toString()) != idProjectInt) {
						int load = Integer.parseInt(recordValues.get(EmployeesProjectsDao.ATTR_EP).toString());
						suma += load;
					}
				}
				int value = Integer.parseInt(attrMap.get(EmployeesProjectsDao.ATTR_EP).toString());
				suma = suma + value;
				if (suma <= 100) {
					return this.daoHelper.update(this.employeesProjectsDao, attrMap, keyMap);
				} else {
					EntityResult toret = new EntityResultMapImpl();
					toret.setCode(EntityResult.OPERATION_WRONG);
					toret.setMessage("La suma del % de implicación de un empleado no puede superar el 100%. Carga de trabajo actual: "
							+ (suma - value) + "%. Límite de asignación: " + (100-(suma-value)) + "%.");
					return toret;
				}
			} else {
				return employeeProjectQuery;
			}
		} else {
			EntityResult toret = new EntityResultMapImpl();
			toret.setCode(EntityResult.OPERATION_WRONG);
			toret.setMessage("Se ha producido un error durante la consulta del empleado");
			return toret;
		}
	}

	@Override
	public EntityResult employeeProjectDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
		return this.daoHelper.delete(this.employeesProjectsDao, keyMap);
	}

	@Override
	public EntityResult employeeProjectDetailsQuery(Map<String, Object> keyMap, List<String> attrList)
			throws OntimizeJEERuntimeException {
		return this.daoHelper.query(this.employeesProjectsDao, keyMap, attrList, EmployeesProjectsDao.QUERY_DETAILS);
	}

//	@Override
//	public EntityResult employeeProjectDetailsInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
//		Map<String, Object> employee_id = new HashMap<String, Object>();
//		employee_id.put(EmployeesProjectsDao.ATTR_ID_EMPLOYEE, attrMap.get(EmployeesProjectsDao.ATTR_ID_EMPLOYEE));
//		List<String> projectList = new ArrayList<String>();
//		projectList.add(EmployeesProjectsDao.ATTR_ID_PROJECT);
//		projectList.add(EmployeesProjectsDao.ATTR_EP);
//		EntityResult employeeProjectQuery = this.employeeProjectQuery(employee_id, projectList);
//
//		if (employeeProjectQuery.getCode() != EntityResult.OPERATION_WRONG
//				&& employeeProjectQuery.calculateRecordNumber() > 0) {
//			List<Integer> object = (List<Integer>) employeeProjectQuery.get(EmployeesProjectsDao.ATTR_EP);
//			int suma = 0;
//			for (int actual : object) {
//				suma += actual;
//			}
//			int value = Integer.parseInt(attrMap.get(EmployeesProjectsDao.ATTR_EP).toString());
//			suma = suma + value;
//			if (suma <= 100) {
//				return this.daoHelper.insert(this.employeesProjectsDao, attrMap);
//			} else {
//				EntityResult toret = new EntityResultMapImpl();
//				toret.setCode(EntityResult.OPERATION_WRONG);
//				toret.setMessage("La suma del % de implicación de un empleado no puede superar el 100%");
//				return toret;
//			}
//
//		} else {
//			if (employeeProjectQuery.getCode() == EntityResult.OPERATION_WRONG) {
//				return employeeProjectQuery;
//			} else {
//				int value = Integer.parseInt(attrMap.get(EmployeesProjectsDao.ATTR_EP).toString());
//				if (value <= 100) {
//					return this.daoHelper.insert(this.employeesProjectsDao, attrMap);
//				} else {
//					EntityResult toret = new EntityResultMapImpl();
//					toret.setCode(EntityResult.OPERATION_WRONG);
//					toret.setMessage("La suma del % de implicación de un empleado no puede superar el 100%");
//					return toret;
//				}
//			}
//		}
//	}

//@Override
//public EntityResult employeeProjectDetailsUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap)
//		throws OntimizeJEERuntimeException {
//
//	List<String> attr_employee_id = new ArrayList<String>();
//	attr_employee_id.add(EmployeesProjectsDao.ATTR_ID_EMPLOYEE);
//	attr_employee_id.add(EmployeesProjectsDao.ATTR_ID_PROJECT);
//	EntityResult employeeIdER = this.employeeProjectQuery(keyMap, attr_employee_id);
//	if (employeeIdER.getCode() != EntityResult.OPERATION_WRONG && employeeIdER.calculateRecordNumber() == 1) {
//
//		int idEmployeeInt = Integer
//				.parseInt(employeeIdER.getRecordValues(0).get(EmployeesProjectsDao.ATTR_ID_EMPLOYEE).toString());
//		int idProjectInt = Integer
//				.parseInt(employeeIdER.getRecordValues(0).get(EmployeesProjectsDao.ATTR_ID_PROJECT).toString());
//
//		Map<String, Object> employeeId = new HashMap<>();
//		employeeId.put(EmployeesProjectsDao.ATTR_ID_EMPLOYEE, idEmployeeInt);
//		List<String> projectList = new ArrayList<>();
//		projectList.add(EmployeesProjectsDao.ATTR_ID_PROJECT);
//		projectList.add(EmployeesProjectsDao.ATTR_EP);
//		EntityResult employeeProjectQuery = this.employeeProjectQuery(employeeId, projectList);
//
//		if (employeeProjectQuery.getCode() != EntityResult.OPERATION_WRONG
//				&& employeeProjectQuery.calculateRecordNumber() > 0) {
//			int suma = 0;
//			for (int i = 0; i < employeeProjectQuery.calculateRecordNumber(); i++) {
//				Map recordValues = employeeProjectQuery.getRecordValues(i);
//				if (Integer.parseInt(recordValues.get(EmployeesProjectsDao.ATTR_ID_PROJECT).toString()) != idProjectInt) {
//					int load = Integer.parseInt(recordValues.get(EmployeesProjectsDao.ATTR_EP).toString());
//					suma += load;
//				}
//			}
//			int value = Integer.parseInt(attrMap.get(EmployeesProjectsDao.ATTR_EP).toString());
//			suma = suma + value;
//			if (suma <= 100) {
//				return this.daoHelper.update(this.employeesProjectsDao, attrMap, keyMap);
//			} else {
//				EntityResult toret = new EntityResultMapImpl();
//				toret.setCode(EntityResult.OPERATION_WRONG);
//				toret.setMessage("La suma del % de implicación de un empleado no puede superar el 100%. Carga de trabajo actual: "
//						+ (suma - value) + "%. Límite de asignación: " + (100-(suma-value)) + "%.");
//				return toret;
//			}
//		} else {
//			return employeeProjectQuery;
//		}
//	} else {
//		EntityResult toret = new EntityResultMapImpl();
//		toret.setCode(EntityResult.OPERATION_WRONG);
//		toret.setMessage("Se ha producido un error durante la consulta del empleado");
//		return toret;
//	}
//}

//@Override
//public EntityResult employeeProjectDetailsDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
//	return this.daoHelper.delete(this.employeesProjectsDao, keyMap);
//}

}
