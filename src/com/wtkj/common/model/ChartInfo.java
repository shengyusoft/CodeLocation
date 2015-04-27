package com.wtkj.common.model;

/**
 * freechart 图表基本属性(vo)
 * 
 * @author sunsi
 * 
 */
public class ChartInfo implements java.io.Serializable {
	private static final long serialVersionUID = 1L;
	private String title;
	private String xTitle;
	private String yTitle;
	private boolean is3D;
	private Integer width;
	private Integer height;

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getxTitle() {
		return xTitle;
	}

	public void setxTitle(String xTitle) {
		this.xTitle = xTitle;
	}

	public String getyTitle() {
		return yTitle;
	}

	public void setyTitle(String yTitle) {
		this.yTitle = yTitle;
	}

	public boolean isIs3D() {
		return is3D;
	}

	public void setIs3D(boolean is3d) {
		is3D = is3d;
	}

	public Integer getWidth() {
		return width;
	}

	public void setWidth(Integer width) {
		this.width = width;
	}

	public Integer getHeight() {
		return height;
	}

	public void setHeight(Integer height) {
		this.height = height;
	}

}
