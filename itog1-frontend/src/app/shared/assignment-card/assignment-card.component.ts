import { ChangeDetectorRef, Component, OnInit, ViewEncapsulation } from '@angular/core';
import { OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-assignment-card',
  templateUrl: './assignment-card.component.html',
  styleUrls: ['./assignment-card.component.css'],
  encapsulation: ViewEncapsulation.None,
  host: {
    '[class.home-card]': 'true'
  }
})
export class AssignmentCardComponent implements OnInit {

  public totalAssignments: number;
  public assignmentPercentage: number;

  constructor(
    private ontimizeService: OntimizeService,
    private cd: ChangeDetectorRef,
  ) {
    this.ontimizeService.configureService(this.ontimizeService.getDefaultServiceConfiguration('employees'));
    this.ontimizeService.query(undefined, ['id_employee_project'], 'employeeProjectDetails').subscribe(
      res => {
        if (res.data && res.data.length) {
          this.totalAssignments = res.data.length;
          // this.assignmentPercentage = res.data.
        }else{
          this.totalAssignments = undefined;
        }
        },
      err => console.log(err),
      () => this.cd.detectChanges()
    );
   }

  ngOnInit() {
  }

}
