import { MenuRootItem } from 'ontimize-web-ngx';
import { AssignmentCardComponent } from './assignment-card/assignment-card.component';
import { EmployeeCardComponent } from './employee-card/employee-card.component';
import { ProjectCardComponent } from './project-card/project-card.component';

export const MENU_CONFIG: MenuRootItem[] = [
  { id: 'home', name: 'HOME', icon: 'donut_large', route: '/main/home' },
  {
    id: 'modules', name: 'MODULES', icon: 'list', opened: true,
    items: [
      { id: 'employees', name: 'EMPLOYEES', icon: 'engineering', route: '/main/employees', component: EmployeeCardComponent},
      { id: 'employeesProjects', name: 'EMPLOYEESPROJECTS', icon: 'addchart', route: '/main/employeesProjects', component: AssignmentCardComponent},
      { id: 'projects', name: 'PROJECTS', icon: 'handyman', route: '/main/projects', component: ProjectCardComponent},
         ]
  },
  { id: 'logout', name: 'LOGOUT', route: '/login', icon: 'power_settings_new', confirm: 'yes' }
];

export const MENU_COMPONENTS = [
  EmployeeCardComponent,
  ProjectCardComponent,
  AssignmentCardComponent
];
