package com.quiz.entity;

import java.util.List;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.OneToMany;
import jakarta.persistence.OneToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "questions")
public class Questions {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "id")
	private Integer id;

	@Column(name = "quetion_Text")
	private String questionText;

	@OneToOne
	@JoinColumn(name = "quiz_type", referencedColumnName = "Quiz_Id")
	private Quiz quiz;

	@OneToMany(mappedBy = "questionId")
	private List<Answer> answers;

	@OneToOne
	@JoinColumn(name = "id")
	private QuestionAnswerMapping questionAnswerMapping;

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

	public Quiz getQuiz() {
		return quiz;
	}

	public void setQuiz(Quiz quiz) {
		this.quiz = quiz;
	}

	public List<Answer> getAnswers() {
		return answers;
	}

	public void setAnswers(List<Answer> answers) {
		this.answers = answers;
	}

	public QuestionAnswerMapping getQuestionAnswerMapping() {
		return questionAnswerMapping;
	}

	public void setQuestionAnswerMapping(QuestionAnswerMapping questionAnswerMapping) {
		this.questionAnswerMapping = questionAnswerMapping;
	}

}
