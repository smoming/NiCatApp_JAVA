package pers.ming.nicat.vo;

import java.math.BigDecimal;
import java.util.Date;

import com.fasterxml.jackson.annotation.JsonProperty;

public class CashFlowVO {
	@JsonProperty("tradedate")
	private Date TradeDate;
	@JsonProperty("income")
	private BigDecimal Income;
	@JsonProperty("expenses")
	private BigDecimal Expenses;
	@JsonProperty("balance")
	private BigDecimal Balance;

	public Date getTradeDate() {
		return TradeDate;
	}

	public void setTradeDate(Date tradeDate) {
		TradeDate = tradeDate;
	}

	public BigDecimal getIncome() {
		return Income;
	}

	public void setIncome(BigDecimal income) {
		Income = income;
	}

	public BigDecimal getExpenses() {
		return Expenses;
	}

	public void setExpenses(BigDecimal expenses) {
		Expenses = expenses;
	}

	public BigDecimal getBalance() {
		return Balance;
	}

	public void setBalance(BigDecimal balance) {
		Balance = balance;
	}

}
