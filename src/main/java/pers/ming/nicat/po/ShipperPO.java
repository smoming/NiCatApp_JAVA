package pers.ming.nicat.po;

import java.math.BigDecimal;
import java.util.Date;

public class ShipperPO {
	private String TransNo;
	private Date TradeDate;
	private String Buyer;
	private BigDecimal TradeAmount;
	private BigDecimal Fee;
	private String Delivery;
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
		this.Delivery = delivery;
	}

	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}
}
