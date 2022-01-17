import { ChangeDetectorRef, Component, OnInit, ViewEncapsulation } from '@angular/core';
import { OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-employee-card',
  templateUrl: './employee-card.component.html',
  styleUrls: ['./employee-card.component.css'],
  encapsulation: ViewEncapsulation.None,
  host: {
    '[class.home-card]': 'true'
  }
})
export class EmployeeCardComponent implements OnInit {

  public employeeAmount: number;
  public developersAmount: number;
  public inChargeAmount: number;

  constructor(
    private ontimizeService: OntimizeService,
    private cd: ChangeDetectorRef,
  ) {
    this.ontimizeService.configureService(this.ontimizeService.getDefaultServiceConfiguration('employees'));
    this.ontimizeService.query(undefined, ['id_employee', 'job'], 'employee').subscribe(
      res => {
        if (res.data && res.data.length) {
          this.employeeAmount = res.data.length;
          this.developersAmount = res.data.filter((e: any) => e['job'] === 1).length;
          this.inChargeAmount = res.data.filter((e: any) => e['job'] === 2).length;
        }else{
          this.employeeAmount = undefined;
        }
        },
      err => console.log(err),
      () => this.cd.detectChanges()
    );
   }

  ngOnInit() {
  }

}
