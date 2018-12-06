package net.skhu.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

import org.springframework.stereotype.Service;

@Service
public class OtpService {

	 public String getHttpResponse(String url) throws IOException {
	        URL urlObj = new URL(url);
	        HttpURLConnection connection = (HttpURLConnection)urlObj.openConnection();

	        connection.setRequestMethod("GET");
	        connection.setRequestProperty("User-Agent", "Mozilla/5.0");

	        String contentType = connection.getContentType();        
	        String encoding = (contentType.toUpperCase().indexOf("UTF-8") >= 0) ? "UTF-8" : "EUC-KR";
	        StringBuffer builder = new StringBuffer();

	        try (BufferedReader input = 
	                new BufferedReader(new InputStreamReader(connection.getInputStream(), encoding))) {
	            String s;
	            while ((s = input.readLine()) != null) {
	                builder.append(s);
	            }
	        }
			System.out.println("otp값"+builder.toString());

	        return builder.toString();
	    }
	
}
