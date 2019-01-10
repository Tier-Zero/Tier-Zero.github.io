import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'ReisaGroup';

  tag = "The Reisa Group specializes in providing quality, timely, and affordable retained search and referencing services";

  home = 'Home';
  story = 'Our Story';
  services = 'Services';
  endorse = 'Endorsements';
  jobs = 'Job Postings';
  place = 'Placements';
  contact = 'Contact';

  navigation = [
    {
      name: 'Home',
      path: '/home'
    },
    {
      name: 'Our Story',
      path: '/story'
    },
    {
      name: 'Services',
      path: '/services'
    },
    {
      name: 'Endorsements',
      path: '/endorsements'
    },
    {
      name: 'Job Postings',
      path: '/jobs'
    },
    {
      name: 'Placements',
      path: '/placements'
    },
    {
      name: 'Contact',
      path: '/contact'
    }
  ]
}
