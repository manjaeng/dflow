package kr.co.thenet.fapee.common.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUtils {

	public static String uploadFiles(List<MultipartFile> files) throws IllegalStateException, IOException{
		
		String pathPrefix = "images/";
		String result = "success";
		
		if(files.isEmpty()) {
			result = "List Empty";
			return result;
		}

		for(MultipartFile multipartFile : files) {
			String originFileName = System.currentTimeMillis() + "_" + multipartFile.getOriginalFilename();
			String savePath = pathPrefix + getHashDir(originFileName);
			File directory = new File(savePath);
			if(!directory.exists()) {
				directory.mkdirs();
			}
			
			String destinationFile = savePath + originFileName;
			
			multipartFile.transferTo( new File(destinationFile) );
			
		}
		return result;
	}
	
	public static File MultipartToFile(MultipartFile multipartFile) throws IllegalStateException, IOException {
		File convertFile = new File(multipartFile.getOriginalFilename());
		multipartFile.transferTo(convertFile);
		return convertFile;
	}
	
	public static String getHashDir(String filename){

		int hashcode = filename.hashCode();
		int mask = 255;
		int firstDir = hashcode & mask;
		int secondDir = (hashcode >> 8) & mask;
		
		StringBuilder sb = new StringBuilder();
		sb.append(String.format("%02x", firstDir));
		sb.append(File.separator);
		sb.append(String.format("%02x", secondDir));
		sb.append(File.separator);
		
		return sb.toString();
	}
	
	public static String getFileExtension(String str) {
		String resultExtension = "";
		if(str.toLowerCase().indexOf("png") != -1) {
			resultExtension = ".png";
		} else if(str.toLowerCase().indexOf("jpg") != -1 || str.toLowerCase().indexOf("jpeg") != -1) {
			resultExtension = ".jpg";
		} else {
			resultExtension = ".exception";
		}
		return resultExtension;
	}
	
	public static String Base64ToDestinationFile(String userId, String base64, String pathPrefix) {
		String destinationFile = "";
		String specificName = System.currentTimeMillis() + "_" + base64;
		String savePath = pathPrefix + FileUtils.getHashDir(specificName);
		
		String fileName = System.currentTimeMillis() + "_" + userId;
		String fileExtension = FileUtils.getFileExtension(base64);
		destinationFile = savePath + fileName.hashCode() + fileExtension;

		return destinationFile;
	}
}
