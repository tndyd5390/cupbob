package com.cupbob.util;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.Reader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.core.JsonParser.Feature;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

public class PayUtil {
	
	public static String MapToQeuryString(HashMap<String, String> map, String charSet){
		StringBuilder sbQuery = new StringBuilder();

		try {
			Iterator<Entry<String, String>> iter = map.entrySet().iterator();
			while(iter.hasNext()){
				Entry<String, String> entry = iter.next();
				String key = entry.getKey();
				String value = entry.getValue();

				sbQuery.append("&");
				sbQuery.append(URLEncoder.encode(key, charSet) + "=" +URLEncoder.encode(value, charSet));
			}
			sbQuery.delete(0, 0);
		} catch (Exception e) {

		}

		return sbQuery.toString();
	}


	/**
	 * URL을 호출하는 기능
	 * @param sURL
	 * @param getData
	 * @param postData
	 * @param encType
	 * @return
	 */
	public static Object callURL(String sURL, HashMap<String, String> getData, HashMap<String, String> postData, String charSet){
        HashMap<String, String> hashmapResult = new HashMap<String, String>();

        URL url;
        HttpURLConnection urlConnection;

        String getParams = MapToQeuryString(getData, charSet);
        String postParams = MapToQeuryString(postData, charSet);

        if (!"".equals(getParams)){
        	sURL += "?" + getParams;
        }
        try {
			url = new URL(sURL);
			urlConnection = (HttpURLConnection) url.openConnection();
	        urlConnection.setDoOutput(true);
	        urlConnection.setInstanceFollowRedirects(false);
	        urlConnection.setRequestMethod("POST");
	        urlConnection.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
	        urlConnection.setRequestProperty("charset", charSet);

			byte[] bytePostData	= postParams.getBytes(charSet);
			int postDataLength	= bytePostData.length;
			urlConnection.setRequestProperty("Content-Length", Integer.toString(postDataLength));
			urlConnection.setUseCaches(false);
			urlConnection.getOutputStream().write(bytePostData);

			StringBuilder sb = new StringBuilder();
			Reader in = new BufferedReader(new InputStreamReader(urlConnection.getInputStream(), "UTF-8"));
			for (int c = 0; (c = in.read()) >=0; ) {
				sb.append((char)c);
			}
			String responseBody = sb.toString();
	        int httpStatus = urlConnection.getResponseCode();

	        hashmapResult.put("httpStatus", String.valueOf(httpStatus));
	        hashmapResult.put("responseBody", responseBody);
		} catch (IOException e) {
			e.printStackTrace();
        } catch(IllegalArgumentException e){
			e.printStackTrace();
        } catch (Exception e) {
			e.printStackTrace();
		}

        return hashmapResult;
	}

	/**
	 * POST 값을 포함한 모든 Request의 body값을 읽어온다.
	 * @return
	 */
	public static String getRequestBody(HttpServletRequest request) throws IOException {
		String body = null;
		StringBuilder stringBuilder = new StringBuilder();
		BufferedReader bufferedReader = null;

		try {
			InputStream inputStream = request.getInputStream();
			if (inputStream != null){
				bufferedReader = new BufferedReader(new InputStreamReader(inputStream));
				char[] charBuffer = new char[128];
				int bytesRead = -1;
				while((bytesRead = bufferedReader.read(charBuffer)) > 0){
					stringBuilder.append(charBuffer, 0, bytesRead);
				}
			}
		} catch (IOException ex) {
			throw ex;
		} finally {
			if (bufferedReader != null){
				try {
					bufferedReader.close();
				} catch (Exception ex) {
					try {
						throw ex;
					} catch (Exception e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				}
			}
		}

		body = stringBuilder.toString();
		return body;
	}
	
	/**
	 * Object를 json 문자열로 변경한다.
	 * @return
	 */
	public static String ObjectToJsonString(Object object){
		String returnValue = "";
		
		if (object != null){
			ObjectMapper mapper = new ObjectMapper();
			try {
				returnValue = mapper.writeValueAsString(object);
			} catch (JsonGenerationException e) {
				e.printStackTrace();
			} catch (JsonMappingException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}finally{
				mapper = null;
			}
		}

		return returnValue;
	}

	/**
	 * JsonString 을 HashMap으로 변경한다.
	 * @param json
	 * @return
	 */
	public static HashMap<String, Object> JsonStringToObject(String json){
		HashMap<String, Object> map = new HashMap<String, Object>();
		try {
			ObjectMapper mapper = new ObjectMapper();
			mapper.configure(Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);
			map = mapper.readValue(json, new TypeReference<Map<String, Object>> () {});
		} catch (Exception e) {
			e.printStackTrace();
		}
		return map;
	}
	
	public static String iconv(String in_charset, String out_charset, String str){
		try {
			return new String(str.getBytes(in_charset), out_charset);
		} catch (Exception e) {
			return "";
		}
	}

	public static String join(String[] array, String sep){
		String retStr = "";
		for (String string : array) {
			retStr += "," + string;
		}
		if (retStr.length() > 1){
			int len = sep.length();
			retStr = retStr.substring(len);
		}
		return retStr;
	}
}
