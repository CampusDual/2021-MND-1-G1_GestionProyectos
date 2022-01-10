import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { EmployeesProjectsRoutingModule } from './employees-projects-routing.module';
import { EmployeesProjectsHomeComponent } from './employees-projects-home/employees-projects-home.component';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { EmployeesProjectsNewComponent } from './employees-projects-new/employees-projects-new.component';
import { SharedModule } from 'src/app/shared/shared.module';

@NgModule({
  declarations: [EmployeesProjectsHomeComponent, EmployeesProjectsNewComponent],
  imports: [
    CommonModule,
    OntimizeWebModule,
    EmployeesProjectsRoutingModule,
    SharedModule
  ]
})
export class EmployeesProjectsModule { }
