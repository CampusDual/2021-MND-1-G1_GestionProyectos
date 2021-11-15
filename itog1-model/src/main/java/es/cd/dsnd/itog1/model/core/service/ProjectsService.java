package es.cd.dsnd.itog1.model.core.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import es.cd.dsnd.itog1.api.core.service.IProjectsService;
import es.cd.dsnd.itog1.model.core.dao.ProjectsDao;

import com.ontimize.jee.common.dto.EntityResult;
import com.ontimize.jee.common.exceptions.OntimizeJEERuntimeException;
import com.ontimize.jee.server.dao.DefaultOntimizeDaoHelper;



@Lazy
@Service("ProjectsService")
public class ProjectsService implements IProjectsService {

	@Autowired
	private ProjectsDao projectsDao;

	@Autowired
	private DefaultOntimizeDaoHelper daoHelper;

	@Override
	public EntityResult projectsQuery(Map<String, Object> keyMap, List<String> attrList)
			throws OntimizeJEERuntimeException {
		return this.daoHelper.query(this.projectsDao, keyMap, attrList);
	}

	@Override
	public EntityResult projectsInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
		  return this.daoHelper.insert(this.projectsDao, attrMap);
	}

	@Override
	public EntityResult projectsUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap)
			throws OntimizeJEERuntimeException {
		  return this.daoHelper.update(this.projectsDao, attrMap, keyMap);
	}

	@Override
	public EntityResult projectsDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
		  return this.daoHelper.delete(this.projectsDao, keyMap);
	}

}
