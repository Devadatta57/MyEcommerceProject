package practise2.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import jakarta.servlet.http.HttpSession;
import practise2.model.Product;
import practise2.model.User;
import practise2.service.ProductService;

@Controller
public class ProductController {

	@Autowired
	 ProductService pservice;
	 
	
        @GetMapping("/products")	
	    public String getAllProducts(HttpSession session,Model model) {
        	User loggedInUser=(User)session.getAttribute("loggedInUser");
        	if(loggedInUser==null ) {
        		return "redirect:/login";
        	}
            System.out.println("User is logged in with role: " + loggedInUser.getRole());

        List<Product> products=	pservice.findAll();
        model.addAttribute("loggedInUser",loggedInUser);
        model.addAttribute("products", products);
        return "product-list";
        }
        
        @GetMapping("/products/add")
        public String addEmptyProducts(HttpSession session,Model model) {
        	User loggedInUser =(User) session.getAttribute("loggedInUser");
        	if(loggedInUser==null || !loggedInUser.getRole().equals("ADMIN")) {
        	return "redirect:/login";
        	}     
        	model.addAttribute("loggedInUser",loggedInUser);

        	return "addProduct";
        }
        
        @PostMapping("/products/add") 
        public String addNewProduct(@ModelAttribute Product product) {
            try {
                // Save the uploaded image if it exists
                if (product.getImageFile() != null && !product.getImageFile().isEmpty()) {
                    String imagePath = pservice.saveProductImage(product.getImageFile());
                        product.setImagePath("uploads/images/" + imagePath); // ✅ Correct relative path
                
                
                }  

                // Save the product details (including the image path, if any)
                pservice.SaveProduct(product);
            } catch (IOException e) {
                e.printStackTrace();
                return "redirect:/products/add?error=FileUploadFailed"; // Redirect with error message
            }

            return "redirect:/products"; // Redirect to the product list
        }
        
        
        
        @GetMapping("/products/edit/{id}")
        public String editProduct(@PathVariable("id") int id,HttpSession session,Model model) {
        	User loggedInUser=(User)session.getAttribute("loggedInUser");
        	if(loggedInUser==null || !loggedInUser.getRole().equals("ADMIN")) {
        		return "redirect:/login";
        	}
        	Product product= pservice.getProductById(id);  
        	   model.addAttribute("loggedInUser", loggedInUser); // Add this
        	model.addAttribute("product", product);
        	return "edit-product";
        }
        
        @PostMapping("/products/update/{id}")
        public String editProductForm(@PathVariable("id") int id,@ModelAttribute Product product) {
        	try {
        	Product existingProduct=pservice.getProductById(id);
        	if(existingProduct==null) {
        		return "redirect:/products?error=ProductNotFound";
        	}
        	
        	
        	if(product.getImageFile()!=null &&  !product.getImageFile().isEmpty()) {
        		String imagePath=pservice.saveProductImage(product.getImageFile());
        		product.setImagePath("uploads/images/"+imagePath);
        	}
        	else {
        		product.setImagePath(existingProduct.getImagePath());
        	}
        	product.setId(id);
        	pservice.SaveProduct(product);
        	
        	}
        	catch(IOException e) {
        		 e.printStackTrace();
                 return "redirect:/products/edit/" + id + "?error=FileUploadFailed";
        	}
        	return "redirect:/products";
        }
        
        @GetMapping("/products/delete/{id}")
        public String deleteProduct(@PathVariable("id") int id) {
        	pservice.deleteById(id);
        	return "redirect:/products";
        }
        
}
