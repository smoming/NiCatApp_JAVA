package pers.ming.nicat.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import pers.ming.nicat.po.ReceiptPO;

public class ReceiptVO {
	@JsonProperty("TransNo")
	private String TransNo;
	@JsonProperty("TradeDate")
	private Date TradeDate;
	@JsonProperty("TradeAmount")
	private BigDecimal TradeAmount;
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

	public static ReceiptVO toVO(ReceiptPO po) {
		ReceiptVO vo = new ReceiptVO();
		vo.setTradeDate(po.getTradeDate());
		vo.setTransNo(po.getTransNo());
		vo.setTradeAmount(po.getTradeAmount());
		vo.setRemark(po.getRemark());
		return vo;
	}

	public static ReceiptPO toPO(ReceiptVO vo) {
		ReceiptPO po = new ReceiptPO();
		po.setTradeDate(vo.getTradeDate());
		po.setTransNo(vo.getTransNo());
		po.setTradeAmount(vo.getTradeAmount());
		po.setRemark(vo.getRemark());
		return po;
	}
}
