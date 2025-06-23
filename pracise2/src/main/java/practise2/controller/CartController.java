package practise2.controller;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;


import jakarta.servlet.http.HttpSession;
import practise2.model.OrderItem;
import practise2.model.Product;
import practise2.service.ProductService;


@Controller
@RequestMapping("/cart")
public class CartController {
	
	@Autowired
	ProductService pservice;
	
	@GetMapping
	public String viewCart(HttpSession session,Model model) {
		List<OrderItem> cartItems=getCartItemsFromSession(session);
		double totalPrice=0;
		for(OrderItem item:cartItems) {
			totalPrice=totalPrice+(item.getQuantity()*item.getPrice());
		}
		model.addAttribute("cartItems",cartItems);
		model.addAttribute("totalPrice",totalPrice);
		return "cart";
	}
	 

	@SuppressWarnings("unchecked")
	private List<OrderItem> getCartItemsFromSession(HttpSession session) {
		List<OrderItem> cartItems=(List<OrderItem>)session.getAttribute("cartItems");
		if(cartItems==null) {
			cartItems=new ArrayList<>();
			session.setAttribute("cartItems", cartItems);
		}
		return cartItems;
	}
	

	  

	    

	@PostMapping("/add")
	public String addToCart(@RequestParam int id,@RequestParam int quantity,HttpSession session) {
		List<OrderItem> cartItems=getCartItemsFromSession(session);
		Product product=pservice.getProductById(id);
	 	   
		    if (product == null) {
		        throw new IllegalArgumentException("Invalid product ID");
		    }
		boolean productExists=false;
		
		for(OrderItem item:cartItems) {
			if(item.getProducts().getId()==id) {
				item.setQuantity(item.getQuantity()+quantity);
				productExists=true;
				break;
			}
		}
    // Add new item if it does not exist in the cart
    if (!productExists) {
        OrderItem newItem = new OrderItem();
        newItem.setProducts(product);
        newItem.setPrice(product.getPrice());
        newItem.setQuantity(quantity);
        cartItems.add(newItem);
    }

    // Save updated cart in session
    session.setAttribute("cartItems", cartItems);
    return "redirect:/cart";
}
	
	@PostMapping("/update")
	public String UpdateAndRemoveProduct(@RequestParam int id,@RequestParam int quantity,HttpSession session){
	List<OrderItem> cartItems=	getCartItemsFromSession(session);
		List<OrderItem> orderItems=new ArrayList<>();
		for(OrderItem item:cartItems) {
			if(item.getProducts().getId()==id) {
				if(quantity==0) {
				orderItems.add(item);
			    }
			    else {
				item.setQuantity(quantity);
			    }
			
	     }
		
	}
		
		cartItems.removeAll(orderItems);
		session.setAttribute("cartItems",cartItems);
	     return "redirect:/cart";	
	}

}
