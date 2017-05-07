package id.ac.itb.indoormap.ws.route;

import org.apache.camel.builder.RouteBuilder;
import id.ac.itb.indoormap.ws.service.PosisiService;

public class WsRoute extends RouteBuilder{

	@Override
	public void configure() throws Exception {

		from("cxf:/ws?serviceClass=" + PosisiService.class.getName())
			.recipientList(simple("direct:${header.operationName}"));

		from("direct:getPosisi")
			.to("log:cxfLog2");
		
	}

}
