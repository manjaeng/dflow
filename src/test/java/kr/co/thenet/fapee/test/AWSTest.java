package kr.co.thenet.fapee.test;

import java.io.IOException;

import org.junit.Test;

import com.amazonaws.auth.AWSCredentials;
import com.amazonaws.auth.BasicAWSCredentials;
import com.amazonaws.auth.profile.ProfileCredentialsProvider;
import com.amazonaws.regions.Regions;
import com.amazonaws.services.s3.AmazonS3;
import com.amazonaws.services.s3.AmazonS3Client;
import com.amazonaws.services.s3.AmazonS3ClientBuilder;

public class AWSTest {

	String clientRegion = "*** Client region ***";
    String bucketName = "*** Bucket name ***";
    String stringObjKeyName = "*** String object key name ***";
    String fileObjKeyName = "*** File object key name ***";
    String fileName = "*** Path to file to upload ***";
    
	@SuppressWarnings("unused")
	private AmazonS3 amazonS3;

	@SuppressWarnings("deprecation")
	@Test
	public void aws() throws IOException {
		AWSCredentials awsCredentials = new BasicAWSCredentials("ACCESS_KEY", "SECRET_KEY");
		amazonS3 = new AmazonS3Client(awsCredentials);
		
	    AmazonS3 s3Client = AmazonS3ClientBuilder.standard()
                .withRegion(Regions.SA_EAST_1)
                .withCredentials(new ProfileCredentialsProvider())
                .build();
	    
	    s3Client.putObject(bucketName, stringObjKeyName, "Uploaded String Object");

	}
}
