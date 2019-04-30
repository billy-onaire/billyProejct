package org.kh.billy.socialuser.model.vo;

public class AuthInfo {
	private String clientId;
	private String clientSecret;
	
	public AuthInfo() {}
	
	public AuthInfo(String clientId, String clientSecret) {
		super();
		this.clientId = clientId;
		this.clientSecret = clientSecret;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getClientSecret() {
		return clientSecret;
	}
	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}
	@Override
	public String toString() {
		return "AuthInfo [clientId=" + clientId + ", clientSecret=" + clientSecret + "]";
	}
	
	
}
