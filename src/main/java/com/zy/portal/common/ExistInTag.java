package com.zy.portal.common;

import java.util.Collection;
import javax.servlet.jsp.JspException;
import javax.servlet.jsp.tagext.BodyTagSupport;

/**
 * @ClassName: ExistInTag
 * @Description: TODO 检查某个值是否存在某个List/Array
 */
public class ExistInTag extends BodyTagSupport {

	private String value;

	private Collection<Object> items;

	/**
	 * @Fields serialVersionUID : TODO
	 */
	private static final long serialVersionUID = -6945378748854701869L;

	/**
	 * @Title: ExistInTag
	 * @Description: TODO
	 * @param
	 */
	public ExistInTag() {
		super();
	}

	@Override
	public int doStartTag() throws JspException {
		try {
			// 参数校验
			if (CommonUtil.isNotEmpty(value) && CommonUtil.isNotEmpty(items)) {
				// 遍历集合
				for (Object obj : items) {
					if (obj.toString().trim().equals(value.trim())) {
						return EVAL_BODY_INCLUDE;
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return SKIP_BODY;
	}

	@Override
	public int doEndTag() throws JspException {
		return EVAL_PAGE;
	}

	@Override
	public void release() {
		this.value = null;
		this.items = null;
		super.release();
	}

	/**
	 * @return the value
	 */
	public String getValue() {
		return value;
	}

	/**
	 * @param value
	 *            the value to set
	 */
	public void setValue(String value) {
		this.value = value;
	}

	/**
	 * @return the items
	 */
	public Collection<Object> getItems() {
		return items;
	}

	/**
	 * @param items
	 *            the items to set
	 */
	public void setItems(Collection<Object> items) {
		this.items = items;
	}

}
