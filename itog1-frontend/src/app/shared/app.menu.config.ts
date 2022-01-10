import { MenuRootItem } from 'ontimize-web-ngx';
import { AssignmentCardComponent } from './assignment-card/assignment-card.component';
import { EmployeeCardComponent } from './employee-card/employee-card.component';
import { ProjectCardComponent } from './project-card/project-card.component';

export const MENU_CONFIG: MenuRootItem[] = [
  { id: 'home', name: 'HOME', icon: 'home', route: '/main/home' },
  {
    id: 'modules', name: 'MODULES', icon: 'remove_red_eye', opened: true,
    items: [
      { id: 'employees', name: 'EMPLOYEES', icon: 'people', route: '/main/employees', component: EmployeeCardComponent},
      { id: 'projects', name: 'PROJECTS', icon: 'business_center', route: '/main/projects', component: ProjectCardComponent},
      { id: 'employeesProjects', name: 'EMPLOYEESPROJECTS', icon: 'account_balance', route: '/main/employeesProjects', component: AssignmentCardComponent},
         ]
  },
  { id: 'logout', name: 'LOGOUT', route: '/login', icon: 'power_settings_new', confirm: 'yes' }
];

export const MENU_COMPONENTS = [
  EmployeeCardComponent,
  ProjectCardComponent,
  AssignmentCardComponent
];
