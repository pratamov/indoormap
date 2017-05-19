package id.ac.itb.indoormap.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;

import id.ac.itb.indoormap.model.entity.Geofence;

@Transactional
public interface GeofenceRepository extends JpaRepository<Geofence, Integer>{
	
	@Query("select g from Geofence g where g.lokasi.id = :id")
	List<Geofence> findByLokasi(@Param("id") String id);
	
	//@Query("select g from Geofence g where g.lokasi.id = :id AND (g.x1 <= :x AND g.x2 >= :x) AND (g.y1 <= :y AND g.y2 >= :y) AND (g.lokasi.major = :major)")
	//List<Geofence> findByLokasiKoordinatMajor(@Param("id") String id, @Param("x") double x, @Param("y") double y, @Param("major") int major);

	@Query("select g from Geofence g where (g.x1 <= :x AND g.x2 >= :x) AND (g.y1 <= :y AND g.y2 >= :y) AND (g.lokasi.major = :major)")
	List<Geofence> findByKoordinat(@Param("x") double x, @Param("y") double y, @Param("major") int major);
}