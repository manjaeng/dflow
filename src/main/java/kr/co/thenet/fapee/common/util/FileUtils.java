package kr.co.thenet.fapee.common.util;

import java.io.File;
import java.io.IOException;

import org.springframework.web.multipart.MultipartFile;

public class FileUtils {

	public static File MultipartToFile(MultipartFile multipartFile) throws IllegalStateException, IOException {
		File convertFile = new File(multipartFile.getOriginalFilename());
		multipartFile.transferTo(convertFile);
		return convertFile;
	}
}
