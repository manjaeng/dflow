package kr.co.thenet.fapee.common.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class FileUtils {

	public static String uploadFiles(List<MultipartFile> files){
		
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
			
			try {
				multipartFile.transferTo( new File(destinationFile) );
			} catch (IllegalStateException | IOException e) {
				result = "Exception";
			}
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
}
