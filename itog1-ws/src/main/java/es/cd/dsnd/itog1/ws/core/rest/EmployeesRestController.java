package es.cd.dsnd.itog1.ws.core.rest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import es.cd.dsnd.itog1.api.core.service.IEmployeesService;
import com.ontimize.jee.server.rest.ORestController;

@RestController
@RequestMapping("/employees")
public class EmployeesRestController extends ORestController<IEmployeesService> {

 @Autowired
 private IEmployeesService employeesService;

 @Override
 public IEmployeesService getService() {
  return this.employeesService;
 }

}