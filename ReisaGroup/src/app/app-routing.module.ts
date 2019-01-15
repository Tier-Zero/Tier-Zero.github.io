import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';


import { HomeComponent } from '../components/home/home.component';
import { StoryComponent } from '../components/story/story.component';
import { ServiceComponent } from '../components/service/service.component';
import { EndorseComponent } from '../components/endorse/endorse.component';
import { PlacementComponent } from '../components/placement/placement.component';

const routes: Routes = [
  {
    path: '',
    component: HomeComponent
  },
  {
    path: 'home',
    component: HomeComponent
  },
  {
    path: 'story',
    component: StoryComponent
  },
  {
    path: 'services',
    component: ServiceComponent
  },
  {
    path: 'endorse',
    component: EndorseComponent
  },
  {
    path: 'placement',
    component: PlacementComponent
  }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
