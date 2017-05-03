package id.ac.itb.indoormap.route;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;

import id.ac.itb.indoormap.entity.Role;
import id.ac.itb.indoormap.entity.RoleList;
import id.ac.itb.indoormap.model.Posisi;
import id.ac.itb.indoormap.service.TestService;

public class TestRoute extends RouteBuilder {

	@Override
	public void configure() throws Exception {

		from("cxf:/test?serviceClass=" + TestService.class.getName())
			.recipientList(simple("direct:${header.operationName}"));
		
		from("direct:test")
			.process(new Processor() {
	
				public void process(Exchange exchange) throws Exception {
	
					EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("camel");
					EntityManager entitymanager = emfactory.createEntityManager();
					Role role = entitymanager.find(Role.class, 1);
					Query query = entitymanager.createNamedQuery("Role.findAll");
					List<Role> list = (List<Role>) query.getResultList();
					RoleList roles = new RoleList();
					roles.setRoles(list.toArray(new Role[list.size()]));
					exchange.getOut().setBody(roles);
	
				}
	
			});

		from("direct:test2")
			.process(new Processor() {
	
				public void process(Exchange exchange) throws Exception {
					
					Posisi posisi = new Posisi();
					posisi.setId_denah(0);
					posisi.setX(99);
					posisi.setY(44);
					
					exchange.getOut().setBody(posisi);
	
				}
	
			});

	}

}
