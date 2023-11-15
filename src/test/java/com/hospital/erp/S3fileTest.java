package com.hospital.erp;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;

import com.hospital.erp.util.S3Uploader;

public class S3fileTest {

	@Autowired
	private S3Uploader  s3Uploader;
	
	@Test
	public void s3uploaderFileDeleteTest() {
		s3Uploader.deleteFile("member/7cc01ae2-81f9-4e68-9e1e-8657e0599b8e_2c2c60b20cb817a80afd381ae23dab05.jpg");
	}
}
