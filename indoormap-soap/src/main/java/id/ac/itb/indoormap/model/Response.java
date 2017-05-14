package id.ac.itb.indoormap.model;

public class Response<RESPONSE_TYPE> {

	private RESPONSE_TYPE responseBody;
	private String message;
	private int responseCode;

	public Response() {
		responseCode = 200;
	}

	public RESPONSE_TYPE getResponseBody() {
		return responseBody;
	}

	public void setResponseBody(RESPONSE_TYPE responseBody) {
		this.responseBody = responseBody;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public int getResponseCode() {
		return responseCode;
	}

	public void setResponseCode(int responseCode) {
		this.responseCode = responseCode;
	}

}