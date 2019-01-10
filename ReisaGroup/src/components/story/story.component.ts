import { Component } from '@angular/core';
import { Router } from '@angular/router';

@Component({
  selector: 'story',
  templateUrl: './story.component.html',
  styleUrls: ['./story.component.css']
})
export class StoryComponent {
  title = 'ReisaGroup';

  constructor(private router: Router) {}
}
