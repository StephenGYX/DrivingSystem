package com.drivingsys.bean;

import com.baidu.aip.ocr.AipOcr;
import org.json.JSONObject;

public class OrcFactory
{
	public static final String APP_ID = "18618851";
	public static final String API_KEY = "GPCjNb19rVls5hntGVx6zfzE";
	public static final String SECRET_KEY = "4ccIUz168dV7HqRZyEqKvZopWYbtWEDW";
	public static AipOcr client;
	public synchronized static AipOcr getOrcclient()  {
		// 初始化一个AipOcr
		if (client==null)
		{
			client = new AipOcr(APP_ID, API_KEY, SECRET_KEY);

			// 可选：设置网络连接参数
			client.setConnectionTimeoutInMillis(2000);
			client.setSocketTimeoutInMillis(60000);
		}

		return client;
	}
}
