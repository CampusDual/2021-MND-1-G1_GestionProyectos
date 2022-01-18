import { Component, OnInit, ViewChild } from '@angular/core';
import { OComboComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-employees-new',
  templateUrl: './employees-new.component.html',
  styleUrls: ['./employees-new.component.css']
})
export class EmployeesNewComponent implements OnInit {

  @ViewChild('job', {static: true}) job: OComboComponent;

  public jobArray = [{
    jobCode: 1,
    jobText: 'Developer'
  },{
    jobCode: 2,
    jobText: 'Manager'
  }];

  constructor() { }

  ngOnInit() {
  }

}
