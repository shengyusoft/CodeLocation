package com.wtkj.common.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.NumberFormat;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartRenderingInfo;
import org.jfree.chart.ChartUtilities;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.CategoryLabelPositions;
import org.jfree.chart.entity.StandardEntityCollection;
import org.jfree.chart.labels.StandardCategoryToolTipGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.data.category.CategoryDataset;

import com.wtkj.common.model.ChartInfo;
import com.wtkj.common.utils.JfreeChartUtil;

/**
 * jfreechart控制类(base)
 * 
 * @author sunsi
 * 
 */
public class ChartController extends BaseController {

	private CategoryDataset categoryBarDataset;

	// C 网发展量 终端发展量
	public void showBar3D(HttpServletRequest request,
			HttpServletResponse response, ChartInfo chartinfo) throws Exception {
//		response.setContentType("image/jpeg");
		JFreeChart chart = JfreeChartUtil.createBarChart(
				getCategoryBarDataset(), chartinfo.getTitle(),
				chartinfo.getxTitle(), chartinfo.getyTitle(),
				chartinfo.isIs3D(), "");
		
		// 报表展现微调
		CategoryPlot plot = chart.getCategoryPlot();
		BarRenderer renderer = (BarRenderer) plot.getRenderer();
		renderer.setItemMargin(-2); // 通过调整组内柱子间隔，调整柱子展现大小(避免被其他柱子遮住)
		// x轴设置
		CategoryAxis domainAxis = plot.getDomainAxis();
		domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45); // 调整字体倾斜度
		// 设置鼠标移动展现内容
		renderer.setBaseToolTipGenerator(new StandardCategoryToolTipGenerator(
				"{2}", NumberFormat.getNumberInstance()));
		
		String filename = getJfreeChartFileName(request, response, chart, chartinfo.getWidth(), chartinfo.getHeight());
        
        String graphURL = request.getContextPath() 
                + "/servlet/DisplayChart?filename=" + filename;
        
        request.setAttribute("filename",filename);
		request.setAttribute("graphURL", graphURL);

//		try {
//			StandardEntityCollection sec = new StandardEntityCollection();
//			ChartRenderingInfo info = new ChartRenderingInfo(sec);
//			PrintWriter pw = response.getWriter();
//			ChartUtilities.writeChartAsJPEG(response.getOutputStream(), 1,
//					chart, chartinfo.getWidth(), chartinfo.getHeight(), info);
//			ChartUtilities.writeImageMap(pw, "imgMap", info, true);
//		} catch (IOException e) {
//			e.printStackTrace();
//		}

	}

	private String getJfreeChartFileName(HttpServletRequest request,
			HttpServletResponse response, JFreeChart chart, int width,
			int height) {
		response.setContentType("text/html;charset=UTF-8");
		HttpSession session = request.getSession();
		StandardEntityCollection sec = new StandardEntityCollection();
		ChartRenderingInfo info = new ChartRenderingInfo(sec);
		String filename = "";
		try {
			PrintWriter pw = response.getWriter();
			filename = ServletUtilities.saveChartAsPNG(chart, width, height,
					info, session);
			ChartUtilities.writeImageMap(pw, "imgMap", info, false);// 输出MAP信息
																	// ，前台使用与前台一致
			pw.flush();
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 路径跟过滤器配置
//		filename = request.getContextPath() + "/servlet/DisplayChart?filename="
//				+ filename;
		return filename;
	}

	public CategoryDataset getCategoryBarDataset() {
		return categoryBarDataset;
	}

	public void setCategoryBarDataset(CategoryDataset categoryBarDataset) {
		this.categoryBarDataset = categoryBarDataset;
	}

}
