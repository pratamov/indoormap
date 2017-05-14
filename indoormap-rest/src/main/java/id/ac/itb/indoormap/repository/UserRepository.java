package id.ac.itb.indoormap.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import id.ac.itb.indoormap.model.entity.User;

@Transactional
public interface UserRepository extends JpaRepository<User, String>{

	@Query("select u from User u where u.id = :id AND u.password = :password")
	List<User> findByIdPassword(@Param("id") String id, @Param("password") String password);
	
}