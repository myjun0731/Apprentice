package DTO;

public class SalesDTO {
	/*
	 * 
	 * 	접근 제어자란?
	 * 	public : 외부에서 어디서든 접근 가능
	 * 	private: 오직 자기 클래스 내에서 접근 가능
	 *  protected : 패키지 + 자식 클래스에서 접근 가능
	 */
	
	private String salesno;
	private String pcode;
	private String saledate;
	private String scode;
	private String amount;
	
	public String getSalesno() {
		return salesno;
	}
	public void setSalesno(String salesno) {
		this.salesno = salesno;
	}
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getSaledate() {
		return saledate;
	}
	public void setSaledate(String saledate) {
		this.saledate = saledate;
	}
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
}
