package com.quiz.controller;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.quiz.entity.User;
import com.quiz.service.UserService;

@RestController
public class UsernameController {

	@Autowired
	UserService userService;

	public String getUserName1(String name) {
		return name;
	}

	@RequestMapping("api/user")
	public String getUserName(@RequestParam("email") String email) {

		Optional<User> user = userService.getUserName(email);

		if (!user.isEmpty()) {
			return user.get().getName();
		}

		return null;
	}

}
