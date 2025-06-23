package practise2.service;

import java.util.List;

import javax.management.RuntimeErrorException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import practise2.model.User;
import practise2.repository.UserRepository;

@Service
public class UserService {

	@Autowired
	UserRepository urepo;
	
	
	public User saveUser(User user) {
		return urepo.save(user);
	}


	public User findByUsername(String username, String password) {
		User user=urepo.findByUsername(username);
		if(user!=null && user.getPassword().equals(password)) {
			return user;
		}
		return null;
	}


	public List<User> findAll() {
		return urepo.findAll();
	}


	public User findById(int id) {
		// TODO Auto-generated method stub
		return urepo.findById(id).orElseThrow(()-> new RuntimeException("user not found with id:"+id));
	}


	public void updateUser(int id,User user) {
		User existingUser=getUserById(id);
		existingUser.setUsername(user.getUsername());
		//existingUser.setPassword(user.getPassword());
		existingUser.setPhoneNumber(user.getPhoneNumber());
		existingUser.setEmail(user.getEmail());
		existingUser.setRole(user.getRole());
		urepo.save(existingUser);
		
	}


	
    public User getUserById(int id) {
        // We use findById() and return the user or throw an exception if not found
        return urepo.findById(id)
                .orElseThrow(() -> new RuntimeException("User not found with id: " + id));
    }


	public void delete(int id) {
		urepo.deleteById(id);
		
	}

	

	


   

}
