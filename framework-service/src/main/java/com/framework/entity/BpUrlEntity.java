package com.framework.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 链接信息; InnoDB free: 3072 kB
 * 
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
@TableName("bp_url")
public class BpUrlEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	@JsonProperty("id")
		private Long id;
	/**
	 * 链接方式
	 */
	@JsonProperty("linkType")
		private String linkType;
	/**
	 * 链接方式
	 */
	@JsonProperty("requestType")
		private String requestType;
	/**
	 * URL地址
	 */
	@JsonProperty("url")
		private String url;
	/**
	 * 链接名
	 */
	@JsonProperty("name")
		private String name;
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
	 * 设置：链接方式
	 */
    @JsonIgnore
	public void setLinkType(String linkType) {
		this.linkType = linkType;
	}
	/**
	 * 获取：链接方式
	 */
    @JsonIgnore
	public String getLinkType() {
		return linkType;
	}
	/**
	 * 设置：链接方式
	 */
    @JsonIgnore
	public void setRequestType(String requestType) {
		this.requestType = requestType;
	}
	/**
	 * 获取：链接方式
	 */
    @JsonIgnore
	public String getRequestType() {
		return requestType;
	}
	/**
	 * 设置：URL地址
	 */
    @JsonIgnore
	public void setUrl(String url) {
		this.url = url;
	}
	/**
	 * 获取：URL地址
	 */
    @JsonIgnore
	public String getUrl() {
		return url;
	}
	/**
	 * 设置：链接名
	 */
    @JsonIgnore
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：链接名
	 */
    @JsonIgnore
	public String getName() {
		return name;
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
