package practise2.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import jakarta.persistence.GeneratedValue;
import practise2.model.User;
import practise2.service.UserService;

@Controller
public class UserController {
	
	@Autowired
	UserService uservice;

     @GetMapping("/users/create")
	public String UserEmptyRegisterPage(Model model) {
		model.addAttribute("user",new User());
    	 return "user-create";
	}
  
     @GetMapping("/users")
     public String showUserWithEditDelete(Model model) {
    	 List<User> users=uservice.findAll();
    	 model.addAttribute("users",users);
    	 return "user-list";
     }
     
     @PostMapping("/users/create")
     public String UserSubmitRegister(@ModelAttribute User user) {
    	user= uservice.saveUser(user);
    		return "redirect:/login";	
     }
     
    @GetMapping("/users/edit/{id}")
    public String UserEmptyEditFormWithPrefilledValues(@PathVariable("id") int id,Model model) {
    	 User user=uservice.findById(id);
    	 model.addAttribute("user", user);
    	 return "user-edit";
    	 
    }
    
    @PostMapping("/users/update/{id}")
    public String UserUpdatedForm(@PathVariable("id") int id,@ModelAttribute User user) {
    	uservice.updateUser(id,user);
    	return "redirect:/users";
    }
    
    @GetMapping("/users/delete/{id}")
    public String deleteUser(@PathVariable("id") int id) {
    	uservice.delete(id);
    	return "redirect:/users";
    }
}


