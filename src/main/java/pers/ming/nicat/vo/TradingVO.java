package pers.ming.nicat.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import pers.ming.nicat.po.TradingPO;

public class TradingVO {
	@JsonProperty("trans_no")
	private String TransNo;
	@JsonProperty("tradedate")
	private Date TradeDate;
	@JsonProperty("buyer")
	private String Buyer;
	@JsonProperty("commodity_id")
	private String CommodityID;
	@JsonProperty("supper_no")
	private String SupperNo;
	@JsonProperty("tradequantity")
	private BigDecimal TradeQuantity;
	@JsonProperty("tradeamount")
	private BigDecimal TradeAmount;
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

	public String getCommodityID() {
		return CommodityID;
	}

	public void setCommodityID(String commodityID) {
		CommodityID = commodityID;
	}

	public String getSupperNo() {
		return SupperNo;
	}

	public void setSupperNo(String supperNo) {
		SupperNo = supperNo;
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

	public static TradingPO toPO(TradingVO vo) {
		return null;
	}

	public static TradingVO toVO(TradingPO po) {
		return null;

	}
}
