package com.zy.portal.common;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.tagext.BodyTagSupport;
import java.time.LocalDate;

/**
 * @ClassName: CommonTag
 * @Description: TODO 通用标签
 */
public class TopTag extends BodyTagSupport {

	private Long value;

	private static final long serialVersionUID = -3579175719405130600L;

	public TopTag() {
		super();
	}

	@Override
	public int doStartTag() throws JspException {
		JspWriter out = this.pageContext.getOut();
		try {
			Long now = System.currentTimeMillis();
				// 校验置顶标志
			if (now - value < 60*60*24*1000*7) {
				// 输出置顶样式
				out.print("&nbsp;<span class='badge badge-danger'>热门</span>");
			} else {
				out.print(""); }
		} catch (Exception e) {
			e.printStackTrace();
		}
		return EVAL_BODY_INCLUDE;
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public void release() {
		this.value = null;
		super.release();
	}

	public Long getValue() {
		return value;
	}

	public void setValue(Long value) {
		this.value = value;
	}
}
