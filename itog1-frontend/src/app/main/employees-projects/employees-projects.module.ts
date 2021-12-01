import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmployeesProjectsRoutingModule } from './employees-projects-routing.module';
import { EmployeesProjectsHomeComponent } from './employees-projects-home/employees-projects-home.component';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { EmployeesProjectsDetailComponent } from './employees-projects-detail/employees-projects-detail.component';
import { EmployeesProjectsNewComponent } from './employees-projects-new/employees-projects-new.component';


@NgModule({
  declarations: [EmployeesProjectsHomeComponent, EmployeesProjectsDetailComponent, EmployeesProjectsNewComponent],
  imports: [
    CommonModule,
    OntimizeWebModule,
    EmployeesProjectsRoutingModule
  ]
})
export class EmployeesProjectsModule { }
