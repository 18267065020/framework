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

import com.framework.entity.BpParamEntity;
import com.framework.service.BpParamService;
import com.framework.common.utils.PageUtils;
import com.framework.common.utils.R;



/**
 * 参数表; InnoDB free: 3072 kB
 *
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
@RestController
@RequestMapping("bp/bpparam")
public class BpParamController {
    @Autowired
    private BpParamService bpParamService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("bp:bpparam:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = bpParamService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("bp:bpparam:info")
    public R info(@PathVariable("id") Long id){
        BpParamEntity bpParam = bpParamService.selectById(id);

        return R.ok().put("bpParam", bpParam);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("bp:bpparam:save")
    public R save(@RequestBody BpParamEntity bpParam){
        bpParamService.insert(bpParam);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("bp:bpparam:update")
    public R update(@RequestBody BpParamEntity bpParam){
        ValidatorUtils.validateEntity(bpParam);
        bpParamService.updateAllColumnById(bpParam);//全部更新
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("bp:bpparam:delete")
    public R delete(@RequestBody Long[] ids){
        bpParamService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
