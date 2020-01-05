package pers.ming.nicat.po;

import java.math.BigDecimal;
import java.util.Date;

public class CommodityMastPO {
	private Date TradeDate;
	private String CommodityID;
	private BigDecimal Quantity;

	public Date getTradeDate() {
		return TradeDate;
	}

	public void setTradeDate(Date tradeDate) {
		TradeDate = tradeDate;
	}

	public String getCommodityID() {
		return CommodityID;
	}

	public void setCommodityID(String commodityID) {
		CommodityID = commodityID;
	}

	public BigDecimal getQuantity() {
		return Quantity;
	}

	public void setQuantity(BigDecimal quantity) {
		Quantity = quantity;
	}
}
