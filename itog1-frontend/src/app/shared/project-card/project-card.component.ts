import { ChangeDetectorRef, Component, OnInit, ViewEncapsulation } from '@angular/core';
import { OntimizeService } from 'ontimize-web-ngx';

@Component({
  selector: 'app-project-card',
  templateUrl: './project-card.component.html',
  styleUrls: ['./project-card.component.css'],
  encapsulation: ViewEncapsulation.None,
  host: {
    '[class.home-card]': 'true'
  }
})
export class ProjectCardComponent implements OnInit {

  public projectAmount: number;
  public pendingProjects: number;
  public inProcessProjects: number;
  public finishedProjects: number;

  constructor(
    private ontimizeService: OntimizeService,
    private cd: ChangeDetectorRef,
  ) {
    this.ontimizeService.configureService(this.ontimizeService.getDefaultServiceConfiguration('projects'));
    this.ontimizeService.query(undefined, ['id_project', 'status'], 'project').subscribe(
      res => {
        if (res.data && res.data.length) {
          this.projectAmount = res.data.length;
          this.pendingProjects = res.data.filter((e: any) => e['status'] === 10).length;
          this.inProcessProjects = res.data.filter((e: any) => e['status'] === 20).length;
          this.finishedProjects = res.data.filter((e: any) => e['status'] === 30).length;
        }else{
          this.projectAmount = undefined;
        }

        },
      err => console.log(err),
      () => this.cd.detectChanges()
    );
   }

  ngOnInit() {
  }

}
