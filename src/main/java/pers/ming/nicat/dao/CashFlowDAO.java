package pers.ming.nicat.dao;

import java.sql.Date;
import java.util.ArrayList;

import pers.ming.nicat.po.CashFlowPO;

public interface CashFlowDAO extends RowMapper<CashFlowPO> {

	ArrayList<CashFlowPO> LIST();

	CashFlowPO GET(Date tradeDate);

	String ADD(CashFlowPO item);

	String UPDATE(CashFlowPO item);

	String DELETE(Date tradeDate);

	String ACCOUNT(Date tradeDate);
}
