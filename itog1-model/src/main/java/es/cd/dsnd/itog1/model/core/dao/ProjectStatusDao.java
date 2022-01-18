package es.cd.dsnd.itog1.model.core.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;

@Repository("ProjectStatusDao")
@Lazy
@ConfigurationFile(configurationFile = "dao/ProjectStatusDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")

public class ProjectStatusDao extends OntimizeJdbcDaoSupport{
	
	public static final String ATTR_STATUSNAME= "status_name";
	public static final String ATTR_IDSTATUS= "id_status";
	
	}