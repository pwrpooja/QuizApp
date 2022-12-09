package com.quiz.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.model.QuizModel;
import com.quiz.service.QuizService;

@RestController
@CrossOrigin(origins = "http://localhost:4200")
public class QuizController {

	@Autowired
	private QuizService quizService;
	
	@RequestMapping("/api/quiz")
	public QuizModel getQuiz(@RequestParam("email") String email) {
		
		return quizService.getQuiz(email);
	}

}
