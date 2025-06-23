package practise2.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import practise2.model.Product;

public interface ProductRepository  extends JpaRepository<Product, Integer>{
	

}
