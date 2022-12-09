import { Component, OnInit, ViewChild,ElementRef } from '@angular/core';

@Component({
  selector: 'app-welcome',
  templateUrl: './welcome.component.html',
  styleUrls: ['./welcome.component.css']
})
export class WelcomeComponent implements OnInit {
name!:string;
email!:string;
  constructor() { }

  ngOnInit(): void {
  }
startQuiz(){
  localStorage.setItem("name", this.name);
  localStorage.setItem("emailid",this.email);
  
}
}
