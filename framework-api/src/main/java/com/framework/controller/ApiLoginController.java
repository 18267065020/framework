package com.framework.controller;

import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.framework.annotation.Login;
import com.framework.common.utils.R;
import com.framework.common.validator.ValidatorUtils;
import com.framework.entity.BpBanksEntity;
import com.framework.form.LoginForm;
import com.framework.service.BpBanksService;
import com.framework.service.TokenService;
import com.framework.service.UserService;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import springfox.documentation.annotations.ApiIgnore;

import java.util.HashMap;
import java.util.Map;

/**
 * 登录接口
 */
@RestController
@RequestMapping("/api")
@Api(tags = "登录接口")
public class ApiLoginController {
    @Autowired
    private UserService userService;
    @Autowired
    private TokenService tokenService;
    @Autowired
    private BpBanksService bpBanksService;

    @PostMapping("login")
    @ApiOperation("登录")
    public R login(LoginForm form) {
        // 表单校验
        ValidatorUtils.validateEntity(form);

        // 用户登录
        Map<String, Object> map = userService.login(form);

        return R.ok(map);
    }

    @Login
    @PostMapping("logout")
    @ApiOperation("退出")
    public R logout(@ApiIgnore @RequestAttribute("userId") long userId) {
        tokenService.expireToken(userId);
        return R.ok();
    }

    @GetMapping("bp")
    @ApiOperation("bpbank")
    public R bpbank() {
        Map map = new HashMap();
        map.put("data", bpBanksService.selectList(new EntityWrapper<BpBanksEntity>()));
        return R.ok(map);
    }

}
