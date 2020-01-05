package pers.ming.nicat.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import pers.ming.nicat.po.ShipperPO;

public class ShipperVO {
	@JsonProperty("trans_no")
	private String TransNo;
	@JsonProperty("tradedate")
	private Date TradeDate;
	@JsonProperty("buyer")
	private String Buyer;
	@JsonProperty("tradeamount")
	private BigDecimal TradeAmount;
	@JsonProperty("fee")
	private BigDecimal Fee;
	@JsonProperty("delivery")
	private String Delivery;
	@JsonProperty("remark")
	private String Remark;

	public String getTransNo() {
		return TransNo;
	}

	public void setTransNo(String transNo) {
		TransNo = transNo;
	}

	public Date getTradeDate() {
		return TradeDate;
	}

	public void setTradeDate(Date tradeDate) {
		TradeDate = tradeDate;
	}

	public String getBuyer() {
		return Buyer;
	}

	public void setBuyer(String buyer) {
		Buyer = buyer;
	}

	public BigDecimal getTradeAmount() {
		return TradeAmount;
	}

	public void setTradeAmount(BigDecimal tradeAmount) {
		TradeAmount = tradeAmount;
	}

	public BigDecimal getFee() {
		return Fee;
	}

	public void setFee(BigDecimal fee) {
		Fee = fee;
	}

	public String getDelivery() {
		return Delivery;
	}

	public void setDelivery(String delivery) {
		Delivery = delivery;
	}

	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}

	public static ShipperVO toVO(ShipperPO po) {
		return null;
	}

	public static ShipperPO toPO(ShipperVO vo) {
		return null;
	}
}
