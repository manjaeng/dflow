package kr.co.thenet.fapee.common.util;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.amazonaws.AmazonServiceException;
import com.amazonaws.SdkClientException;
import com.amazonaws.auth.AWSStaticCredentialsProvider;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;
import com.amazonaws.services.s3.model.Bucket;
import com.amazonaws.services.s3.model.GeneratePresignedUrlRequest;
import com.amazonaws.services.s3.model.ObjectMetadata;
import com.amazonaws.services.s3.model.PutObjectRequest;

public class S3Utils {

	private static final Logger log = LoggerFactory.getLogger(S3Utils.class);
	private static final String BUCKET_NAME = "s3thenet";
	private static final String ACCESS_KEY = "AKIAJJ2LEVJY6SB4KZVA";
	private static final String SECRET_KEY = "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";
	
	public static AmazonS3 s3Client;


	public static void init() {
		s3Client = AmazonS3ClientBuilder
				.standard()
				.withRegion(Regions.AP_NORTHEAST_2)
				.withCredentials(new AWSStaticCredentialsProvider(
						new BasicAWSCredentials(ACCESS_KEY, SECRET_KEY)))
				.build();
		
		log.info(s3Client.toString());
	}

	public static List<Bucket> getBucketList() {
		return s3Client.listBuckets();
	}

	public static Bucket createBucket(String bucketName) {
		return s3Client.createBucket(bucketName);
	}

	public static void createFolder(String folderName) {
		s3Client.putObject(BUCKET_NAME, folderName + "/", new ByteArrayInputStream(new byte[0]), new ObjectMetadata());
	}

	public static void uploadFile(String fileName, String filePath) {

		try {

			PutObjectRequest request = new PutObjectRequest(BUCKET_NAME, fileName, new File(filePath));
			//ObjectMetadata metadata = new ObjectMetadata();
			//metadata.setContentType("plain/text");
			//metadata.addUserMetadata("x-amz-meta-title", "someTitle");
			//request.setMetadata(metadata);
			s3Client.putObject(request);
			
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		}
	}
	
	public static void uploadFile(String fileName, File file) {

		try {

			PutObjectRequest request = new PutObjectRequest(BUCKET_NAME, fileName, file);
			s3Client.putObject(request);
			
			//s3Client.putObject(BUCKET_NAME, fileName, file);
			
		} catch (AmazonServiceException e) {
			e.printStackTrace();
		} catch (SdkClientException e) {
			e.printStackTrace();
		}

	}

	public static void deleteFile(String filePath) {
		String path = (filePath).replace(File.separatorChar, '/');
		s3Client.deleteObject(BUCKET_NAME, path);
	}

	public static String getFileURL(String filePath) {
		String path = filePath.replace(File.separatorChar, '/');
		return s3Client.generatePresignedUrl(new GeneratePresignedUrlRequest(BUCKET_NAME, path)).toString();
	}

}