package kr.co.thenet.fapee.common.model;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class RestResultVO {
	private long code;
	private String message;

    public static RestResultVO of(long code, String message) {
    	RestResultVO resultVO = new RestResultVO();
    	resultVO.setCode(code);
    	resultVO.setMessage(message);
        return resultVO;
    }
}
