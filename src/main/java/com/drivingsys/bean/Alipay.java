package com.drivingsys.bean;

import org.springframework.stereotype.Component;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.request.AlipayTradePagePayRequest;

import java.util.Calendar;
import java.util.Date;

/**
 * 支付宝支付接口
 * @author Louis
 * @date Dec 12, 2018
 */
@Component
public class Alipay {

	/**
	 * 支付接口
	 * @param alipayBean
	 * @return
	 * @throws AlipayApiException
	 */
	public String pay(AlipayBean alipayBean) throws AlipayApiException {
		// 1、获得初始化的AlipayClient
		String serverUrl = AlipayProperties.getGatewayUrl();
		String appId = AlipayProperties.getAppId();
		String privateKey = AlipayProperties.getPrivateKey();
		String format = "json";
		String charset = AlipayProperties.getCharset();
		String alipayPublicKey = AlipayProperties.getPublicKey();
		String signType = AlipayProperties.getSignType();
		String returnUrl = AlipayProperties.getReturnUrl();
		String notifyUrl = AlipayProperties.getNotifyUrl();
		AlipayClient alipayClient = new DefaultAlipayClient(serverUrl, appId, privateKey, format, charset, alipayPublicKey, signType);
		// 2、设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		// 页面跳转同步通知页面路径
		alipayRequest.setReturnUrl(returnUrl);
		// 服务器异步通知页面路径
		alipayRequest.setNotifyUrl(notifyUrl);
		// 封装参数
		alipayRequest.setBizContent(JSON.toJSONString(alipayBean));
		// 3、请求支付宝进行付款，并获取支付结果
		String result = alipayClient.pageExecute(alipayRequest).getBody();
		// 返回付款信息
		return result;
	}
	public static String getOrdercode(){
		Date currDate = new Date();
		Calendar date = Calendar.getInstance();
		String year = String.valueOf(date.get(Calendar.YEAR));
		String month = currDate.getMonth() + 1 < 10 ? "0" + (currDate.getMonth() + 1): (currDate.getMonth() + 1)+"";
		String day = currDate.getDate()<10 ? "0"+currDate.getDate() : (currDate.getDate())+"";

		//获取年月日
		String nowdate = year + month + day;

		//获取当时时间戳
		String timestamp =  currDate.getTime()+"";

		//生成订单
		String orderId = nowdate + timestamp;
		return orderId;
	}
}