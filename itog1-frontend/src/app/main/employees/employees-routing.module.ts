import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { EmployeesDetailComponent } from './employees-detail/employees-detail.component';
import { EmployeesHomeComponent } from './employees-home/employees-home.component';
import { EmployeesNewComponent } from './employees-new/employees-new.component';


const routes: Routes = [
  {
    path: '',
    component: EmployeesHomeComponent
  },
  {
    path: "new",
    component: EmployeesNewComponent
  },
  {
    path: ":id_employee",
    component: EmployeesDetailComponent
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class EmployeesRoutingModule { }
