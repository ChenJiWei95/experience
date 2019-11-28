package com.rjht.sdsys.trans.channel.ocr;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.IOUtils;
import org.apache.http.HttpEntity;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.ContentType;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;
import org.codehaus.jackson.map.DeserializationConfig;
import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.map.annotate.JsonSerialize.Inclusion;

import com.alibaba.fastjson.JSONObject;
import com.rjht.sdsys.trans.Trans;
import com.rjht.sdsys.trans.channel.HttpUtils;
import com.rjht.sdsys.trans.channel.ls.util.Config;
import com.rjht.server.Constant;
import com.rjht.util.PropertiesUtil;

import sun.misc.BASE64Decoder;

/**
 * 证件识别
 * @className OCRAdapter
 * @Description
 * @author cjw
 * @contact
 */
public class OCRAdapter {
	
	private static Logger logger = Logger.getLogger(OCRAdapter.class);
	
	static ObjectMapper mapper = new ObjectMapper();
	static {
		mapper.setSerializationInclusion(Inclusion.NON_NULL);
		mapper.configure(DeserializationConfig.Feature.FAIL_ON_UNKNOWN_PROPERTIES,false);
	}

	
	/**
	 * 
	 * @param username
	 * @param idcard
	 * @return
	 * @throws Exception
	 */
	public OCRData identification(String disorderid, String basePic, String cardType) throws Exception {
		
		OCRData response = null;
		String savePath = Config.class.getResource("/").getPath()+"orc/1.png";
		GenerateImage(basePic, savePath);
		String result =  post(cardType, new File(savePath));
		logger.info("商户订单号："+disorderid+",认证返回报文："+result);
		JSONObject json = JSONObject.parseObject(result);
		response = new OCRData();
		if("0".equals(json.getString("error_code"))) {
			response.setState("00");
			response.setResult(json.getString("error_code"));
			response.setMsg(json.getString("reason"));
		} else {
			response.setState("01");
			response.setMsg(json.getString("reason"));
		}
		System.out.println(response);
		return response;
		 
	}
	
	@SuppressWarnings("finally")
	public static boolean GenerateImage(String imgData, String imgFilePath) throws IOException { // 对字节数组字符串进行Base64解码并生成图片
		if (imgData == null) // 图像数据为空
            return false;    
		BASE64Decoder decoder = new BASE64Decoder();
        OutputStream out = null;     
	    try {
	    	out = new FileOutputStream(imgFilePath);
            // Base64解码
            byte[] b = decoder.decodeBuffer(imgData);
            for (int i = 0; i < b.length; ++i) {
                if (b[i] < 0) {// 调整异常数据
                    b[i] += 256;
                }
            }
            out.write(b);     
	    } catch (FileNotFoundException e) {
	       	e.printStackTrace();
	    } catch (IOException e) {
	    	e.printStackTrace();
		} finally {
	     	out.flush();
	     	out.close();
	       	return true;
	   	}
	}
	
	/**
	 * File类型 证件识别
	 * @param type
	 * @param file
	 * @return
	 * @throws Exception
	 */
	public static String post(String type, File file) throws Exception {
        CloseableHttpClient httpClient = HttpClients.createDefault();
        CloseableHttpResponse response = null;
        String result = null;
        // HttpClient请求的相关设置，可以不用配置，用默认的参数，这里设置连接和超时时长(毫秒)
        RequestConfig config = RequestConfig.custom().setConnectTimeout(30000).setSocketTimeout(30000).build();
        try {
            HttpPost httppost = new HttpPost("http://v.juhe.cn/certificates/query.php");
            // FileBody封装File类型的参数
            FileBody bin = new FileBody(file);
            // StringBody封装String类型的参数
            StringBody keyBody = new StringBody("6866ed735f47cce6d5d7ac2b9cf05b2b", ContentType.TEXT_PLAIN);
            StringBody typeBody = new StringBody(type, ContentType.TEXT_PLAIN);
            // addPart将参数传入，并指定参数名称
            HttpEntity reqEntity = MultipartEntityBuilder.create()
                    .addPart("pic", bin).addPart("key", keyBody)
                    .addPart("cardType", typeBody).build();
            httppost.setEntity(reqEntity);
            httppost.setConfig(config);
            // 执行网络请求并返回结果
            response = httpClient.execute(httppost);
            HttpEntity resEntity = response.getEntity();
            if (resEntity != null) {
                result =IOUtils.toString(resEntity.getContent(), "UTF-8");
            }
            EntityUtils.consume(resEntity);
        } finally {
            response.close();
            httpClient.close();
        }
        // 得到的是JSON类型的数据需要第三方解析JSON的jar包来解析
        return result;
    }
	
	public static void main(String[] args) throws Exception {
		OCRAdapter censusAdapter = new OCRAdapter();
//		censusAdapter.identification(basePic, cardType)("测试", "130426198510105891","2");
	}

}
