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

import com.framework.entity.BpTypesEntity;
import com.framework.service.BpTypesService;
import com.framework.common.utils.PageUtils;
import com.framework.common.utils.R;



/**
 * 类型表; InnoDB free: 3072 kB
 *
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
@RestController
@RequestMapping("bp/bptypes")
public class BpTypesController {
    @Autowired
    private BpTypesService bpTypesService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("bp:bptypes:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = bpTypesService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("bp:bptypes:info")
    public R info(@PathVariable("id") Long id){
        BpTypesEntity bpTypes = bpTypesService.selectById(id);

        return R.ok().put("bpTypes", bpTypes);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("bp:bptypes:save")
    public R save(@RequestBody BpTypesEntity bpTypes){
        bpTypesService.insert(bpTypes);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("bp:bptypes:update")
    public R update(@RequestBody BpTypesEntity bpTypes){
        ValidatorUtils.validateEntity(bpTypes);
        bpTypesService.updateAllColumnById(bpTypes);//全部更新
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("bp:bptypes:delete")
    public R delete(@RequestBody Long[] ids){
        bpTypesService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
