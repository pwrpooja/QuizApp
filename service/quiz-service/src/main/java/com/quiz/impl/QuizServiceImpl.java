package com.quiz.impl;
import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.entity.Answer;
import com.quiz.entity.Questions;
import com.quiz.entity.QuizAllocation;
import com.quiz.entity.User;
import com.quiz.model.AnswerModel;
import com.quiz.model.QuestionModel;
import com.quiz.model.QuizModel;
import com.quiz.repository.QuestionRepository;
import com.quiz.repository.QuizAllocationRepository;
import com.quiz.repository.UserRepository;
import com.quiz.service.QuizService;

@Service
public class QuizServiceImpl implements QuizService {

	@Autowired
	private UserRepository userRepository;
	
	@Autowired
	private QuizAllocationRepository quizAllocationRepository;
	
	@Autowired
	private QuestionRepository questionRepository;

	
	
	@Override
	public QuizModel getQuiz(String email) {
		
		QuizModel quizModel = null;
		// check if user exists in db
		Optional<User> user = userRepository.findById(email);
		
		
		
		if(!user.isEmpty()) {
			// user is present
			System.out.println(user);
			
			QuizAllocation quizAllocation= quizAllocationRepository.getQuizAllocatedToUser(email);
			
			Integer quizId = quizAllocation.getQuiz().getQuizId();
			
			List<Questions> questions = questionRepository.getQuestionsById(quizId);
			
			quizModel = new QuizModel();
			quizModel.setQuizId(quizId);
			quizModel.setQuizName(quizAllocation.getQuiz().getQuizName());
			quizModel.setUserName(quizAllocation.getUser().getName());
			List<QuestionModel> questionModels = new ArrayList<>();
			
			for (Questions question : questions) {
				QuestionModel questionModel = new QuestionModel();
				questionModel.setId(question.getId());
				questionModel.setQuestionText(question.getQuestionText());
				
				List<Answer> answers = question.getAnswers();
				
				List<AnswerModel> answerModels = new ArrayList<>();
				for (Answer answer : answers) {
					AnswerModel answerModel = new AnswerModel();
					answerModel.setId(answer.getOptionNo());
					answerModel.setAnswerText(answer.getOptionText());
					answerModel.setCorrect(question.getQuestionAnswerMapping().getAnswerId().equals(answer.getOptionNo())? true : false);
					answerModels.add(answerModel);
				}
				
				questionModel.setAnswers(answerModels);
				questionModels.add(questionModel);
			}
			
			quizModel.setQuestions(questionModels);
			
		} else {
			// user is not present
		}
		return quizModel;
		
	}

}
