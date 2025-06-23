package practise2.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.servlet.http.HttpSession;
import practise2.model.User;

@Controller
@RequestMapping("/admin")
public class AdminController {
 
	@GetMapping("/dashboard")
	public String AdminLoginPage(HttpSession session) {
		User loggedInUser=(User)session.getAttribute("loggedInUser");
		String role=(String)session.getAttribute("role");
		if(loggedInUser.getRole().equals("ADMIN")){
			return "admin-dashboard";
		}
		else {
			return "products";
		}
	}
	
	
}
