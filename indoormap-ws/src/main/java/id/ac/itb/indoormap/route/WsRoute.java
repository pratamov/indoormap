package id.ac.itb.indoormap.route;

import org.apache.camel.Exchange;
import org.apache.camel.Processor;
import org.apache.camel.builder.RouteBuilder;

public class WsRoute extends RouteBuilder {

	@Override
	public void configure() throws Exception {

		from("timer:timer1?period={{timer.interval}}")
			.to("jpa://id.ac.itb.indoormap.model.Role?consumer.namedQuery=Role.findAll")
			.to("log:asd");

	}

}
