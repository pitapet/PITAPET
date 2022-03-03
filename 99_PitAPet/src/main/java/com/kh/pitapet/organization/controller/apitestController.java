package com.kh.pitapet.organization.controller;

import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.nio.charset.StandardCharsets;

import org.apache.commons.io.Charsets;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.io.BufferedReader;

@RestController
public class apitestController {
	@GetMapping("/apitest")
	public String apicall() {
		
		
		
		
		StringBuffer result = new StringBuffer();
		try {
			String urlstr = "https://openapi.gg.go.kr/OrganicAnimalProtectionFacilit?" +
					"KEY=f3345def06304416bd7e0a492ae18e39"		 +
					"&Type=xml" +
					"&pIndex=1"+
					"&pSize=100";
			URL url = new URL(urlstr);
			HttpURLConnection urlconnection = (HttpURLConnection) url.openConnection();
			urlconnection.setRequestMethod("GET");
			
			//System.out.println(urlconnection.getContentType()); UTF-8로 나옴
			
			BufferedReader br = new BufferedReader(new InputStreamReader(urlconnection.getInputStream(),"EUC-KR"));
			
			String returnLine; 
			result.append("<xmp>");
			while((returnLine = br.readLine())!=null) {
				result.append(returnLine+"\n");
			}
			urlconnection.disconnect();
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result+"</xmp>";
		
		
	
	}
  
}