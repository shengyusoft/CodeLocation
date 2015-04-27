package com.wtkj.common.utils;

import java.awt.BasicStroke;
import java.awt.Color;
import java.awt.Font;
import java.awt.GradientPaint;
import java.awt.Point;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.jfree.chart.ChartFactory;
import org.jfree.chart.JFreeChart;
import org.jfree.chart.axis.CategoryAxis;
import org.jfree.chart.axis.NumberAxis;
import org.jfree.chart.axis.ValueAxis;
import org.jfree.chart.labels.ItemLabelAnchor;
import org.jfree.chart.labels.ItemLabelPosition;
import org.jfree.chart.labels.StandardCategoryItemLabelGenerator;
import org.jfree.chart.labels.StandardCategorySeriesLabelGenerator;
import org.jfree.chart.labels.StandardCategoryToolTipGenerator;
import org.jfree.chart.labels.StandardPieSectionLabelGenerator;
import org.jfree.chart.labels.StandardPieToolTipGenerator;
import org.jfree.chart.plot.CategoryPlot;
import org.jfree.chart.plot.PiePlot;
import org.jfree.chart.plot.PiePlot3D;
import org.jfree.chart.plot.Plot;
import org.jfree.chart.plot.PlotOrientation;
import org.jfree.chart.plot.dial.DialBackground;
import org.jfree.chart.plot.dial.DialCap;
import org.jfree.chart.plot.dial.DialPlot;
import org.jfree.chart.plot.dial.DialTextAnnotation;
import org.jfree.chart.plot.dial.DialValueIndicator;
import org.jfree.chart.plot.dial.StandardDialFrame;
import org.jfree.chart.plot.dial.StandardDialRange;
import org.jfree.chart.plot.dial.StandardDialScale;
import org.jfree.chart.renderer.category.BarRenderer;
import org.jfree.chart.renderer.category.BarRenderer3D;
import org.jfree.chart.renderer.category.LineAndShapeRenderer;
import org.jfree.chart.servlet.ServletUtilities;
import org.jfree.chart.title.TextTitle;
import org.jfree.chart.urls.StandardCategoryURLGenerator;
import org.jfree.chart.urls.StandardPieURLGenerator;
import org.jfree.data.category.CategoryDataset;
import org.jfree.data.category.DefaultCategoryDataset;
import org.jfree.data.general.DefaultPieDataset;
import org.jfree.data.general.DefaultValueDataset;
import org.jfree.data.general.PieDataset;
import org.jfree.ui.GradientPaintTransformType;
import org.jfree.ui.StandardGradientPaintTransformer;
import org.jfree.ui.TextAnchor;

public final class JfreeChartUtil {

	// 设置标题
	private static TextTitle setChartTile(String title) {
		Font titleFont = new Font("宋体", Font.PLAIN, 16); // 标题字体
		TextTitle textTitle = new TextTitle(title, titleFont);
		textTitle.setPaint(Color.BLUE);
		return textTitle;
	}

	// 设置JFreeChart部分基本信息
	private static void setJFreeChartBaseInfo(JFreeChart chart) {
		Font legendTitleFont = new Font("宋体", Font.PLAIN, 12); // 报表底部标题字体
		chart.setBorderPaint(Color.red); // 设置报表边框颜色
		chart.setBorderVisible(true);
		// 设置底部标题 字体
		chart.getLegend().setItemFont(legendTitleFont);
		chart.getLegend().setItemPaint(Color.red);
		// chart.setBackgroundPaint(Color.GREEN);// 设置背景色
	}

