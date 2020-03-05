package com.drivingsys.service;

import com.alipay.api.AlipayApiException;
import com.drivingsys.bean.Alipay;
import com.drivingsys.bean.AlipayBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service

public class PayServiceImpl implements PayService
{
	@Autowired
	private Alipay alipay;

	@Override
	public String aliPay(AlipayBean alipayBean) throws AlipayApiException
	{
		return alipay.pay(alipayBean);
	}

}
