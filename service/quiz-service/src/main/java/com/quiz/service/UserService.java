package com.quiz.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.quiz.entity.User;
import com.quiz.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public List<User> listAllUser() {
		return userRepository.findAll();
	}

	public Optional<User> getUser(String email) {
		return userRepository.findById(email);
	}
 
	public Optional<User> getUserName(String name){
		return userRepository.findById(name);
	}
}
