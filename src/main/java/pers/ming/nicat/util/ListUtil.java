package pers.ming.nicat.util;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
import java.util.stream.Stream;

public class ListUtil {
	public static Object FirstOrDefault(List<?> list) {
		if (list.size() > 0)
			return list.get(0);
		return null;
	}

	public static <T> List<T> ToList(Stream<T> list) {
		return list.collect(Collectors.toList());
	}

	public static <T> ArrayList<T> ToArrayList(List<T> list) {
		return new ArrayList<T>(list);
	}

	public static <T> ArrayList<T> ToArrayList(Stream<T> list) {
		return ToArrayList(ToList(list));
	}
}
