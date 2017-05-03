package id.ac.itb.indoormap.route;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;

import id.ac.itb.indoormap.service.PositioningService;

public class PositioningRoute extends RouteBuilder {

	@Override
	public void configure() throws Exception {

		from("cxf:/positioning?serviceClass=" + PositioningService.class.getName())
			.recipientList(simple("direct:${header.operationName}"));
		
		from("direct:getPosisiByIbeacon")
			.process(new Processor() {
	
				public void process(Exchange exchange) throws Exception {
	
				}
	
			});
		
		from("direct:getDenahById")
			.process(new Processor() {
	
				public void process(Exchange exchange) throws Exception {
	
				}
	
			});
		
		from("direct:login")
			.process(new Processor() {
	
				public void process(Exchange exchange) throws Exception {
	
				}
	
			});

	}

}
