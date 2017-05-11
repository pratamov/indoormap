package id.ac.itb.indoormap.repository;

import java.util.Collection;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import id.ac.itb.indoormap.entity.Geofence;

@Transactional
public interface GeofenceRepository extends JpaRepository<Geofence, Integer>{
	
	@Query("select g from Geofence g where g.lokasi.id = :id")
	Collection<Geofence> findByLokasi(@Param("id") int id);
	
	@Query("select g from Geofence g where g.lokasi.id = :id AND (g.x1 <= :x AND g.x2 >= :x) AND (g.y1 <= :y AND g.y2 >= :y)")
	Collection<Geofence> findByLokasiKoordinat(@Param("id") int id, @Param("x") double x, @Param("y") double y);
}