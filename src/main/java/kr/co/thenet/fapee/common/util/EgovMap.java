package kr.co.thenet.fapee.common.util;

import org.apache.commons.collections.map.ListOrderedMap;

public class EgovMap extends ListOrderedMap{
	
	private static final long serialVersionUID = 342529502200465027L;

	@Override
	public Object put(Object key, Object value) {
		return super.put(convert2CamelCase((String) key), value);
	}
	
	private String convert2CamelCase(String underScore) {

		if (underScore.indexOf('_') < 0 && Character.isLowerCase(underScore.charAt(0))) {
			return underScore;
		}
		StringBuilder result = new StringBuilder();
		boolean nextUpper = false;
		int len = underScore.length();

		for (int i = 0; i < len; i++) {
			char currentChar = underScore.charAt(i);
			if (currentChar == '_') {
				nextUpper = true;
			} else {
				if (nextUpper) {
					result.append(Character.toUpperCase(currentChar));
					nextUpper = false;
				} else {
					result.append(Character.toLowerCase(currentChar));
				}
			}
		}
		return result.toString();
	}
}
