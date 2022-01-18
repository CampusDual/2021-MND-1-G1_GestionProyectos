package es.cd.dsnd.itog1.model.core.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;

@Repository("EmployeesDao")
@Lazy
@ConfigurationFile(configurationFile = "dao/EmployeesDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")
public class EmployeesDao extends OntimizeJdbcDaoSupport{
	
	 public static final String ATTR_ID = "id_employee";
	 public static final String ATTR_NAME = "name";
	 public static final String ATTR_SURNAME = "surname";
	 public static final String ATTR_JOB = "job";
	 public static final String QUERY_DETAILS = "details";
	
}

