package com.framework.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 会员表; InnoDB free: 3072 kB
 * 
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
@TableName("bp_return")
public class BpReturnEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	@JsonProperty("id")
		private Long id;
	/**
	 * urlid
	 */
	@JsonProperty("urlId")
		private Long urlId;
	/**
	 * 会员id
	 */
	@JsonProperty("memberId")
		private Long memberId;
	/**
	 * 返回值
	 */
	@JsonProperty("returnValue")
		private String returnValue;
	/**
	 * 创建时间
	 */
	@JsonProperty("createDate")
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd hh:mm:ss")
		private Date createDate;

	/**
	 * 设置：
	 */
    @JsonIgnore
	public void setId(Long id) {
		this.id = id;
	}
	/**
	 * 获取：
	 */
    @JsonIgnore
	public Long getId() {
		return id;
	}
	/**
	 * 设置：urlid
	 */
    @JsonIgnore
	public void setUrlId(Long urlId) {
		this.urlId = urlId;
	}
	/**
	 * 获取：urlid
	 */
    @JsonIgnore
	public Long getUrlId() {
		return urlId;
	}
	/**
	 * 设置：会员id
	 */
    @JsonIgnore
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	/**
	 * 获取：会员id
	 */
    @JsonIgnore
	public Long getMemberId() {
		return memberId;
	}
	/**
	 * 设置：返回值
	 */
    @JsonIgnore
	public void setReturnValue(String returnValue) {
		this.returnValue = returnValue;
	}
	/**
	 * 获取：返回值
	 */
    @JsonIgnore
	public String getReturnValue() {
		return returnValue;
	}
	/**
	 * 设置：创建时间
	 */
    @JsonIgnore
	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
	/**
	 * 获取：创建时间
	 */
    @JsonIgnore
	public Date getCreateDate() {
		return createDate;
	}
}
