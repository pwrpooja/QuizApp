import { Injectable } from '@angular/core';
import{HttpClient}from '@angular/common/http'
@Injectable({
  providedIn: 'root'
})
export class QuestionService {

  constructor(private http:HttpClient) { }
  getQuestionJson(email: String){
    return this.http.get<any>("http://localhost:8080/api/quiz?email="+email);
  }
}
