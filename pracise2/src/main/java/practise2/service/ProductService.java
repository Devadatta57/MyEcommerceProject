package practise2.service;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import practise2.model.Product;
import practise2.repository.ProductRepository;

@Service
public class ProductService {

	@Autowired
	ProductRepository prorepo;
	
	  @Value("${file.upload-dir}")
	    private String uploadDir;
	
	public List<Product> findAll() {
		return prorepo.findAll();
	}


	public void SaveProduct(Product product) {
		prorepo.save(product);
	}


	
	public String saveProductImage(MultipartFile imageFile) throws IOException {
        // 1. Build the directory path (e.g. "/path/to/app/uploads/images")
        Path uploadPath = Paths.get(uploadDir).toAbsolutePath().normalize();

        // 2. Create directories if they don't exist (safe if they do)
        Files.createDirectories(uploadPath);

        // 3. Clean the filename, resolve the target file
        String filename = Paths.get(imageFile.getOriginalFilename())
                               .getFileName().toString();
        Path targetFile = uploadPath.resolve(filename);

        // 4. Transfer the file data to disk (using File object)
        imageFile.transferTo(targetFile.toFile());

        // 5. Return only the filename for your JSP to build the URL
        return filename;
    }


	public void deleteById(int id) {
        prorepo.deleteById(id);		
	}


	public Product getProductById(int id) {
	Optional<Product>	product=prorepo.findById(id);
	if(product.isPresent()) {
		return product.get();
	}
	  throw new RuntimeException("no product with existing id: "+id);
	}
   
	
	

}
