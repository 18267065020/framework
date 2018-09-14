package com.framework.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.framework.form.RegisterForm;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

/**
 * 注册接口
 */
@RestController
@RequestMapping("/api/register")
@Api(tags = "注册接口")
public class ApiRegisterController {

	@PostMapping("register")
	@ApiOperation("注册")
	public Map<String, Object> register(RegisterForm form) {
		// 表单校验
		//ValidatorUtils.validateEntity(form);
		Map<String, Object> map = new HashMap<String, Object>();
		return map;
	}
	
}
