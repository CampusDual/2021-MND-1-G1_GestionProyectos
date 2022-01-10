import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { EmployeesProjectsDetailComponent } from '../employees-projects/employees-projects-detail/employees-projects-detail.component';
import { ProjectAssignmentComponent } from './project-assignment/project-assignment.component';
import { ProjectEditAssignmentComponent } from './project-edit-assignment/project-edit-assignment.component';
import { ProjectsDetailComponent } from './projects-detail/projects-detail.component';
import { ProjectsHomeComponent } from './projects-home/projects-home.component';
import { ProjectsNewComponent } from './projects-new/projects-new.component';


const routes: Routes = [
  {
    path: '',
    component: ProjectsHomeComponent
  },
  {
    path: 'new',
    component: ProjectsNewComponent
  },
  {
    path: ':id_project',
    component: ProjectsDetailComponent
  },
  {
    path: ':id_project/new',
    component: ProjectAssignmentComponent
  },
  {
    path: ':id_project/:id_employee_project',
    component: ProjectEditAssignmentComponent
  },
 ];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class ProjectsRoutingModule { }
