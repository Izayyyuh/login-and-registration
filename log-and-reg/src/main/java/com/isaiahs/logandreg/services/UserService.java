package com.isaiahs.logandreg.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.isaiahs.logandreg.models.User;
import com.isaiahs.logandreg.repositories.UserRepository;
import com.isaiahs.logandreg.validators.LoginValidation;

@Service
public class UserService {
	
	@Autowired
	private UserRepository userRepository; //use dependency injection to allow the service access to repository methods
	
	public User findById(Long id) {
		return this.userRepository.findById(id).orElse(null);
	}
	
    // This method will be called from the controller
    // whenever a user submits a registration form.
    
    public User register(User newUser, BindingResult result) {
    
    	// TO-DO - Reject values or register if no errors:
    	Optional<User> potentialUser = userRepository.findByEmail(newUser.getEmail()); //grabbing email from database that the user supplied in the form
        // Reject if email is taken (present in database)
    	if(potentialUser.isPresent()) {
    		result.rejectValue("email", "Matches", "Please choose a different email.");
    	}

        // Reject if password doesn't match confirmation
    	if(!newUser.getPassword().equals(newUser.getConfirmPassword())) {
    	    result.rejectValue("confirmPassword", "Matches", "Passwords must match."); //.equals confirms actual values, not space in memory
    	}
        
        // Return null if result has errors
    	if(result.hasErrors()) {
    		return null; //if errors are found, nothing is returned and index page reloads with errors
    	}
        // Hash and set password, save user to database
    	String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt()); // takes newUser password from form input and "salts" it. Then saves it under "hashed" variable.
    	newUser.setPassword(hashed); //assigns hashed password to the new users password
        return this.userRepository.save(newUser); // saves newUser content with hashed password
 
    }

 // whenever a user submits a login form.
    public User login(LoginValidation newLoginObject, BindingResult result) {
    // TO-DO - Reject values:
    
	// Find user in the DB by email
    	Optional<User> potentialUser = userRepository.findByEmail(newLoginObject.getEmail());
    	
    	if(potentialUser.isPresent()) {
    		User user = potentialUser.get();
    		// Reject if BCrypt password match fails
    		if(!BCrypt.checkpw(newLoginObject.getPassword(), user.getPassword())) { //checks if login form data matches DB data
    		    result.rejectValue("email", "Matches", "Invalid credentials");
    		}
    		// otherwise return the user object
    		return user;
    	} else { 
    		// Reject if NOT present
    		result.rejectValue("email", "Matches", "Invalid credentials");
    		// Return null if result has errors
    		return null;
    	}
   
    	
    }
}   