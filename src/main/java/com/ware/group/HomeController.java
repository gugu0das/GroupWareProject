package com.ware.group;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;


import lombok.extern.slf4j.Slf4j;





@Controller
@Slf4j
public class HomeController {
	
	
	@GetMapping("/")
	public String home() throws Exception{
		
		
		
		return "index";
		
	}
	
}
