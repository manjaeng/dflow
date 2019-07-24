package size.test.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.co.thenet.fapee.common.util.EgovMap;

@Mapper
public interface SizeMapper {

	void insertSizeData(List<EgovMap> list) throws Exception;
	
	List<EgovMap> selectSizeData(EgovMap egovMap) throws Exception;
	
	List<EgovMap> selectSizeDataOrignal(EgovMap egovMap) throws Exception;
}
