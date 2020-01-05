package pers.ming.nicat.dao;

import java.util.ArrayList;

import pers.ming.nicat.dao.bean.PurchaseQueryModel;
import pers.ming.nicat.po.PurchasePO;

public interface PurchaseDAO extends RowMapper<PurchasePO> {

	ArrayList<PurchasePO> LIST(PurchaseQueryModel filter);

	PurchasePO GET(String id);

	String ADD(String[] OrderNos);

	String UPDATE(PurchasePO item);

	String DELETE(String transNo);
}
