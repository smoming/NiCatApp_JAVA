package pers.ming.nicat.dao.bean;

import java.util.Date;

import org.springframework.lang.Nullable;

public class ShipperQueryModel {
	@Nullable
	private Date TradeDate_S;
	@Nullable
	private Date TradeDate_E;
	@Nullable
	private String Buyer;

	public String getBuyer() {
		return Buyer;
	}

	public void setBuyer(String buyer) {
		Buyer = buyer;
	}

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
}
