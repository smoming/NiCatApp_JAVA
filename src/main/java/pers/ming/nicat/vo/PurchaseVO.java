package pers.ming.nicat.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import pers.ming.nicat.po.PurchasePO;

public class PurchaseVO {
	@JsonProperty("TransNo")
	private String TransNo;
	@JsonProperty("TradeDate")
	private Date TradeDate;
	@JsonProperty("Fee")
	private BigDecimal Fee;
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

	public BigDecimal getFee() {
		return Fee;
	}

	public void setFee(BigDecimal fee) {
		Fee = fee;
	}

	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}

	public static PurchaseVO toVO(PurchasePO po) {
		PurchaseVO vo = new PurchaseVO();
		vo.setTransNo(po.getTransNo());
		vo.setTradeDate(po.getTradeDate());
		vo.setFee(po.getFee());
		vo.setRemark(po.getRemark());
		return vo;
	}

	public static PurchasePO toPO(PurchaseVO vo) {
		PurchasePO po = new PurchasePO();
		po.setTransNo(vo.getTransNo());
		po.setTradeDate(vo.getTradeDate());
		po.setFee(vo.getFee());
		po.setRemark(vo.getRemark());
		return po;
	}
}
