package es.cd.dsnd.itog1.model.core.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;

@Repository("EmployeesProjectsDao")
@Lazy
@ConfigurationFile(configurationFile = "dao/EmployeesProjectsDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")
public class EmployeesProjectsDao extends OntimizeJdbcDaoSupport{
	
	public static final String ATTR_ID = "id_employee_project";
	 public static final String ATTR_ID_EMPLOYEE = "id_employee";
	 public static final String ATTR_ID_PROJECT = "id_project";
	 public static final String ATTR_EP = "employee_involvement_in_project";
	 public static final String QUERY_DETAILS = "details";
	
}