	// 设置图表区域基本信息
	private static void setPlotInfo(Plot plot) {
		// plot.setBackgroundPaint(Color.BLACK); //设置网格背景色
		// 设置柱的透明度
		// plot.setForegroundAlpha(1.0f);
		// 背景色 透明度
		// plot.setBackgroundAlpha(0.5f);
		// 无数据展现
		Font noDataFont = new Font("宋体", Font.BOLD, 16); // 饼图字体
		plot.setNoDataMessage("无对应的数据，请重新查询！");
		plot.setNoDataMessageFont(noDataFont);// 字体的大小
		plot.setNoDataMessagePaint(Color.RED);// 字体颜色
		// plot.setBackgroundPaint(Color.BLACK); //设置网格背景色
		// plot.setDomainGridlinePaint(Color.white); //设置垂直网格线颜色
		// plot.setDomainGridlinesVisible(true); // 设置垂直网格线是否可见
		// plot.setRangeGridlinePaint(Color.red); // 设置水平网格线颜色
		// 指定饼图轮廓线的颜色
		// plot.setBaseSectionOutlinePaint(Color.green);
		// plot.setBaseSectionPaint(Color.green);

	}

	// 设置X轴部分基本信息
	private static void setXLineBaseInfo(CategoryAxis domainAxis) {

		Font xFont = new Font("宋体", Font.BOLD, 16); // X轴字体
		Font xLabelFont = new Font("宋体", Font.BOLD, 16); // X轴标题字体
		domainAxis.setLabelFont(xFont); // 设置横轴字体
		domainAxis.setTickLabelFont(xLabelFont);// 设置坐标轴标尺值字体
		// domainAxis.setTickLabelPaint(Color.gray);
		domainAxis.setLowerMargin(0.01);// 左边距 边框距离
		domainAxis.setUpperMargin(0.01);// 右边距 边框距离,防止最后边的一个数据靠近了坐标轴。
		// domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45);
		// //设置字体倾斜度
		domainAxis.setCategoryLabelPositionOffset(10);// 图表横轴与标签的距离(10像素)
		// domainAxis.setCategoryMargin(0.8);// 横轴标签之间的距离20%

	}

	// 设置Y轴部分基本信息
	private static void setYLineBaseInfo(ValueAxis rangeAxis) {
		Font yFont = new Font("宋体", Font.BOLD, 16); // Y轴字体
		Font yLabelFont = new Font("宋体", Font.BOLD, 16); // Y轴标题字体
		rangeAxis.setUpperMargin(0.1);// 设置最高的一个柱与图片顶端的距离(最高柱的10%)
		rangeAxis.setUpperMargin(0.1);// 设置柱体与图片边框下相距
		rangeAxis.setTickLabelFont(yFont); // 设置Y坐标上文子字体
		rangeAxis.setLabelFont(yLabelFont); // 设置Y轴标题字体
		rangeAxis.setTickMarkStroke(new BasicStroke(1.0f)); // 设置坐标标记大小
		rangeAxis.setTickMarkPaint(Color.BLACK); // 设置坐标标记颜色
		// rangeAxis.setLabelAngle(3.0); //调整字体方向

	}

	/**
	 * 数据库结果转报表数据类型（柱状图、折线图）
	 * 
	 * @param data
	 *            List<Map<String,String>> data Map 对象必须包含 <KEY,VALUE>对
	 *            <"NUM",数量> <"SERIES_INDEX",子维度> <"CATEGORY",对象>
	 * @return CategoryDataset 报表数据
	 */
	private static CategoryDataset converListToCategoryDataset(
			List<Map<String, String>> data) {
		DefaultCategoryDataset dataset = new DefaultCategoryDataset();
		for (Map<String, String> item : data) {
			dataset.addValue(Double.valueOf(item.get("NUM")),
					item.get("SERIES_INDEX"), item.get("CATEGORY"));
		}
		return dataset;
	}

	/**
	 * 数据库结果转报表数据类型（饼图）
	 * 
	 * @param data
	 *            List<Map<String,String>> data Map 对象必须包含 <KEY,VALUE>对
	 *            <"NUM",数量> <"OBJ",对象>
	 * @return PieDataset 报表数据
	 */
	private static PieDataset converListToPieDataset(
			List<Map<String, String>> data) {
		DefaultPieDataset dataset = new DefaultPieDataset();
		for (Map<String, String> item : data) {
			dataset.setValue(item.get("COND"), Double.valueOf(item.get("OBJ")));
		}
		return dataset;
	}

