package com.drivingsys.controller;

import com.alipay.api.internal.util.AlipaySignature;
import com.drivingsys.bean.Alipay;
import com.drivingsys.bean.AlipayBean;
import com.drivingsys.bean.AlipayProperties;
import com.drivingsys.service.DrivingSchoolInfoService;
import com.drivingsys.service.PayService;
import javafx.beans.binding.ObjectExpression;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import com.alipay.api.AlipayApiException;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

@Controller()
//@RequestMapping("")
public class OrderController {

	@Autowired
	private DrivingSchoolInfoService drivingSchoolInfoService;
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
	@ResponseBody
	@RequestMapping(value = "alipay")
//	String outTradeNo, String subject, String totalAmount, String body
	public String alipay(HttpServletRequest request) throws AlipayApiException {
		Map<String, String[]> params=request.getParameterMap();
		Calendar calendar= Calendar.getInstance();
		SimpleDateFormat dateFormat= new SimpleDateFormat("yyyy-MM-dd :hh:mm:ss");
		String[]timeArr={dateFormat.format(calendar.getTime())};
		params.put("time",timeArr);
		AlipayBean alipayBean = new AlipayBean();
		alipayBean.setOut_trade_no(Alipay.getOrdercode());
//		System.out.println(params.get("kname")[0]);
		alipayBean.setSubject( params.get("kname")[0]);
		alipayBean.setTotal_amount(params.get("kprice")[0]);
		JSONObject jsonObject=JSONObject.fromObject(params);
		String string = jsonObject.toString();
		alipayBean.setBody(string);

		return payService.aliPay(alipayBean);

	}
	//支付宝同步请求
	@RequestMapping("/payReturn")
	public String payReturn(HttpServletRequest request)
	{
		System.out.println("同步请求");
//		String tradestate=request.getParameter("trade_status");
		Map<String,String> map=getParasmap(request);
		try
		{
			boolean verify = AlipaySignature.rsaCheckV1(map, AlipayProperties.getPublicKey(), AlipayProperties.getCharset(), AlipayProperties.getSignType());
			if (verify)
			{
				return "news1";//支付成功跳转路径
			}
		}catch (AlipayApiException a){

		}
		return "newstable"; //支付失败跳转路径
	}
	//支付宝异步请求
	@RequestMapping("/payNotify")
	public void payNotify(HttpServletRequest request){
//		String orderid = request.getParameter("out_trade_no");
//		String money = request.getParameter("total_amount");
		String tradestate=request.getParameter("trade_status");
		String baominginfo=request.getParameter("body");
		System.out.println(baominginfo);
		System.out.println(tradestate);
		if (tradestate.equals("TRADE_SUCCESS"))
		{

//			String[] str1 = baominginfo.split(",");
			//创建Map对象

			JSONObject  jasonObject = JSONObject.fromObject(baominginfo);
			Map<String,Object> jsonmap = (Map<String,Object>)jasonObject;
			Map<String,Object> map = new HashMap<>();
			//循环加入map集合
			for (String string : jsonmap.keySet()) {
				map.put(string,jsonmap.get(string).toString().replace("[","").replace("]",""));
			}
			drivingSchoolInfoService.insertBaoMing(map);
		}

	}
	public Map<String,String> getParasmap(HttpServletRequest request){
		Map<String, String> params = new HashMap<>();
		Map requestMap = request.getParameterMap();
		for (Iterator it=requestMap.keySet().iterator();it.hasNext();)
		{
			String key = (String) it.next();
			String []values=(String[])requestMap.get(key);
			String valStr = "";
			for (int i = 0; i < values.length; i++)
			{
				valStr=(i==values.length-1)?valStr+values[i]:valStr+values[i]+",";
			}
			params.put(key, valStr);
		}
		return params;
	}
}