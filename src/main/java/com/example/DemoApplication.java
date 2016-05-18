package com.example;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@SpringBootApplication
@Controller
public class DemoApplication {

	@RequestMapping("/")
	String hello() {
		return "redirect:/info";
	}
    
	public static void main(String[] args) {
		SpringApplication.run(DemoApplication.class, args);
	}
}
