package id.ac.itb.indoormap.rs.route;

import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.rest.RestBindingMode;
import org.apache.camel.model.rest.RestParamType;

import id.ac.itb.indoormap.model.entity.Geofence;
import id.ac.itb.indoormap.model.entity.Lokasi;
import id.ac.itb.indoormap.model.entity.Role;
import id.ac.itb.indoormap.model.entity.User;

public class RestRoute extends RouteBuilder {

	@Override
	public void configure() throws Exception {

		restConfiguration()
			.component("servlet")
			.bindingMode(RestBindingMode.json)
			.dataFormatProperty("prettyPrint", "true")
			.apiProperty("cors", "true");
		
		rest("/user")
			.description("User REST service")
			.consumes("application/json")
			.produces("application/json")
			.post().type(User.class)
				.to("direct:setUser")
			.get()
				.to("direct:getUsers")
			.get("/{id}")
				.to("direct:getUser")
			.put("/{id}").type(User.class)
				.to("direct:setUser")
			.delete("/{id}").outType(User.class)
				.to("direct:setUser");
		
		rest("/role")
			.description("Role REST service")
			.consumes("application/json")
			.produces("application/json")
			.post().type(Role.class)
				.to("direct:setRole")
			.get()
				.to("direct:getRoles")
			.get("/{id}")
				.to("direct:getRole")
			.put("/{id}").type(Role.class)
				.to("direct:setRole")
			.delete("/{id}").type(Role.class)
				.to("direct:setRole");
		
		rest("/lokasi")
			.description("Lokasi REST service")
			.consumes("application/json")
			.produces("application/json")
			.post().type(Lokasi.class)
				.to("direct:setLokasi")
			.get()
				.to("direct:getLokasis")
			.get("/{id}")
				.to("direct:getLokasi")
			.get("/{id}/geofence")
				.param().name("x").type(RestParamType.query).defaultValue("-1").description("X Coordinate").endParam()
				.param().name("y").type(RestParamType.query).defaultValue("-1").description("Y Coordinate").endParam()
					.to("direct:getGeofencesByLokasi")
			.put("/{id}").type(Lokasi.class)
				.to("direct:setLokasi")
			.delete("/{id}").type(Lokasi.class)
				.to("direct:setLokasi");
		
		rest("/geofence")
			.description("Geofence REST service")
			.consumes("application/json")
			.produces("application/json")
			.post().type(Geofence.class)
				.to("direct:setGeofence")
			.get()
				.to("direct:getGeofences")
			.get("/{id}")
				.to("direct:getGeofence")
			.put("/{id}").type(Geofence.class)
				.to("direct:setGeofence")
			.delete("/{id}").type(Geofence.class)
				.to("direct:setGeofence");
		
		from("direct:setUser")
			.to("jpa://{{jpa.entity.user}}?persistenceUnit={{jpa.persistenceUnit}}");
		from("direct:getUsers")
			.pollEnrich("jpa://{{jpa.entity.user}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=User.findAll&consumeDelete=false");
		from("direct:getUser")
			.pollEnrich("jpa://{{jpa.entity.user}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=User.find&consumeDelete=false");
		from("direct:setRole")
			.to("jpa://{{jpa.entity.role}}?persistenceUnit={{jpa.persistenceUnit}}");
		from("direct:getRoles")
			.pollEnrich("jpa://{{jpa.entity.role}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Role.findAll&consumeDelete=false");
		from("direct:getRole")
			.pollEnrich("jpa://{{jpa.entity.role}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Role.find&consumeDelete=false");
		from("direct:setLokasi")
			.setHeader("id", header("id").convertTo(Integer.class))
			.to("jpa://{{jpa.entity.lokasi}}?persistenceUnit={{jpa.persistenceUnit}}");
		from("direct:getLokasis")
			.pollEnrich("jpa://{{jpa.entity.lokasi}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Lokasi.findAll&consumeDelete=false");
		from("direct:getLokasi")
			.setHeader("id", header("id").convertTo(Integer.class))
			.pollEnrich("jpa://{{jpa.entity.lokasi}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Lokasi.find&consumeDelete=false");
		from("direct:setGeofence")
			.setHeader("id", header("id").convertTo(Integer.class))
			.to("jpa://{{jpa.entity.geofence}}?persistenceUnit={{jpa.persistenceUnit}}");
		from("direct:getGeofences")
			.pollEnrich("jpa://{{jpa.entity.geofence}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Geofence.findAll&consumeDelete=false");
		from("direct:getGeofencesByLokasi")
			.setHeader("id", header("id").convertTo(Integer.class))
			.setHeader("x", header("x").convertTo(Double.class))
			.setHeader("y", header("y").convertTo(Double.class))
			.pollEnrich("jpa://{{jpa.entity.geofence}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Geofence.findByLokasiKoordinat&consumeDelete=false");
		from("direct:getGeofence")
			.setHeader("id", header("id").convertTo(Integer.class))
			.pollEnrich("jpa://{{jpa.entity.geofence}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Geofence.find&consumeDelete=false");
		
	}

}
