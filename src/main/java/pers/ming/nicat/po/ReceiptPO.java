package pers.ming.nicat.po;

import java.math.BigDecimal;
import java.util.Date;

public class ReceiptPO {
	private String TransNo;
	private Date TradeDate;
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
