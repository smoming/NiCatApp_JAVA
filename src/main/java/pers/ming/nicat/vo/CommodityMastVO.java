package pers.ming.nicat.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CommodityMastVO {
	@JsonProperty("tradedate")
	private Date TradeDate;
	@JsonProperty("commodity_id")
	private String CommodityID;
	@JsonProperty("quantity")
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
