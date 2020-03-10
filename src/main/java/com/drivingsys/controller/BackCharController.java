package com.drivingsys.controller;

import com.drivingsys.bean.Journalism;
import com.drivingsys.bean.Workbuttonlink;
import com.drivingsys.bean.amchart.ChartData;
import com.drivingsys.dao.BackChartMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequestMapping("/backchart")
public class BackCharController
{

	@Autowired
	private BackChartMapper backChartMapper;

	@ResponseBody
	@RequestMapping("/queryPotentialChart")
	public List<ChartData> queryPotentialChart(HttpServletRequest request){

		List<ChartData> chartData = backChartMapper.queryPotentialChart();
		chartData.get(0).setName("有意向待沟通");
		chartData.get(1).setName("有意向已沟通");
		chartData.get(2).setName("无意向购买");
		chartData.get(3).setName("已成交");
		chartData.get(4).setName("已删除");
		return chartData;
	}

	@ResponseBody
	@RequestMapping("/queryStudyChart")
	public List<ChartData> queryStudyChart(HttpServletRequest request){

		List<ChartData> chartData = backChartMapper.queryStudyChart();

		for (int i = 0; i <chartData.size() ; i++)
		{
			if (chartData.get(i).getName().equals("-2")){
				chartData.get(i).setName("驳回审核");
			}else if (chartData.get(i).getName().equals("-1")){
				chartData.get(i).setName("待通过审核");
			}else if (chartData.get(i).getName().equals("0")){
				chartData.get(i).setName("科目一进行中");
			}else if (chartData.get(i).getName().equals("1")){
				chartData.get(i).setName("科目二进行中");
			}else if (chartData.get(i).getName().equals("2")){
				chartData.get(i).setName("科目三进行中");
			}else if (chartData.get(i).getName().equals("3")){
				chartData.get(i).setName("科目四进行中");
			}else if (chartData.get(i).getName().equals("4")){
				chartData.get(i).setName("已毕业");
			}else if (chartData.get(i).getName().equals("5")){
				chartData.get(i).setName("已拿证");
			}

		}


//		chartData.get(0).setName("驳回审核");
//		chartData.get(1).setName("待通过审核");
//		chartData.get(2).setName("科目一进行中");
//		chartData.get(3).setName("科目二进行中");
//		chartData.get(4).setName("科目三进行中");
//		chartData.get(5).setName("科目四进行中");
//		chartData.get(6).setName("已毕业");
//		chartData.get(7).setName("已拿证");
		return chartData;
	}

	@ResponseBody
	@RequestMapping("/queryRegNumChart")
	public List<ChartData> queryRegNumChart(HttpServletRequest request){
		List<ChartData> chartData = backChartMapper.queryRegNumChart();
		return chartData;
	}


}
