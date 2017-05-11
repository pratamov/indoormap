package id.ac.itb.indoormap.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import id.ac.itb.indoormap.entity.Role;

@Transactional
public interface RoleRepository extends JpaRepository<Role, String>{

}
