package id.ac.itb.indoormap.route;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;
import org.apache.camel.model.dataformat.JsonLibrary;

import id.ac.itb.indoormap.entity.User;
import id.ac.itb.indoormap.model.IbeaconList;
import id.ac.itb.indoormap.model.Posisi;
import id.ac.itb.indoormap.model.ResponseUser;
import id.ac.itb.indoormap.service.PosisiService;

public class CamelRoute extends RouteBuilder{

	@Override
	public void configure() throws Exception {
		
		restConfiguration().host("{{rest.host}}").port("{{rest.port}}");
		
		from("cxf:/posisi?serviceClass=" + PosisiService.class.getName())
			.recipientList(simple("direct:${header.operationName}"));

		
		/* TODO */
		from("direct:getPosisi")
			.process(new Processor(){
				
				public void process(Exchange exchange) throws Exception {
	
					IbeaconList list = exchange.getIn().getBody(IbeaconList.class);
					exchange.getOut().setBody(list);
					
				}
				
			})
			.log("${body}")
			.process(new Processor(){
	
				public void process(Exchange exchange) throws Exception {
	
					exchange.getOut().setBody(new Posisi());
					
				}
				
			})
			.log("${body}");
		
		from("direct:getUser")
			.process(new Processor(){

				public void process(Exchange exchange) throws Exception {
					
					User user = exchange.getIn().getBody(User.class);
					String id = user.getId();
					String password = user.getPassword();
					exchange.getOut().setHeader("id", id);
					exchange.getOut().setHeader("password", password);
					
				}
				
			})
			.to("rest:get:rest/users/{id}?password={password}")
			.unmarshal().json(JsonLibrary.Jackson, ResponseUser.class)
			.process(new Processor(){

				public void process(Exchange exchange) throws Exception {

					ResponseUser response = exchange.getIn().getBody(ResponseUser.class);
					User user = response.getResponseBody();
					if (user != null){
						exchange.getOut().setBody(user);
					}
					else{
						exchange.getOut().setBody(new User());
					}
				}
				
			});
		
		/* TODO */
		from("direct:setUser")
			.process(new Processor(){
	
				public void process(Exchange exchange) throws Exception {
					
					User user = exchange.getIn().getBody(User.class);
					exchange.getOut().setBody(user);
					
				}
				
			})
			//.marshal().json(JsonLibrary.Jackson, User.class)
			.to("rest://put:rest/users")
			//.unmarshal().json(JsonLibrary.Jackson, ResponseUser.class)
			.log("${body}")
			.process(new Processor(){

				public void process(Exchange exchange) throws Exception {

					//ResponseUser response = exchange.getIn().getBody(ResponseUser.class);
					//User user = response.getResponseBody();
					exchange.getOut().setBody(new User());
					
				}
				
			})
			.log("${body}");
	}

}
