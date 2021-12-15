import { MenuRootItem } from 'ontimize-web-ngx';

export const MENU_CONFIG: MenuRootItem[] = [
  { id: 'home', name: 'HOME', icon: 'home', route: '/main/home' },
  {
    id: 'modules', name: 'MODULES', icon: 'remove_red_eye', opened: true,
    items: [
      { id: 'employees', name: 'EMPLOYEES', icon: 'people', route: '/main/employees'},
      { id: 'projects', name: 'PROJECTS', icon: 'business_center', route: '/main/projects'},
      { id: 'employeesProjects', name: 'EMPLOYEESPROJECTS', icon: 'account_balance', route: '/main/employeesProjects'},
         ]
  },
  { id: 'logout', name: 'LOGOUT', route: '/login', icon: 'power_settings_new', confirm: 'yes' }
];
