package pers.ming.nicat.dao.impl;

import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import pers.ming.nicat.dao.CashFlowDAO;
import pers.ming.nicat.db.SqlCommandExecutor;
import pers.ming.nicat.enums.SaveAction;
import pers.ming.nicat.po.CashFlowPO;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.util.ResultSetUtil;

@Service
public class CashFlowDaoImpl extends SqlCommandExecutor implements CashFlowDAO {

	private final String SP_LIST = "SP_CASHFLOW_LIST()";
	private final String SP_GET = "SP_CASHFLOW_GET(?)";
	private final String SP_ADD = "SP_CASHFLOW_ADD(?,?,?,?)";
	private final String SP_UPDATE = "SP_CASHFLOW_UPDATE(?,?,?,?)";
	private final String SP_DELETE = "SP_CASHFLOW_DELETE(?)";
	private final String SP_ACCOUNT = "SP_CASHFLOW_ACCOUNT(?)";

	@Override
	public CashFlowPO rowMapper(ResultSet rs) {
		CashFlowPO po = new CashFlowPO();
		try {
			po.setTradeDate(rs.getDate("TRADEDATE"));
			po.setIncome(rs.getBigDecimal("INCOME"));
			po.setExpenses(rs.getBigDecimal("EXPENSES"));
			po.setBalance(rs.getBigDecimal("BALANCE"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return po;
	}

	@Override
	public ArrayList<CashFlowPO> LIST() {
		try {
			rSet = executeQuery(SP_LIST, null);
			return ResultSetUtil.doRowMapper(rSet, this);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public CashFlowPO GET(Date tradeDate) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRADEDATE", tradeDate);
		try {
			rSet = executeQuery(SP_GET, in);
			return (CashFlowPO) ListUtil.FirstOrDefault(ResultSetUtil.doRowMapper(rSet, this));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public String ADD(CashFlowPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRADEDATE", item.getTradeDate());
		in.put("i_INCOME", item.getIncome());
		in.put("i_EXPENSES", item.getExpenses());
		in.put("i_BALANCE", item.getBalance());
		return Save(SaveAction.Added, SP_ADD, in);
	}

	@Override
	public String UPDATE(CashFlowPO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRADEDATE", item.getTradeDate());
		in.put("i_INCOME", item.getIncome());
		in.put("i_EXPENSES", item.getExpenses());
		in.put("i_BALANCE", item.getBalance());
		return Save(SaveAction.Modified, SP_UPDATE, in);
	}

	@Override
	public String DELETE(Date tradeDate) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRADEDATE", tradeDate);
		return Save(SaveAction.Deleted, SP_DELETE, in);
	}

	@Override
	public String ACCOUNT(Date tradeDate) {
		String errorMsg = "";
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRADEDATE", tradeDate);
		try {
			return executeUpdate(SP_ACCOUNT, in) ? "結帳成功" : "結帳失敗";
		} catch (SQLException e) {
			e.printStackTrace();
			errorMsg = e.getMessage();
		} finally {
			releaseResources();
		}

		return "結帳失敗:" + errorMsg;
	}

}
