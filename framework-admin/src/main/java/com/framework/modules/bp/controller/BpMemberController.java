package com.framework.modules.bp.controller;

import java.util.Arrays;
import java.util.Map;

import com.framework.common.validator.ValidatorUtils;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.framework.entity.BpMemberEntity;
import com.framework.service.BpMemberService;
import com.framework.common.utils.PageUtils;
import com.framework.common.utils.R;



/**
 * 会员表; InnoDB free: 3072 kB
 *
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
@RestController
@RequestMapping("bp/bpmember")
public class BpMemberController {
    @Autowired
    private BpMemberService bpMemberService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("bp:bpmember:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = bpMemberService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("bp:bpmember:info")
    public R info(@PathVariable("id") Long id){
        BpMemberEntity bpMember = bpMemberService.selectById(id);

        return R.ok().put("bpMember", bpMember);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("bp:bpmember:save")
    public R save(@RequestBody BpMemberEntity bpMember){
        bpMemberService.insert(bpMember);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("bp:bpmember:update")
    public R update(@RequestBody BpMemberEntity bpMember){
        ValidatorUtils.validateEntity(bpMember);
        bpMemberService.updateAllColumnById(bpMember);//全部更新
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("bp:bpmember:delete")
    public R delete(@RequestBody Long[] ids){
        bpMemberService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
