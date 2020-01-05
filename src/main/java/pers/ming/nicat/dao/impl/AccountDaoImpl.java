package pers.ming.nicat.dao.impl;

import java.sql.SQLException;
import java.util.Date;
import java.util.HashMap;

import org.springframework.stereotype.Service;

import pers.ming.nicat.dao.AccountDAO;
import pers.ming.nicat.db.SqlCommandExecutor;

@Service
public class AccountDaoImpl extends SqlCommandExecutor implements AccountDAO {

	private final String SP_ACCOUNT = "SP_ACCOUND_ADD(?)";
	private final String SP_UNACCOUNT = "SP_ACCOUND_DELETE(?)";

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

	@Override
	public String UNACCOUNT(Date tradeDate) {
		String errorMsg = "";
		HashMap<String, Object> in = new HashMap<String, Object>();
		in.put("i_TRADEDATE", tradeDate);
		try {
			return executeUpdate(SP_UNACCOUNT, in) ? "回帳成功" : "回帳失敗";
		} catch (SQLException e) {
			e.printStackTrace();
			errorMsg = e.getMessage();
		} finally {
			releaseResources();
		}

		return "回帳失敗:" + errorMsg;
	}

}
