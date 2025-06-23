package practise2.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import jakarta.servlet.http.HttpSession;
import practise2.model.User;
import practise2.service.UserService;

@Controller
public class LoginContoller {
	
	@Autowired
	UserService lservice;
	
	@GetMapping("/login")
	public String showEmptyLoginPage() {
		return "login";
	}
	
	@PostMapping("/login")
	public String UserLogin(@RequestParam String username,@RequestParam String password,HttpSession session,Model model) {
		User user=lservice.findByUsername(username,password);
		if(user!=null ) {
		  	session.setAttribute("loggedInUser",user);
		  	session.setAttribute("role", user.getRole());
			if(user.getRole().equals("ADMIN")){
			return "redirect:/admin/dashboard";
			}else {
				return "redirect:/products";
			}
		}
		else {
			model.addAttribute("error","Invalid credentials");
			return "login";
		}
			}
	
	
	
	@GetMapping("/logout")
   public String Logout(HttpSession session ) {
		session.invalidate();
		return "redirect:/login";
	}
}
