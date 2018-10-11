package com.framework.entity;

import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.annotation.JsonFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * 类型表; InnoDB free: 3072 kB
 * 
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
@TableName("bp_types")
public class BpTypesEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	@JsonProperty("id")
		private Long id;
	/**
	 * 父ID
	 */
	@JsonProperty("parentId")
		private Long parentId;
	/**
	 * 类型名
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
	 * 设置：父ID
	 */
    @JsonIgnore
	public void setParentId(Long parentId) {
		this.parentId = parentId;
	}
	/**
	 * 获取：父ID
	 */
    @JsonIgnore
	public Long getParentId() {
		return parentId;
	}
	/**
	 * 设置：类型名
	 */
    @JsonIgnore
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：类型名
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
