package id.ac.itb.indoormap.route;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;
import javax.persistence.Query;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.rest.RestBindingMode;

import id.ac.itb.indoormap.model.entity.Geofence;
import id.ac.itb.indoormap.model.entity.Lokasi;
import id.ac.itb.indoormap.model.entity.Role;
import id.ac.itb.indoormap.model.entity.User;

public class RestRoute extends RouteBuilder {

	@Override
	public void configure() throws Exception {

		from("timer://foo?fixedRate=true&period=1000").to("log://bar");

		restConfiguration()
			.component("servlet")
			.bindingMode(RestBindingMode.json)
			.dataFormatProperty("prettyPrint", "true")
			.apiProperty("cors", "true");
		rest("/user")
			.description("User REST service")
			.consumes("application/json")
			.produces("application/json")
			.post()
				.type(User.class).to("jpa://id.ac.itb.indoormap.model.entity.User")
			.get()
				.to("direct:getUsers")
			.get("/{id}")
				.to("direct:getUser")
			.put("/{id}")
				.type(User.class).to("jpa://id.ac.itb.indoormap.model.entity.User")
			.delete("/{id}")
				.type(User.class).to("jpa://id.ac.itb.indoormap.model.entity.User");
				from("direct:getUsers")
					.process(new Processor() {
						public void process(Exchange exchange) throws Exception {
							EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("camel");
							EntityManager entitymanager = emfactory.createEntityManager();
							Query query = entitymanager.createNamedQuery("User.findAll");
							List<User> list = (List<User>) query.getResultList();
							exchange.getOut().setBody(list);
						}
					});
				from("direct:getUser")
					.process(new Processor() {
						public void process(Exchange exchange) throws Exception {
							EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("camel");
							EntityManager entitymanager = emfactory.createEntityManager();
							Query query = entitymanager.createNamedQuery("User.find");
							query.setParameter("id", exchange.getIn().getHeader("id"));
							List<User> list = (List<User>) query.getResultList();
							if (!list.isEmpty())
								exchange.getOut().setBody(list.get(0));
						}
					});
				
		rest("/role")
			.description("Role REST service")
			.consumes("application/json")
			.produces("application/json")
			.post()
				.type(Role.class).to("jpa://id.ac.itb.indoormap.model.entity.Role")
			.get()
				.to("direct:getRoles")
			.get("/{id}")
				.to("direct:getRole")
			.put("/{id}")
				.type(Role.class).to("jpa://id.ac.itb.indoormap.model.entity.Role")
			.delete("/{id}")
				.type(Role.class).to("jpa://id.ac.itb.indoormap.model.entity.Role");
				from("direct:getRoles")
					.process(new Processor() {
						public void process(Exchange exchange) throws Exception {
							EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("camel");
							EntityManager entitymanager = emfactory.createEntityManager();
							Query query = entitymanager.createNamedQuery("Role.findAll");
							List<Role> list = (List<Role>) query.getResultList();
							exchange.getOut().setBody(list);
						}
					});
				from("direct:getRole")
					.process(new Processor() {
						public void process(Exchange exchange) throws Exception {
							EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("camel");
							EntityManager entitymanager = emfactory.createEntityManager();
							Query query = entitymanager.createNamedQuery("Role.find");
							query.setParameter("id", exchange.getIn().getHeader("id"));
							List<Role> list = (List<Role>) query.getResultList();
							if (!list.isEmpty())
								exchange.getOut().setBody(list.get(0));
						}
					});
				
		rest("/lokasi")
			.description("Lokasi REST service")
			.consumes("application/json")
			.produces("application/json")
			.post()
				.type(Lokasi.class).to("jpa://id.ac.itb.indoormap.model.entity.Lokasi")
			.get()
				.to("direct:getLokasis")
			.get("/{id}")
				.to("direct:getLokasi")
			.put("/{id}")
				.type(Lokasi.class).to("jpa://id.ac.itb.indoormap.model.entity.Lokasi")
			.delete("/{id}")
				.type(Lokasi.class).to("jpa://id.ac.itb.indoormap.model.entity.Lokasi");
				from("direct:getLokasis")
					.process(new Processor() {
						public void process(Exchange exchange) throws Exception {
							EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("camel");
							EntityManager entitymanager = emfactory.createEntityManager();
							Query query = entitymanager.createNamedQuery("Lokasi.findAll");
							List<Lokasi> list = (List<Lokasi>) query.getResultList();
							exchange.getOut().setBody(list);
						}
					});
				from("direct:getLokasi")
					.process(new Processor() {
						public void process(Exchange exchange) throws Exception {
							EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("camel");
							EntityManager entitymanager = emfactory.createEntityManager();
							Query query = entitymanager.createNamedQuery("Lokasi.find");
							query.setParameter("id", exchange.getIn().getHeader("id"));
							List<Lokasi> list = (List<Lokasi>) query.getResultList();
							if (!list.isEmpty())
								exchange.getOut().setBody(list.get(0));
						}
					});
				
		rest("/geofence")
			.description("Geofence REST service")
			.consumes("application/json")
			.produces("application/json")
			.post()
				.type(Lokasi.class).to("jpa://id.ac.itb.indoormap.model.entity.Geofence")
			.get()
				.to("direct:getGeofences")
			.get("/{id}")
				.to("direct:getGeofence")
			.put("/{id}")
				.type(Geofence.class).to("jpa://id.ac.itb.indoormap.model.entity.Geofence")
			.delete("/{id}")
				.type(Geofence.class).to("jpa://id.ac.itb.indoormap.model.entity.Geofence");
				from("direct:getGeofences")
					.process(new Processor() {
						public void process(Exchange exchange) throws Exception {
							EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("camel");
							EntityManager entitymanager = emfactory.createEntityManager();
							Query query = entitymanager.createNamedQuery("Geofence.findAll");
							List<Geofence> list = (List<Geofence>) query.getResultList();
							exchange.getOut().setBody(list);
						}
					});
				from("direct:getGeofence")
					.process(new Processor() {
						public void process(Exchange exchange) throws Exception {
							EntityManagerFactory emfactory = Persistence.createEntityManagerFactory("camel");
							EntityManager entitymanager = emfactory.createEntityManager();
							Query query = entitymanager.createNamedQuery("Geofence.find");
							query.setParameter("id", exchange.getIn().getHeader("id"));
							List<Geofence> list = (List<Geofence>) query.getResultList();
							if (!list.isEmpty())
								exchange.getOut().setBody(list.get(0));
						}
					});
	}

}
