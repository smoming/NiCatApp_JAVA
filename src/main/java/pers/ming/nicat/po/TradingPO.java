package pers.ming.nicat.po;

import java.math.BigDecimal;
import java.util.Date;

public class TradingPO {
	private String TransNo;
	private Date TradeDate;
	private String Buyer;
	private String CommodityID;
	private String ShipperNo;
	private BigDecimal TradeQuantity;
	private BigDecimal TradeAmount;
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

	public String getCommodityID() {
		return CommodityID;
	}

	public void setCommodityID(String commodityID) {
		CommodityID = commodityID;
	}

	public String getShipperNo() {
		return ShipperNo;
	}

	public void setShipperNo(String shipperNo) {
		ShipperNo = shipperNo;
	}

	public BigDecimal getTradeQuantity() {
		return TradeQuantity;
	}

	public void setTradeQuantity(BigDecimal tradeQuantity) {
		TradeQuantity = tradeQuantity;
	}

	public BigDecimal getTradeAmount() {
		return TradeAmount;
	}

	public void setTradeAmount(BigDecimal tradeAmount) {
		TradeAmount = tradeAmount;
	}

	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}
}
