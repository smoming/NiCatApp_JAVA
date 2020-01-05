package pers.ming.nicat.dao;

import java.util.Date;

public interface AccountDAO {
	String ACCOUNT(Date tradeDate);

	String UNACCOUNT(Date tradeDate);
}
