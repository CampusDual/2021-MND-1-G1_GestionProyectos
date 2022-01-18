import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { OComboComponent, OTableComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-employees-detail',
  templateUrl: './employees-detail.component.html',
  styleUrls: ['./employees-detail.component.css']
})
export class EmployeesDetailComponent implements OnInit {

  @ViewChild('employeesTable', { static: false }) employeesProjectsTable: OTableComponent;

  constructor(
    private router: Router
  ) { }

  public openAssignmentDetailSelected() {
    let selected = this.employeesProjectsTable.getSelectedItems();
    if (selected.length === 1) {
      let id_employee = selected[0]['id_employee'];
      let id_employee_project = selected[0]['id_employee_project'];
      this.router.navigate(['main/employeesProjects/' + id_employee + '/' + id_employee_project], { queryParams: { isdetail: true } });
    }
  }

  @ViewChild('job', {static: true}) job: OComboComponent;

  public jobArray = [{
    jobCode: 1,
    jobText: 'Developer'
  },{
    jobCode: 2,
    jobText: 'Manager'
  }];

  ngOnInit() {
  }

}
