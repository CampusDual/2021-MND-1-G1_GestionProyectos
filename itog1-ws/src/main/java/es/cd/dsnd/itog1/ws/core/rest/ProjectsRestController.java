package es.cd.dsnd.itog1.ws.core.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import es.cd.dsnd.itog1.api.core.service.IProjectsService;
import com.ontimize.jee.server.rest.ORestController;

@RestController
@RequestMapping("/projects")
public class ProjectsRestController extends ORestController<IProjectsService> {

 @Autowired
 private IProjectsService projectsService;

 @Override
 public IProjectsService getService() {
  return this.projectsService;
 }

}