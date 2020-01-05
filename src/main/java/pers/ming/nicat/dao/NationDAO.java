package pers.ming.nicat.dao;

import java.util.ArrayList;

import pers.ming.nicat.po.NationPO;

public interface NationDAO extends RowMapper<NationPO> {

	ArrayList<NationPO> LIST();

	NationPO GET(String id);

	String ADD(NationPO item);

	String UPDATE(NationPO item);

	String DELETE(String id);
}