	/**
	 * 生成柱状图
	 * 
	 * @param dataset
	 *            报表数据
	 * @param title
	 *            报表标题
	 * @param xtitle
	 *            X轴描述
	 * @param ytitle
	 *            Y轴描述
	 * @param is3D
	 *            是否3D效果
	 * @param url
	 *            连接路径
	 * @return JFreeChart
	 */
	public static JFreeChart createBarChart(CategoryDataset dataset,
			String title, String xtitle, String ytitle, boolean is3D, String url) {
		JFreeChart chart = ChartFactory.createBarChart3D(title,// 图表标题
				xtitle,// 目录轴的显示标签(x轴)
				ytitle,// 数值轴的显示标签（y轴）
				dataset, PlotOrientation.VERTICAL,// 图表方向：水平、垂直
				true,// 是否显示图例(对于简单的柱状图必须是false)
				true,// 是否tooltip
				true// 是否生成URL链接
				);
		chart.setTitle(setChartTile(title)); // 设置标题
		setJFreeChartBaseInfo(chart);
		CategoryPlot plot = chart.getCategoryPlot();// 获得图表区域对象
		setPlotInfo(plot);
		plot.setRangeGridlinesVisible(true); // 设置水平网格线是否可见
		// 设置柱的透明度
		plot.setForegroundAlpha(1.0f);
		// 背景色 透明度
		plot.setBackgroundAlpha(0.5f);
		// x轴设置
		CategoryAxis domainAxis = plot.getDomainAxis();
		setXLineBaseInfo(domainAxis); // X轴基本信息
		// 设定柱子的属性 （Y轴）
		ValueAxis rangeAxis = plot.getRangeAxis();
		setYLineBaseInfo(rangeAxis); // X轴基本信息

		// 数据精度
		// NumberAxis numberAxis = (NumberAxis)plot.getRangeAxis();
		// numberAxis.setAutoRangeStickyZero(true);

		// 设置图表的颜色
		BarRenderer renderer;
		if (is3D) {
			renderer = new BarRenderer3D();
		} else {
			renderer = new BarRenderer();
		}
		// 设置鼠标移动展现内容
		// renderer.setBaseToolTipGenerator(new
		// StandardCategoryToolTipGenerator("{2}",NumberFormat.getNumberInstance()));
		// 设置Url
		if (null != url && !"".equals(url)) {
			renderer.setBaseItemURLGenerator(new StandardCategoryURLGenerator(
					url));
		}
		// 显示每个柱的数值，并修改该数值的字体属性
		renderer.setIncludeBaseInRange(true);
		renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator(
				"{0}={2}", NumberFormat.getNumberInstance()));
		renderer.setBaseItemLabelsVisible(true);

		// 设置柱子上显示的数据旋转90度,最后一个参数为旋转的角度值/3.14
		ItemLabelPosition itemLabelPosition = new ItemLabelPosition(
				ItemLabelAnchor.INSIDE12, TextAnchor.CENTER_RIGHT,
				TextAnchor.CENTER_RIGHT, -1.57D);

		renderer.setBasePositiveItemLabelPosition(itemLabelPosition);
		renderer.setBaseNegativeItemLabelPosition(itemLabelPosition);

		// 设置柱体字在柱体外显示,当某个柱子比例太小,自动在柱外展现信息
		ItemLabelPosition itemLabelPositionFallback = new ItemLabelPosition(
				ItemLabelAnchor.OUTSIDE12, TextAnchor.BASELINE_LEFT,
				TextAnchor.HALF_ASCENT_LEFT, -1.57D);
		renderer.setPositiveItemLabelPositionFallback(itemLabelPositionFallback);
		renderer.setNegativeItemLabelPositionFallback(itemLabelPositionFallback);

		// java.lang.String labelFormat:"{0}={1}({2})":会显示成：apple=120(5%)
		// java.text.NumberFormat类有三个方法可以产生下列数据的标准格式化器：
		// 数字：NumberFormat.getNumberInstance();
		// 货币：NumberFormat.getCurrencyInstance();
		// 百分数：NumberFormat.getPercentInstance();

