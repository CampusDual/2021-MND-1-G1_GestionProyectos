import { Component, OnInit, ViewChild } from '@angular/core';
import { OComboComponent } from 'ontimize-web-ngx';

@Component({
  selector: 'app-projects-new',
  templateUrl: './projects-new.component.html',
  styleUrls: ['./projects-new.component.css']
})
export class ProjectsNewComponent implements OnInit {

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

  public selectedStatusCode = 10;

  constructor() { }

  ngOnInit() {
  }

}
