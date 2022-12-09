package com.quiz.model;

import java.util.List;

public class QuestionModel {

	private Integer id;
	private String questionText;
	private List<AnswerModel> answers;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getQuestionText() {
		return questionText;
	}
	public void setQuestionText(String questionText) {
		this.questionText = questionText;
	}
	public List<AnswerModel> getAnswers() {
		return answers;
	}
	public void setAnswers(List<AnswerModel> answers) {
		this.answers = answers;
	}
	
	
}
