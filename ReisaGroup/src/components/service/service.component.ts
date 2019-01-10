import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'service',
  templateUrl: './service.component.html',
  styleUrls: ['./service.component.css']
})
export class ServiceComponent {
  title = 'ReisaGroup';

  constructor(private router: Router) {}
}
