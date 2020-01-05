package pers.ming.nicat.dao;

import java.sql.ResultSet;

import org.springframework.lang.Nullable;

public interface RowMapper<T> {
	@Nullable
	T rowMapper(ResultSet rs);
}
