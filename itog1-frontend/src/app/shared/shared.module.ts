import { CommonModule } from '@angular/common';
import { NgModule } from '@angular/core';
import { OntimizeWebModule } from 'ontimize-web-ngx';
import { EmployeesProjectsDetailComponent } from '../main/employees-projects/employees-projects-detail/employees-projects-detail.component';
import { MENU_COMPONENTS } from './app.menu.config';

@NgModule({
  imports: [
    OntimizeWebModule
  ],
  declarations: [
    EmployeesProjectsDetailComponent,
    ...MENU_COMPONENTS
  ],
  exports: [
    CommonModule,
    EmployeesProjectsDetailComponent,
    ...MENU_COMPONENTS
  ],
  entryComponents: [...MENU_COMPONENTS],
})
export class SharedModule { }
