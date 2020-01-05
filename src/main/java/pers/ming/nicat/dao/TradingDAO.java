package pers.ming.nicat.dao;

import java.util.ArrayList;

import pers.ming.nicat.dao.bean.TradingQueryModel;
import pers.ming.nicat.po.TradingPO;

public interface TradingDAO extends RowMapper<TradingPO> {

	ArrayList<TradingPO> LIST(TradingQueryModel filter);

	ArrayList<TradingPO> UNSHIPPED(String buyer);

	TradingPO GET(String id);

	String ADD(TradingPO item);

	String UPDATE(TradingPO item);

	String DELETE(String transNo);

}
