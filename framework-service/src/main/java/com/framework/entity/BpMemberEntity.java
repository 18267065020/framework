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
@TableName("bp_member")
public class BpMemberEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	/**
	 * 
	 */
	@TableId
	@JsonProperty("id")
		private Long id;
	/**
	 * 网站id
	 */
	@JsonProperty("banksId")
		private Long banksId;
	/**
	 * 会员名
	 */
	@JsonProperty("name")
		private String name;
	/**
	 * 会员账号
	 */
	@JsonProperty("username")
		private String username;
	/**
	 * 会员密码
	 */
	@JsonProperty("password")
		private String password;
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
	 * 设置：网站id
	 */
    @JsonIgnore
	public void setBanksId(Long banksId) {
		this.banksId = banksId;
	}
	/**
	 * 获取：网站id
	 */
    @JsonIgnore
	public Long getBanksId() {
		return banksId;
	}
	/**
	 * 设置：会员名
	 */
    @JsonIgnore
	public void setName(String name) {
		this.name = name;
	}
	/**
	 * 获取：会员名
	 */
    @JsonIgnore
	public String getName() {
		return name;
	}
	/**
	 * 设置：会员账号
	 */
    @JsonIgnore
	public void setUsername(String username) {
		this.username = username;
	}
	/**
	 * 获取：会员账号
	 */
    @JsonIgnore
	public String getUsername() {
		return username;
	}
	/**
	 * 设置：会员密码
	 */
    @JsonIgnore
	public void setPassword(String password) {
		this.password = password;
	}
	/**
	 * 获取：会员密码
	 */
    @JsonIgnore
	public String getPassword() {
		return password;
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
