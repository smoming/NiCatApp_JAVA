package pers.ming.nicat.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

import pers.ming.nicat.po.ShipperPO;

public class ShipperVO {
	@JsonProperty("TransNo")
	private String TransNo;
	@JsonProperty("TradeDate")
	private Date TradeDate;
	@JsonProperty("Buyer")
	private String Buyer;
	@JsonProperty("TradeAmount")
	private BigDecimal TradeAmount;
	@JsonProperty("Fee")
	private BigDecimal Fee;
	@JsonProperty("Delivery")
	private String Delivery;
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

	public BigDecimal getTradeAmount() {
		return TradeAmount;
	}

	public void setTradeAmount(BigDecimal tradeAmount) {
		TradeAmount = tradeAmount;
	}

	public BigDecimal getFee() {
		return Fee;
	}

	public void setFee(BigDecimal fee) {
		Fee = fee;
	}

	public String getDelivery() {
		return Delivery;
	}

	public void setDelivery(String delivery) {
		Delivery = delivery;
	}

	public String getRemark() {
		return Remark;
	}

	public void setRemark(String remark) {
		Remark = remark;
	}

	public static ShipperVO toVO(ShipperPO po) {
		ShipperVO vo = new ShipperVO();
		vo.setTransNo(po.getTransNo());
		vo.setTradeDate(po.getTradeDate());
		vo.setBuyer(po.getBuyer());
		vo.setTradeAmount(po.getTradeAmount());
		vo.setDelivery(po.getDelivery());
		vo.setFee(po.getFee());
		vo.setRemark(po.getRemark());
		return vo;
	}

	public static ShipperPO toPO(ShipperVO vo) {
		ShipperPO po = new ShipperPO();
		po.setTransNo(vo.getTransNo());
		po.setTradeDate(vo.getTradeDate());
		po.setBuyer(vo.getBuyer());
		po.setTradeAmount(vo.getTradeAmount());
		po.setDelivery(vo.getDelivery());
		po.setFee(vo.getFee());
		po.setRemark(vo.getRemark());
		return po;
	}
}
