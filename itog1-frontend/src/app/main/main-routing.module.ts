import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { AuthGuardService } from 'ontimize-web-ngx';

import { MainComponent } from './main.component';

export const routes: Routes = [
  {
    path: '',
    component: MainComponent,
    canActivate: [AuthGuardService],
    children: [
      { path: '', redirectTo: 'home', pathMatch: 'full' },
      { path: 'home', loadChildren: () => import('./home/home.module').then(m => m.HomeModule) },
      {
        path: 'employees',
        loadChildren: () =>
        import('./employees/employees.module').then(m => m.EmployeesModule)
      },
      {
        path: 'projects',
        loadChildren: () =>
        import('./projects/projects.module').then(m => m.ProjectsModule)
      },
      {
        path: 'employeesProjects',
        loadChildren: () =>
        import('./employees-projects/employees-projects.module').then(m => m.EmployeesProjectsModule)
      }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class MainRoutingModule { }
