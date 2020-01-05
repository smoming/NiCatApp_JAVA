package pers.ming.nicat.po;

import java.math.BigDecimal;
import java.util.Date;

public class OrderPO {
	private String TransNo;
	private Date TradeDate;
	private String CommodityID;
	private String ReceiptNo;
	private String PurchaseNo;
	private BigDecimal TradeAmount;
	private BigDecimal TradeQuantity;
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
}
