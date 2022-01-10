import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmployeesRoutingModule } from './employees-routing.module';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { EmployeesHomeComponent } from './employees-home/employees-home.component';
import { EmployeesDetailComponent } from './employees-detail/employees-detail.component';
import { EmployeesNewComponent } from './employees-new/employees-new.component';
import { EmployeeAssignmentComponent } from './employee-assignment/employee-assignment.component';
import { SharedModule } from 'src/app/shared/shared.module';
import { EmployeeEditAssignmentComponent } from './employee-edit-assignment/employee-edit-assignment.component';

@NgModule({
  declarations: [EmployeesHomeComponent, EmployeesDetailComponent, EmployeesNewComponent, EmployeeAssignmentComponent, EmployeeEditAssignmentComponent],
  imports: [
    CommonModule,
    OntimizeWebModule,
    EmployeesRoutingModule,
    SharedModule
  ]
})
export class EmployeesModule { }
