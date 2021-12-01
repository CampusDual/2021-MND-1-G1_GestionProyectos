import { NgModule } from "@angular/core";
import { Routes, RouterModule } from "@angular/router";
import { EmployeesProjectsDetailComponent } from "./employees-projects-detail/employees-projects-detail.component";
import { EmployeesProjectsHomeComponent } from "./employees-projects-home/employees-projects-home.component";
import { EmployeesProjectsNewComponent } from "./employees-projects-new/employees-projects-new.component";

const routes: Routes = [
  {
    path: "",
    component: EmployeesProjectsHomeComponent,
  },
  {
    path: "new",
    component: EmployeesProjectsNewComponent,
  },
  {
    path: ":id_employee_project",
    component: EmployeesProjectsDetailComponent,
  },
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule],
})
export class EmployeesProjectsRoutingModule {}
