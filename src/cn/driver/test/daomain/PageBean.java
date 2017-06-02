package cn.driver.test.daomain;

import java.util.List;

public class PageBean<T> {
	private int pc;//pageCode，当前页码
	private int tr;//totalRecord, 总记录数
	private int ps;//pagesize, 每页记录数
//	private int tp;//totalPage, 总页数
	private List<T> datas;//当前页记录
	
	private String url;//用来保存条件！
	
	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	/*
	 * 返回总页数
	 */
	public int getTp() {
		int tp = tr / ps;
		return tr % ps == 0 ? tp : tp + 1;
	}
	
	public int getPc() {
		return pc;
	}
	public void setPc(int pc) {
		this.pc = pc;
	}
	public int getTr() {
		return tr;
	}
	public void setTr(int tr) {
		this.tr = tr;
	}
	public int getPs() {
		return ps;
	}
	public void setPs(int ps) {
		this.ps = ps;
	}

	public List<T> getDatas() {
		return datas;
	}
	public void setDatas(List<T> datas) {
		this.datas = datas;
	}
}

