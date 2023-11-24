package com.human.sample.restApi;

import java.io.FileInputStream;
import java.io.InputStream;
import java.net.URI;
import java.net.URLEncoder;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.client.RestTemplate;

public class KakaoLocal {

	public static void main(String[] args) throws Exception {
		// keyfile을 application.properties에 넣을 것임
		String keyfile = "D:/WorkSpace/02.DataAnalysis/08.Prototype/static/keys/카카오apiKey.txt";
		InputStream is = new FileInputStream(keyfile);
		byte[] buffer = new byte[80];
		while (true) {
			int num = is.read(buffer);
			if (num == -1)
				break;
		}
		is.close();
//		System.out.println(Arrays.toString(buffer));
		
		String kakaoKey = new String(buffer).substring(0, 32); // buffer에 0이 더해져서 32글자까지 줄어야함.
//		System.out.println(kakaoKey);
		
		// 카카오 로컬 API - 키워드로 장소 검색하기
		String apiUrl = "https://dapi.kakao.com/v2/local/search/keyword.json";
		// 서울시 강남구 삼성동 10km 반경에서 카카오프렌즈 매장 검색
		double lat = 37.514323;
		double lng = 127.062831;
		String encodedQuery  = URLEncoder.encode("카카오프렌즈", "utf-8");
		String rawUri = apiUrl + "?y=" + lat + "&x=" + lng + "&radius=10000&query=" + encodedQuery;
//		System.out.println(rawUri);
		URI uri = new URI(rawUri);
		
		// Header
		HttpHeaders headers = new HttpHeaders();
		headers.setContentType(MediaType.APPLICATION_JSON);
		headers.set("Authorization", "KakaoAK " + kakaoKey);  // blank 주의
		
		// RestTemplate : https://myunji.tistory.com/449
		RestTemplate rest = new RestTemplate();
		HttpEntity<String> entity = new HttpEntity<>("parameters", headers);
		ResponseEntity<String> response = rest.exchange(uri, HttpMethod.GET, entity, String.class);
		
//		System.out.println(response.getStatusCode());
//		System.out.println(response.getBody());	 	// json 출력
		
		//json simple parse를 import
		JSONParser json = new JSONParser();
		
		// 목적 데이터 찾기 위하여 JSONObject로 바꿔 줌.
		JSONObject obj = (JSONObject) json.parse(response.getBody().toString());
		// {"documents":[ < array
		// 보통은 json body를 client로 보내어 js로 풀어줌.
		// Map으로 풀지 못함. JSONObject와 JSONArray로 풀어야함.
		JSONArray documents = (JSONArray) obj.get("documents");
		for (int i = 0; i < documents.size(); i++) {
			JSONObject docu = (JSONObject) documents.get(i);
			String address_name = (String) docu.get("address_name");
			String place_name = (String) docu.get("place_name");
			String phone = (String) docu.get("phone");
			System.out.println(place_name + ", " + address_name + ", " + phone);
		}
		
	}

}
