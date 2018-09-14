package com.framework.form;

import javax.validation.constraints.NotBlank;

import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

/**
 * 注册表单
 */
@ApiModel(value = "注册表单")
public class RegisterForm {
	@ApiModelProperty(value = "手机号")
	@NotBlank(message = "手机号不能为空")
	private String phone;

	@ApiModelProperty(value = "密码")
	@NotBlank(message = "密码不能为空")
	private String password;
	
	@ApiModelProperty(value = "验证码")
	@NotBlank(message = "验证码不能为空")
	private String codes;
	
	


	public String getCodes() {
		return codes;
	}

	public void setCodes(String codes) {
		this.codes = codes;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
}
