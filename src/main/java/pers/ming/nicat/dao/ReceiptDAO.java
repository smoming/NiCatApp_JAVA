package pers.ming.nicat.dao;

import java.util.ArrayList;

import pers.ming.nicat.dao.bean.ReceiptQueryModel;
import pers.ming.nicat.po.ReceiptPO;

public interface ReceiptDAO extends RowMapper<ReceiptPO> {

	ArrayList<ReceiptPO> LIST(ReceiptQueryModel filter);

	ReceiptPO GET(String transNo);

	String ADD(String[] transnos);

	String UPDATE(ReceiptPO item);

	String DELETE(String transNo);
}
