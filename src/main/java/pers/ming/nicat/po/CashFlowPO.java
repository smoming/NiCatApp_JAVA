package pers.ming.nicat.po;

import java.math.BigDecimal;
import java.util.Date;

public class CashFlowPO {
	private Date TradeDate;
	private BigDecimal Income;
	private BigDecimal Expenses;
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
