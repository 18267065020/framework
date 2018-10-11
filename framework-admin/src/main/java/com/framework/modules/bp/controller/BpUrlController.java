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

import com.framework.entity.BpUrlEntity;
import com.framework.service.BpUrlService;
import com.framework.common.utils.PageUtils;
import com.framework.common.utils.R;



/**
 * 链接信息; InnoDB free: 3072 kB
 *
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
@RestController
@RequestMapping("sys/bpurl")
public class BpUrlController {
    @Autowired
    private BpUrlService bpUrlService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("bp:bpurl:list")
    public R list(@RequestParam Map<String, Object> params){
        PageUtils page = bpUrlService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("bp:bpurl:info")
    public R info(@PathVariable("id") Long id){
        BpUrlEntity bpUrl = bpUrlService.selectById(id);

        return R.ok().put("bpUrl", bpUrl);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("bp:bpurl:save")
    public R save(@RequestBody BpUrlEntity bpUrl){
        bpUrlService.insert(bpUrl);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("bp:bpurl:update")
    public R update(@RequestBody BpUrlEntity bpUrl){
        ValidatorUtils.validateEntity(bpUrl);
        bpUrlService.updateAllColumnById(bpUrl);//全部更新
        
        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("bp:bpurl:delete")
    public R delete(@RequestBody Long[] ids){
        bpUrlService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