		// 修改柱体颜色,设置柱体颜色不同
		renderer.setBaseOutlinePaint(Color.red);
		renderer.setSeriesPaint(0, new Color(0, 255, 255));// 计划柱子的颜色为青色
		renderer.setSeriesOutlinePaint(0, Color.BLACK);// 边框为黑色
		renderer.setSeriesPaint(1, new Color(0, 255, 0));// 实报柱子的颜色为绿色
		renderer.setSeriesOutlinePaint(1, Color.red);// 边框为红色
		// renderer.setItemMargin(-4);// 组内柱子间隔为组宽的10% 可以 调整柱子大小，本身柱子被其他柱子遮盖了
		// renderer.setMaximumBarWidth(1.0);
		// .setMinimumBarLength();
		// 设置底部 LegendLabel内容
		renderer.setLegendItemLabelGenerator(new StandardCategorySeriesLabelGenerator(
				"{0}"));
		plot.setRenderer(renderer);// 设置Renderer

		// 设置纵横坐标的显示位置
		// plot.setDomainAxisLocation(AxisLocation.BOTTOM_OR_LEFT);//
		// 学校显示在下端(柱子竖直)或左侧(柱子水平)
		// plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_LEFT); //
		// 人数显示在下端(柱子水平)或左侧(柱子竖直)

