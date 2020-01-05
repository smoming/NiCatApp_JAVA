package pers.ming.nicat.dao.bean;

import java.util.ArrayList;
import java.util.Date;

import org.springframework.lang.Nullable;

public class TradingQueryModel {
	@Nullable
	private Date TradeDate_S;
	@Nullable
	private Date TradeDate_E;
	@Nullable
	private String Buyer;
	@Nullable
	private String CommodityID;
	@Nullable
	private ArrayList<String> TransNos;
	@Nullable
	private Boolean IsShipped;
	@Nullable
	private String ShipperNo;

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

	public ArrayList<String> getTransNos() {
		return TransNos;
	}

	public void setTransNos(ArrayList<String> transNos) {
		TransNos = transNos;
	}

	public Boolean getIsShipped() {
		return IsShipped;
	}

	public void setIsShipped(Boolean isShipped) {
		IsShipped = isShipped;
	}

	public String getShipperNo() {
		return ShipperNo;
	}

	public void setShipperNo(String shipperNo) {
		ShipperNo = shipperNo;
	}

}
