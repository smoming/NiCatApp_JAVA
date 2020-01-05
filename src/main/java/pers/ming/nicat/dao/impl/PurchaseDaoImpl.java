package pers.ming.nicat.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import pers.ming.nicat.dao.PurchaseDAO;
import pers.ming.nicat.dao.bean.PurchaseQueryModel;
import pers.ming.nicat.db.SqlCommandExecutor;
import pers.ming.nicat.enums.SaveAction;
import pers.ming.nicat.po.PurchasePO;
import pers.ming.nicat.util.ListUtil;
import pers.ming.nicat.util.ResultSetUtil;

@Service
public class PurchaseDaoImpl extends SqlCommandExecutor implements PurchaseDAO {

	private final String SP_LIST = "SP_PURCHASE_LIST(?,?)";
	private final String SP_GET = "SP_PURCHASE_GET(?)";
	private final String SP_ADD = "SP_PURCHASE_ADD(?)";
	private final String SP_UPDATE = "SP_PURCHASE_UPDATE(?,?,?,?)";
	private final String SP_DELETE = "SP_PURCHASE_DELETE(?)";

	@Override
	public PurchasePO rowMapper(ResultSet rs) {
		PurchasePO po = new PurchasePO();
		try {
			po.setTransNo(rs.getString("TRANSNO"));
			po.setTradeDate(rs.getDate("TRADEDATE"));
			po.setFee(rs.getBigDecimal("FEE"));
			po.setRemark(rs.getString("REMARK"));
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return po;
	}

	@Override
	public ArrayList<PurchasePO> LIST(PurchaseQueryModel filter) {
		try {
			rSet = executeQuery(SP_LIST, toSQLParams(filter));
			return ResultSetUtil.doRowMapper(rSet, this);
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	private HashMap<String, Object> toSQLParams(PurchaseQueryModel filter) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TradeDate_S", filter.getTradeDate_S());
		in.put("i_TradeDate_E", filter.getTradeDate_E());
		return in;
	}

	@Override
	public PurchasePO GET(String transno) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", transno);
		try {
			rSet = executeQuery(SP_GET, in);
			return (PurchasePO) ListUtil.FirstOrDefault(ResultSetUtil.doRowMapper(rSet, this));
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			releaseResources();
		}

		return null;
	}

	@Override
	public String ADD(String[] OrderNos) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_OrderNos", String.join(",", OrderNos));
		return Save(SaveAction.Added, SP_ADD, in);
	}

	@Override
	public String UPDATE(PurchasePO item) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", item.getTransNo());
		in.put("i_TRADEDATE", item.getTradeDate());
		in.put("i_FEE", item.getFee());
		in.put("i_REMARK", item.getRemark());
		return Save(SaveAction.Modified, SP_UPDATE, in);
	}

	@Override
	public String DELETE(String transNo) {
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRANSNO", transNo);
		return Save(SaveAction.Deleted, SP_DELETE, in);
	}

}