		return chart;
	}

	/**
	 * 生成饼图
	 * 
	 * @param dataset
	 *            报表数据
	 * @param title
	 *            报表标题
	 * @param is3D
	 *            是否3D效果
	 * @param url
	 *            连接路径
	 * @return JFreeChart
	 */
	public static JFreeChart createPieChart(PieDataset dataset, String title,
			boolean is3D, String url) {

		PiePlot plot = null;
		if (is3D) {
			plot = new PiePlot3D(dataset);// 3D饼图
		} else {
			plot = new PiePlot(dataset);
		}
		if (null != url && !"".equals(url)) {
			plot.setURLGenerator(new StandardPieURLGenerator(url));// 设定热区超链接
		}
		plot.setPieIndex(1);
		setPlotInfo(plot);
		JFreeChart chart = new JFreeChart(title, JFreeChart.DEFAULT_TITLE_FONT,
				plot, true);
		setJFreeChartBaseInfo(chart);
		// 设置背景色为白色
		// chart.setBackgroundPaint(Color.green);
		// 设置鼠标移动显示信息
		plot.setToolTipGenerator(new StandardPieToolTipGenerator(
				"{0}({1},{2})", NumberFormat.getNumberInstance(),
				new DecimalFormat("0.00%")));

		// 图片中显示百分比:默认方式
		// plot.setLabelGenerator(new
		// StandardPieSectionLabelGenerator(StandardPieToolTipGenerator.DEFAULT_TOOLTIP_FORMAT));
		// 图片中显示百分比:自定义方式，{0} 表示选项， {1} 表示数值， {2} 表示所占比例 ,小数点后两位
		plot.setLabelGenerator(new StandardPieSectionLabelGenerator(
				"{0}={1}({2})", NumberFormat.getNumberInstance(), // "{0}={1}({2})"
				new DecimalFormat("0.00%")));
		// 图例显示百分比:自定义方式， {0} 表示选项， {1} 表示数值， {2} 表示所占比例
		plot.setLegendLabelGenerator(new StandardPieSectionLabelGenerator("{0}"));
		// 指定图片的透明度(0.0-1.0)
		plot.setForegroundAlpha(0.8f);
		// 指定显示的饼图上圆形(true)还椭圆形(false)
		plot.setCircular(true);
		// plot.setBackgroundPaint(Color.gray); //设置背景颜色
		// 设置第一个 饼块section 的开始位置，默认是12点钟方向
		plot.setStartAngle(90);
		Font pieLabelFont = new Font("宋体", Font.BOLD, 16); // 饼图字体
		plot.setLabelFont(pieLabelFont);
		return chart;
	}

	/**
	 * 生成折线图
	 * 
	 * @param dataset
	 *            报表数据
	 * @param title
	 *            报表标题
	 * @param xtitle
	 *            X轴描述
	 * @param ytitle
	 *            Y轴描述
	 * @param is3D
	 *            是否3D效果
	 * @return JFreeChart
	 */
	public static JFreeChart createXYLineChart(DefaultCategoryDataset dataSet,
			String title, String xtitle, String ytitle, boolean is3D) {
		JFreeChart chart = ChartFactory.createLineChart(title, xtitle, ytitle,
				dataSet, PlotOrientation.VERTICAL, // 绘制方向
				true, // 显示图例
				true, // 采用标准生成器
				false // 是否生成超链接
				);
		if (is3D) {
			chart = ChartFactory.createLineChart3D(title, xtitle, ytitle,
					dataSet, PlotOrientation.VERTICAL, // 绘制方向
					true, // 显示图例
					true, // 采用标准生成器
					false // 是否生成超链接
					);
		}
		chart.setTitle(setChartTile(title)); // 设置标题
		setJFreeChartBaseInfo(chart); // 设置chart 基本信息
		// 获取绘图区对象
		CategoryPlot plot = chart.getCategoryPlot();
		setPlotInfo(plot);
		plot.setBackgroundPaint(Color.LIGHT_GRAY); // 设置绘图区背景色
		plot.setRangeGridlinePaint(Color.WHITE); // 设置水平方向背景线颜色
		plot.setRangeGridlinesVisible(true);// 设置是否显示水平方向背景线,默认值为true
		// plot.setDomainGridlinePaint(Color.WHITE); // 设置垂直方向背景线颜色
		// plot.setDomainGridlinesVisible(true); // 设置是否显示垂直方向背景线,默认值为false

		// X轴设置
		CategoryAxis domainAxis = plot.getDomainAxis();
		setXLineBaseInfo(domainAxis); // 设置X轴基本信息
		domainAxis.setMaximumCategoryLabelLines(2);

		// Y轴设置
		ValueAxis rangeAxis = plot.getRangeAxis();
		setYLineBaseInfo(rangeAxis); // 设置Y轴基本信息
		rangeAxis.setStandardTickUnits(NumberAxis.createIntegerTickUnits());// Y轴显示整数
		rangeAxis.setAutoRangeMinimumSize(1); // 最小跨度
		rangeAxis.setLowerBound(0); // 最小值显示0
		rangeAxis.setAutoRange(false); // 不自动分配Y轴数据

		// 获取折线对象
		LineAndShapeRenderer renderer = (LineAndShapeRenderer) plot
				.getRenderer();
		BasicStroke realLine = new BasicStroke(1.8f); // 设置实线
		// 设置虚线
		float dashes[] = { 5.0f };
		BasicStroke brokenLine = new BasicStroke(2.2f, // 线条粗细
				BasicStroke.CAP_ROUND, // 端点风格
				BasicStroke.JOIN_ROUND, // 折点风格
				8f, dashes, 0.6f);
		for (int i = 0; i < dataSet.getRowCount(); i++) {
			if (i % 2 == 0)
				renderer.setSeriesStroke(i, realLine); // 利用实线绘制
			else
				renderer.setSeriesStroke(i, brokenLine); // 利用虚线绘制
		}
		// 折点处显示信息
		renderer.setBaseItemLabelsVisible(true);
		renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator(
				"{2}", NumberFormat.getNumberInstance()));
		renderer.setBaseItemLabelFont(new Font("宋体", Font.BOLD, 16));
		renderer.setBaseToolTipGenerator(new StandardCategoryToolTipGenerator(
				"{2}", NumberFormat.getNumberInstance()));

		// 凸显折点处
		renderer.setBaseShapesVisible(true);
		renderer.setDrawOutlines(true);
		renderer.setUseFillPaint(true);
		return chart;
	}

	/**
	 * 生成 仪表图
	 * 
	 * @param dataset
	 *            报表数据
	 * @param title
	 *            报表标题
	 * @param xtitle
	 *            X轴描述
	 * @param ytitle
	 *            Y轴描述
	 * @param is3D
	 *            是否3D效果
	 * @return JFreeChart
	 */
	public static String createMeterChart(HttpSession session, PrintWriter pw)
			throws Exception {
		DefaultValueDataset dataset = new DefaultValueDataset();
		dataset = new DefaultValueDataset(40);
		DialPlot dialplot = new DialPlot();
		dialplot.setDataset(dataset);
		// 开始设置显示框架结构
		StandardDialFrame standarddialframe = new StandardDialFrame();
		standarddialframe.setBackgroundPaint(Color.black);
		standarddialframe.setForegroundPaint(Color.darkGray);// 圆边的颜色
		dialplot.setDialFrame(standarddialframe);
		// 结束设置显示框架结构
		GradientPaint gradientpaint = new GradientPaint(new Point(), new Color(
				255, 255, 255), new Point(), new Color(170, 170, 220));
		DialBackground dialbackground = new DialBackground(gradientpaint);
		dialbackground
				.setGradientPaintTransformer(new StandardGradientPaintTransformer(
						GradientPaintTransformType.VERTICAL));
		dialplot.setBackground(dialbackground);
		// 设置显示在表盘中央位置的信息
		DialTextAnnotation dialtextannotation = new DialTextAnnotation("成本执行");
		dialtextannotation.setFont(new Font("Dialog", 17, 17));
		dialtextannotation.setRadius(0.6D);// 字体距离圆心的距离
		dialplot.addLayer(dialtextannotation);
		DialValueIndicator dialvalueindicator = new DialValueIndicator(0);
		dialplot.addLayer(dialvalueindicator);
		// 根据表盘的直径大小（0.88），设置总刻度范围
		StandardDialScale standarddialscale = new StandardDialScale(0.0D,
				100.0D, -120.0D, -300.0D, 10D, 9);
		standarddialscale.setTickRadius(0.9D);
		standarddialscale.setTickLabelOffset(0.1D);// 显示数字 距离圆边的距离
		standarddialscale.setTickLabelFont(new Font("Dialog", 0, 14));
		// 主意是 dialplot.addScale（）不是dialplot.addLayer（）
		dialplot.addScale(0, standarddialscale);
		// 设置刻度范围（红色）
		StandardDialRange standarddialrange = new StandardDialRange(0D, 50D,
				Color.green);
		standarddialrange.setInnerRadius(0.6D);
		standarddialrange.setOuterRadius(0.62D);
		dialplot.addLayer(standarddialrange);
		// 设置刻度范围（橘黄色）
		StandardDialRange standarddialrange1 = new StandardDialRange(50D, 80D,
				Color.orange);
		standarddialrange1.setInnerRadius(0.6D);// 半径返回 两条线
		standarddialrange1.setOuterRadius(0.62D);
		dialplot.addLayer(standarddialrange1);
		// 设置刻度范围（绿色）
		StandardDialRange standarddialrange2 = new StandardDialRange(80D, 100D,
				Color.red);
		standarddialrange2.setInnerRadius(0.6D);
		standarddialrange2.setOuterRadius(0.62D);
		dialplot.addLayer(standarddialrange2);
		// 设置指针
		org.jfree.chart.plot.dial.DialPointer.Pointer pointer = new org.jfree.chart.plot.dial.DialPointer.Pointer();
		dialplot.addLayer(pointer);
		// 实例化DialCap
		DialCap dialcap = new DialCap();
		dialcap.setRadius(0.1D);// 指针中心圆的大小
		dialplot.setCap(dialcap);
		// 生成chart对象
		JFreeChart jfreechart = new JFreeChart(dialplot);

		// 设置标题
		jfreechart.setTitle("目标成本执行情况分析");

		String filename = ServletUtilities.saveChartAsPNG(jfreechart, 400, 400,
				session);

		return filename;
	}
}
