package pers.ming.nicat.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import pers.ming.nicat.po.OrderPO;

public class OrderVO {
	@JsonProperty("TransNo")
	private String TransNo;
	@JsonProperty("TradeDate")
	private Date TradeDate;
	@JsonProperty("CommodityID")
	private String CommodityID;
	@JsonProperty("ReceiptNo")
	private String ReceiptNo;
	@JsonProperty("PurchaseNo")
	private String PurchaseNo;
	@JsonProperty("TradeAmount")
	private BigDecimal TradeAmount;
	@JsonProperty("TradeQuantity")
	private BigDecimal TradeQuantity;
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

	public String getCommodityID() {
		return CommodityID;
	}

	public void setCommodityID(String commodityID) {
		CommodityID = commodityID;
	}

	public String getReceiptNo() {
		return ReceiptNo;
	}

	public void setReceiptNo(String receiptNo) {
		ReceiptNo = receiptNo;
	}

	public String getPurchaseNo() {
		return PurchaseNo;
	}

	public void setPurchaseNo(String purchaseNo) {
		PurchaseNo = purchaseNo;
	}

	public BigDecimal getTradeAmount() {
		return TradeAmount;
	}

	public void setTradeAmount(BigDecimal tradeAmount) {
		TradeAmount = tradeAmount;
	}

	public BigDecimal getTradeQuantity() {
		return TradeQuantity;
	}

	public void setTradeQuantity(BigDecimal tradeQuantity) {
		TradeQuantity = tradeQuantity;
	}

	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}

	public static OrderVO toVO(OrderPO po) {
		OrderVO vo = new OrderVO();
		vo.setTransNo(po.getTransNo());
		vo.setTradeDate(po.getTradeDate());
		vo.setCommodityID(po.getCommodityID());
		vo.setTradeQuantity(po.getTradeQuantity());
		vo.setTradeAmount(po.getTradeAmount());
		vo.setPurchaseNo(po.getPurchaseNo());
		vo.setReceiptNo(po.getReceiptNo());
		vo.setRemark(po.getRemark());
		return vo;
	}

	public static OrderPO toPO(OrderVO vo) {
		OrderPO po = new OrderPO();
		po.setTransNo(vo.getTransNo());
		po.setTradeDate(vo.getTradeDate());
		po.setCommodityID(vo.getCommodityID());
		po.setTradeQuantity(vo.getTradeQuantity());
		po.setTradeAmount(vo.getTradeAmount());
		po.setPurchaseNo(vo.getPurchaseNo());
		po.setReceiptNo(vo.getReceiptNo());
		po.setRemark(vo.getRemark());
		return po;
	}
}
