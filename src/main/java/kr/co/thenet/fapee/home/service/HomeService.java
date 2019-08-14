package kr.co.thenet.fapee.home.service;

import java.util.HashMap;
import java.util.List;

public interface HomeService {

	List<HashMap<String, Object>> selectHomeUserList() throws Exception;

}
