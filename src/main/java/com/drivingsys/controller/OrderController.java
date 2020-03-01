package com.drivingsys.controller;

import com.drivingsys.bean.AlipayBean;
import com.drivingsys.service.PayService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alipay.api.AlipayApiException;

@RestController()
@RequestMapping("order")
public class OrderController {

	@Autowired
	private PayService payService;

	/**
	 *
	 * @param outTradeNo 订单号
	 * @param subject 订单名称
	 * @param totalAmount 订单金额
	 * @param body 描述
	 * @return
	 * @throws AlipayApiException
	 */
	@RequestMapping(value = "alipay")
	public String alipay(String outTradeNo, String subject, String totalAmount, String body) throws AlipayApiException {
		AlipayBean alipayBean = new AlipayBean();
		alipayBean.setOut_trade_no(outTradeNo);
		alipayBean.setSubject(subject);
		alipayBean.setTotal_amount(totalAmount);
		alipayBean.setBody(body);
//		System.out.println(payService.aliPay(alipayBean));
		return payService.aliPay(alipayBean);
	}
}