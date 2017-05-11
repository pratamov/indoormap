package id.ac.itb.indoormap.rs.route;

import java.util.ArrayList;
import java.util.List;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.rest.RestBindingMode;
import org.apache.camel.model.rest.RestParamType;
import org.apache.camel.spi.Registry;
import org.apache.camel.spi.RestRegistry;

import id.ac.itb.indoormap.bean.ParameterBean;
import id.ac.itb.indoormap.model.entity.Geofence;
import id.ac.itb.indoormap.model.entity.Lokasi;
import id.ac.itb.indoormap.model.entity.Role;
import id.ac.itb.indoormap.model.entity.User;

public class RestRoute extends RouteBuilder {

	@Override
	public void configure() throws Exception {
		
		ParameterBean parameterBean = new ParameterBean();
		
		restConfiguration()
			.component("servlet")
			.bindingMode(RestBindingMode.json)
			.dataFormatProperty("prettyPrint", "true")
			.apiProperty("cors", "true");
		
		rest("/users")
			.description("User REST service")
			.consumes("application/json")
			.produces("application/json")
			.post().type(User.class).outType(User.class)
				.to("direct:setUser")
			.get()
				.to("direct:getUsers")
			.get("/{id}").outType(User.class)
				.to("direct:getUser")
			.put().type(User.class).outType(User.class)
				.to("direct:setUser")
			.delete("/{id}").outType(User.class)
				.to("direct:deleteUser");
		
		rest("/roles")
			.description("Role REST service")
			.consumes("application/json")
			.produces("application/json")
			.post().type(Role.class).outType(Role.class)
				.to("direct:setRole")
			.get()
				.to("direct:getRoles")
			.get("/{id}").outType(Role.class)
				.to("direct:getRole")
			.put().type(Role.class).outType(Role.class)
				.to("direct:setRole")
			.delete("/{id}").outType(Role.class)
				.to("direct:deleteRole");
		
		rest("/lokasis")
			.description("Lokasi REST service")
			.consumes("application/json")
			.produces("application/json")
			.post().type(Lokasi.class).outType(Lokasi.class)
				.to("direct:setLokasi")
			.get()
				.to("direct:getLokasis")
			.get("/{id}").outType(Lokasi.class)
				.to("direct:getLokasi")
			.get("/{id}/geofences")
				.param().name("x").type(RestParamType.query).defaultValue("-1").description("X Coordinate").endParam()
				.param().name("y").type(RestParamType.query).defaultValue("-1").description("Y Coordinate").endParam()
					.to("direct:getGeofencesByLokasi")
			.put().type(Lokasi.class).outType(Lokasi.class)
				.to("direct:setLokasi")
			.delete("/{id}").outType(Lokasi.class)
				.to("direct:deleteLokasi");
		
		rest("/geofences")
			.description("Geofence REST service")
			.consumes("application/json")
			.produces("application/json")
			.post().type(Geofence.class).outType(Geofence.class)
				.to("direct:setGeofence")
			.get()
				.to("direct:getGeofences")
			.get("/{id}").outType(Geofence.class)
				.to("direct:getGeofence")
			.put().type(Geofence.class).outType(Geofence.class)
				.to("direct:setGeofence")
			.delete("/{id}").outType(Geofence.class)
				.to("direct:deleteGeofence");
		
		from("direct:setUser")
			.to("jpa://{{jpa.entity.user}}?persistenceUnit={{jpa.persistenceUnit}}");
		from("direct:getUsers")
			.pollEnrich("jpa://{{jpa.entity.user}}?persistenceUnit={{jpa.persistenceUnit}}&namedQuery=User.findAll&consumeDelete=false");
		from("direct:getUser")
			.enrich(recipientList(simple("jpa://{{jpa.entity.user}}?persistenceUnit={{jpa.persistenceUnit}}&query={{jpa.entity.user.find}}")));
			from("direct:getUser_next")
				.recipientList(simple("jpa://{{jpa.entity.user}}?persistenceUnit={{jpa.persistenceUnit}}&query={{jpa.entity.user.find}}"));
		from("direct:deleteUser")
			.setBody(simple("${header.id}"))
			.to("log://asd");
			//.pollEnrich("jpa://{{jpa.entity.user}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=User.find&consumeDelete=true");
		
		from("direct:setRole")
			.to("jpa://{{jpa.entity.role}}?persistenceUnit={{jpa.persistenceUnit}}");
		from("direct:getRoles")
			.pollEnrich("jpa://{{jpa.entity.role}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Role.findAll&consumeDelete=false");
		from("direct:getRole")
			.pollEnrich("jpa://{{jpa.entity.role}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Role.find&consumeDelete=false");
		from("direct:deleteRole")
			.pollEnrich("jpa://{{jpa.entity.role}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Role.find");
		
		from("direct:setLokasi")
			.setHeader("id", header("id").convertTo(Integer.class))
			.to("jpa://{{jpa.entity.lokasi}}?persistenceUnit={{jpa.persistenceUnit}}");
		from("direct:getLokasis")
			.pollEnrich("jpa://{{jpa.entity.lokasi}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Lokasi.findAll&consumeDelete=false");
		from("direct:getLokasi")
			.setHeader("id", header("id").convertTo(Integer.class))
			.pollEnrich("jpa://{{jpa.entity.lokasi}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Lokasi.find&consumeDelete=false");
		from("direct:deleteLokasi")
			.pollEnrich("jpa://{{jpa.entity.lokasi}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Lokasi.find");
		
		
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
		from("direct:deleteGeofence")
			.pollEnrich("jpa://{{jpa.entity.geofence}}?persistenceUnit={{jpa.persistenceUnit}}&consumer.namedQuery=Geofence.find");
	}

}
