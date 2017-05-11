package id.ac.itb.indoormap.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import id.ac.itb.indoormap.entity.User;

@Transactional
public interface UserRepository extends JpaRepository<User, String>{

}