import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { EmployeesProjectsDetailComponent } from '../employees-projects/employees-projects-detail/employees-projects-detail.component';
import { EmployeeAssignmentComponent } from './employee-assignment/employee-assignment.component';
import { EmployeeEditAssignmentComponent } from './employee-edit-assignment/employee-edit-assignment.component';
import { EmployeesDetailComponent } from './employees-detail/employees-detail.component';
import { EmployeesHomeComponent } from './employees-home/employees-home.component';
import { EmployeesNewComponent } from './employees-new/employees-new.component';


const routes: Routes = [
  {
    path: '',
    component: EmployeesHomeComponent
  },
  {
    path: 'new',
    component: EmployeesNewComponent
  },
  {
    path: ':id_employee',
    component: EmployeesDetailComponent,
  },
  {
    path: ':id_employee/new',
    component: EmployeeAssignmentComponent
  },
  {
    path: ':id_employee/:id_employee_project',
    component: EmployeeEditAssignmentComponent
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeesRoutingModule { }
