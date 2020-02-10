package kr.co.thenet.fapee.common.model;

import java.util.ArrayList;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class UploadFileVO {
	
	private List<MultipartFile> files = new ArrayList<MultipartFile>();
	private List<String> times = new ArrayList<String>();
	
	private MultipartFile param00;
	private MultipartFile param01;
	private MultipartFile param02;
	private MultipartFile param03;
	private MultipartFile param04;
	private MultipartFile param05;
	private MultipartFile param06;
	private MultipartFile param07;
	private MultipartFile param08;
	private MultipartFile param09;
	
	private MultipartFile param10;
	private MultipartFile param11;
	private MultipartFile param12;
	private MultipartFile param13;
	private MultipartFile param14;
	private MultipartFile param15;
	private MultipartFile param16;
	private MultipartFile param17;
	private MultipartFile param18;
	private MultipartFile param19;

}
