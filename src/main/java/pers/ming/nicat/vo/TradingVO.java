package pers.ming.nicat.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import pers.ming.nicat.po.TradingPO;

public class TradingVO {
	@JsonProperty("TransNo")
	private String TransNo;
	@JsonProperty("TradeDate")
	private Date TradeDate;
	@JsonProperty("Buyer")
	private String Buyer;
	@JsonProperty("CommodityID")
	private String CommodityID;
	@JsonProperty("TradeQuantity")
	private BigDecimal TradeQuantity;
	@JsonProperty("TradeAmount")
	private BigDecimal TradeAmount;
	@JsonProperty("ShipperNo")
	private String ShipperNo;
	@JsonProperty("Remark")
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

	public static TradingPO toPO(TradingVO vo) {
		TradingPO po = new TradingPO();
		po.setTransNo(vo.getTransNo());
		po.setTradeDate(vo.getTradeDate());
		po.setBuyer(vo.getBuyer());
		po.setCommodityID(vo.getCommodityID());
		po.setTradeQuantity(vo.getTradeQuantity());
		po.setTradeAmount(vo.getTradeAmount());
		po.setShipperNo(vo.getShipperNo());
		po.setRemark(vo.getRemark());
		return po;
	}

	public static TradingVO toVO(TradingPO po) {
		TradingVO vo = new TradingVO();
		vo.setTransNo(po.getTransNo());
		vo.setTradeDate(po.getTradeDate());
		vo.setBuyer(po.getBuyer());
		vo.setCommodityID(po.getCommodityID());
		vo.setTradeQuantity(po.getTradeQuantity());
		vo.setTradeAmount(po.getTradeAmount());
		vo.setShipperNo(po.getShipperNo());
		vo.setRemark(po.getRemark());
		return vo;

	}
}
