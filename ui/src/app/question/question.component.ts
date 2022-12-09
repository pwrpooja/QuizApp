import { QuestionService } from './../Service/question.service';
import { Component, OnInit } from '@angular/core';
import { interval } from 'rxjs';
import { ThisReceiver } from '@angular/compiler';

@Component({
  selector: 'app-question',
  templateUrl: './question.component.html',
  styleUrls: ['./question.component.css']
})
export class QuestionComponent implements OnInit {
  public name: string = "";
  public emailid:string="";
  public questionList: any = [];
  public currentQuestion: number = 0;
  public points: number = 0;
  counter = 60;
  correctAnswer: number = 0;
  inCorrectAnswer: number = 0;
  interval$: any;
  progress :string="0";
  isQuizCompleted : boolean = false;
  showQuizNotPresentMsg: boolean = false;
  
  constructor(private questionService: QuestionService) { }

  ngOnInit(): void {
    this.name = localStorage.getItem("name")!;
    this.emailid = localStorage.getItem("emailid")!;
    this.getAllQuestions();
    this.startCounter();
  }
  getAllQuestions() {
    this.questionService.getQuestionJson(this.emailid)
      .subscribe(res => {
        console.log(res);
        if(res!=null) {
          this.showQuizNotPresentMsg = false;
          this.name=res.userName;
          this.questionList = res.questions;
        } else {
          this.showQuizNotPresentMsg = true;
        }
      })
  }
  nextQuestion() {
    this.currentQuestion++;
  }
  previousQuestion() {
    this.currentQuestion--;
  }
  answer(currentQno: number, option: any) {
    if(currentQno===this.questionList.length){
      this.isQuizCompleted=true;
      this.startCounter();
    }
    if (option.correct) {
      this.points += 10;
      
      this.correctAnswer++;
      setTimeout(()=>{
        this.currentQuestion++;
        this.resetCounter();
        this.getProgressPercent();
      },1000);
      
      
    }else{
      setTimeout(() => {
        this.currentQuestion++;
        this.inCorrectAnswer++;
        this.resetCounter();
        this.getProgressPercent();
      }, 1000);
    
      this.points-=10;
    }
  }
  startCounter(){
this.interval$=interval(1000)
.subscribe(val=>{
  this.counter--;
  if(this.counter===0){
    this.currentQuestion++;
    this.counter=60;
    this.points-=10;
  }

});
setTimeout(()=>{
this.interval$.unsubscribe();
},6000000);
  }
  stopCounter(){
    this.interval$.unsubscribe();
    this.counter=0;

  }
  resetCounter(){
    this.stopCounter();
    this.counter=60;
    this.startCounter();


  }
  resetQuiz() {
    this.resetCounter();
    this.getAllQuestions();
    this.points = 0;
    this.counter = 60;
    this.currentQuestion=0;
    this.progress="0";
    
  }
  getProgressPercent() {
    this.progress = ((this.currentQuestion / this.questionList.length) * 100).toString();
    return this.progress;

  }
}