package id.ac.itb.indoormap.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.transaction.annotation.Transactional;

import id.ac.itb.indoormap.entity.Lokasi;

@Transactional
public interface LokasiRepository extends JpaRepository<Lokasi, Integer>{

}
