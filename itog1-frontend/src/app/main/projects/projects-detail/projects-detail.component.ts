import { Component, OnInit, ViewChild } from '@angular/core';
import { Router } from '@angular/router';
import { OComboComponent, OTableComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-projects-detail',
  templateUrl: './projects-detail.component.html',
  styleUrls: ['./projects-detail.component.css']
})
export class ProjectsDetailComponent implements OnInit {

  @ViewChild('projectsTable', { static: false }) employeesProjectsTable: OTableComponent;

  constructor(
    private router: Router
  ) { }

  public openAssignmentDetailSelected() {
    let selected = this.employeesProjectsTable.getSelectedItems();
    if (selected.length === 1) {
      let id_project = selected[0]['id_project'];
      let id_employee_project = selected[0]['id_employee_project'];
      this.router.navigate(['main/employeesProjects/' + id_project + '/' + id_employee_project], { queryParams: { isdetail: true } });
    }
  }

  @ViewChild('status', {static: true}) status: OComboComponent;

  public statusArray = [{
    statusCode: 10,
    statusText: 'Pending'
  }, {
    statusCode: 20,
    statusText: 'Working'
  }, {
    statusCode: 30,
    statusText: 'Finished'
  }];

  ngOnInit() {
  }

}
