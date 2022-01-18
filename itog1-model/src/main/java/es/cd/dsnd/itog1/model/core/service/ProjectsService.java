package es.cd.dsnd.itog1.model.core.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Lazy;
import org.springframework.stereotype.Service;

import es.cd.dsnd.itog1.api.core.service.IProjectsService;
import es.cd.dsnd.itog1.model.core.dao.ProjectStatusDao;
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
	
	@Autowired
	private ProjectStatusDao projectStatusDao;

	@Override
	public EntityResult projectQuery(Map<String, Object> keyMap, List<String> attrList)
			throws OntimizeJEERuntimeException {
		return this.daoHelper.query(this.projectsDao, keyMap, attrList);
	}

	@Override
	public EntityResult projectInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
		  return this.daoHelper.insert(this.projectsDao, attrMap);
	}

	@Override
	public EntityResult projectUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap)
			throws OntimizeJEERuntimeException {
		  return this.daoHelper.update(this.projectsDao, attrMap, keyMap);
	}

	@Override
	public EntityResult projectDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
		  return this.daoHelper.delete(this.projectsDao, keyMap);
	}
	
	@Override
	public EntityResult projectStatusQuery(Map<String, Object> keyMap, List<String> attrList)
			throws OntimizeJEERuntimeException {
		return this.daoHelper.query(this.projectStatusDao, keyMap, attrList);
	}

//	@Override
//	public EntityResult projectStatusInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
//		  return this.daoHelper.insert(this.projectStatusDao, attrMap);
//	}
//
//	@Override
//	public EntityResult projectStatusUpdate(Map<String, Object> attrMap, Map<String, Object> keyMap)
//			throws OntimizeJEERuntimeException {
//		  return this.daoHelper.update(this.projectStatusDao, attrMap, keyMap);
//	}
//
//	@Override
//	public EntityResult projectStatusDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
//		  return this.daoHelper.delete(this.projectStatusDao, keyMap);
//	}
//	
	@Override
	public EntityResult projectDetailsQuery(Map<String, Object> keyMap, List<String> attrList)
			throws OntimizeJEERuntimeException {
		return this.daoHelper.query(this.projectsDao, keyMap, attrList, ProjectsDao.QUERY_DETAILS);
	}
	
//	@Override
//	public EntityResult projectDetailsInsert(Map<String, Object> attrMap) throws OntimizeJEERuntimeException {
//		  return this.daoHelper.insert(this.projectsDao, attrMap);
//	}
//	
//	@Override
//	public EntityResult projectDetailsUpdate(Map<String, Object> keyMap, List<String> attrList)
//			throws OntimizeJEERuntimeException {
//		return this.daoHelper.query(this.projectsDao, keyMap, attrList, ProjectsDao.QUERY_DETAILS);
//	}
//	
//	@Override
//	public EntityResult projectDetailsDelete(Map<String, Object> keyMap) throws OntimizeJEERuntimeException {
//		  return this.daoHelper.delete(this.projectsDao, keyMap);
//	}

}
