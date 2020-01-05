package pers.ming.nicat.dao.bean;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.lang.Nullable;

public class OrderQueryModel {
	@Nullable
	private Date TradeDate_S;
	@Nullable
	private Date TradeDate_E;
	@Nullable
	private String CommodityID;
	@Nullable
	private ArrayList<String> TransNos;
//	@Nullable
//	private Boolean IsPaid;
//	@Nullable
//	private Boolean IsPurchased;
	@Nullable
	private String ReceiptNo;
	@Nullable
	private String PurchaseNo;

	public Date getTradeDate_S() {
		return TradeDate_S;
	}

	public void setTradeDate_S(Date tradeDate_S) {
		TradeDate_S = tradeDate_S;
	}

	public Date getTradeDate_E() {
		return TradeDate_E;
	}

	public void setTradeDate_E(Date tradeDate_E) {
		TradeDate_E = tradeDate_E;
	}

	public String getCommodityID() {
		return CommodityID;
	}

	public void setCommodityID(String commodityID) {
		CommodityID = commodityID;
	}

	public ArrayList<String> getTransNos() {
		return TransNos;
	}

	public void setTransNos(ArrayList<String> transNos) {
		TransNos = transNos;
	}

//	public Boolean getIsPaid() {
//		return IsPaid;
//	}
//
//	public void setIsPaid(Boolean isPaid) {
//		IsPaid = isPaid;
//	}

//	public Boolean getIsPurchased() {
//		return IsPurchased;
//	}
//
//	public void setIsPurchased(Boolean isPurchased) {
//		IsPurchased = isPurchased;
//	}

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

}
