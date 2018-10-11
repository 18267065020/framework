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

import com.framework.entity.BpReturnEntity;
import com.framework.service.BpReturnService;
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
@RequestMapping("bp/bpreturn")
public class BpReturnController {
    @Autowired
    private BpReturnService bpReturnService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("bp:bpreturn:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = bpReturnService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("bp:bpreturn:info")
    public R info(@PathVariable("id") Long id){
        BpReturnEntity bpReturn = bpReturnService.selectById(id);

        return R.ok().put("bpReturn", bpReturn);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("bp:bpreturn:save")
    public R save(@RequestBody BpReturnEntity bpReturn){
        bpReturnService.insert(bpReturn);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("bp:bpreturn:update")
    public R update(@RequestBody BpReturnEntity bpReturn){
        ValidatorUtils.validateEntity(bpReturn);
        bpReturnService.updateAllColumnById(bpReturn);//全部更新
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("bp:bpreturn:delete")
    public R delete(@RequestBody Long[] ids){
        bpReturnService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
