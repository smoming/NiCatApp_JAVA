package pers.ming.nicat.dao;

import java.util.ArrayList;

import pers.ming.nicat.dao.bean.OrderQueryModel;
import pers.ming.nicat.po.OrderPO;

public interface OrderDAO extends RowMapper<OrderPO> {

	ArrayList<OrderPO> LIST(OrderQueryModel filter);

	OrderPO GET(String transNo);

	String ADD(OrderPO item);

	String UPDATE(OrderPO item);

	String DELETE(String transNo);

	ArrayList<OrderPO> UNPAID();

	ArrayList<OrderPO> UNPURCHASE();
}
