package com.drivingsys.controller;

import com.drivingsys.bean.AlipayBean;
import com.drivingsys.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.alipay.api.AlipayApiException;

import javax.servlet.http.HttpServletRequest;
import java.util.Map;

@RestController()
@RequestMapping("order")
public class OrderController {

	@Autowired
	private PayService payService;

	/**
	 *
	 * outTradeNo 订单号
	 * subject 订单名称
	 * totalAmount 订单金额
	 * body 描述
	 * @return
	 * @throws AlipayApiException
	 */
	@RequestMapping(value = "alipay")
//	String outTradeNo, String subject, String totalAmount, String body
	public String alipay(HttpServletRequest request) throws AlipayApiException {
//		AlipayBean alipayBean = new AlipayBean();
//		alipayBean.setOut_trade_no(outTradeNo);
//		alipayBean.setSubject(subject);
//		alipayBean.setTotal_amount(totalAmount);
//		alipayBean.setBody(body);
////		System.out.println(payService.aliPay(alipayBean));
//		return payService.aliPay(alipayBean);
		System.out.println(request.getParameterMap().size());
		return null;
	}
}