package com.quiz.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import com.quiz.entity.QuizAllocation;

@Repository
public interface QuizAllocationRepository extends JpaRepository<QuizAllocation, String> {

	@Query("select q from QuizAllocation q where q.user.email = ?1")
	public QuizAllocation getQuizAllocatedToUser(String email);
}