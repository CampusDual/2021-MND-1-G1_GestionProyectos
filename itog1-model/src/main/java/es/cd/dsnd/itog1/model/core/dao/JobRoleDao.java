package es.cd.dsnd.itog1.model.core.dao;

import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Repository;
import com.ontimize.jee.server.dao.common.ConfigurationFile;
import com.ontimize.jee.server.dao.jdbc.OntimizeJdbcDaoSupport;

@Repository("JobRoleDao")
@Lazy
@ConfigurationFile(configurationFile = "dao/JobRoleDao.xml", configurationFilePlaceholder = "dao/placeholders.properties")

public class JobRoleDao extends OntimizeJdbcDaoSupport{
	public static final String ATTR_JOBNAME= "job_name";
	public static final String ATTR_IDJOB= "id_job";
	}