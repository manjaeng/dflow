package kr.co.thenet.fapee.common.model;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@JsonIgnoreProperties(ignoreUnknown = true)
public class ReviewImageVO {
	private long reviewIdKey;
	
	private int seq;
	
	private String imageAlt;
	
	private String imageUrl;
	
    @JsonProperty("imageSrc")
	private String imageSrc;
    
}
