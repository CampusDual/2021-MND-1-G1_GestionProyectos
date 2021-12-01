package es.cd.dsnd.itog1.model.core.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;

import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;

@Repository("ProjectsDao")
@Lazy
@ConfigurationFile(configurationFile = "dao/ProjectsDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")
public class ProjectsDao extends OntimizeJdbcDaoSupport{
	
	 public static final String ATTR_ID = "id";
	 public static final String ATTR_NAME = "name";
	
}

