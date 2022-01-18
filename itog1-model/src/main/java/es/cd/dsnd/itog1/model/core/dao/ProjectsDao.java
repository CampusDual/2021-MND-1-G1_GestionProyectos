package es.cd.dsnd.itog1.model.core.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;

@Repository("ProjectsDao")
@Lazy
@ConfigurationFile(configurationFile = "dao/ProjectsDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")
public class ProjectsDao extends OntimizeJdbcDaoSupport{
	
	 public static final String ATTR_ID = "id_project";
	 public static final String ATTR_NAME = "name";
	 public static final String ATTR_STATUS = "status";
	 public static final String ATTR_MANAGER = "manager";
	 public static final String QUERY_DETAILS= "details";
	
}

