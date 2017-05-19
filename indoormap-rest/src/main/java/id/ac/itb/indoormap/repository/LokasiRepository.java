package id.ac.itb.indoormap.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import id.ac.itb.indoormap.model.entity.Lokasi;

@Transactional
public interface LokasiRepository extends JpaRepository<Lokasi, String>{
	
	public List<Lokasi> findByMajor(int major);
	
}
