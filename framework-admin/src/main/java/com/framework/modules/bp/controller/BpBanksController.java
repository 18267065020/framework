package com.framework.modules.bp.controller;

import com.framework.common.utils.PageUtils;
import com.framework.common.utils.R;
import com.framework.common.validator.ValidatorUtils;
import com.framework.entity.BpBanksEntity;
import com.framework.service.BpBanksService;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import java.util.Arrays;
import java.util.Map;


/**
 * 网站信息; InnoDB free: 3072 kB
 *
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
@RestController
@RequestMapping("bp/bpbanks")
public class BpBanksController {
    @Autowired
    private BpBanksService bpBanksService;

    /**
     * 列表
     */
    @RequestMapping("/list")
    @RequiresPermissions("bp:bpbanks:list")
    public R list(@RequestParam Map<String, Object> params) {
        PageUtils page = bpBanksService.queryPage(params);

        return R.ok().put("page", page);
    }


    /**
     * 信息
     */
    @RequestMapping("/info/{id}")
    @RequiresPermissions("bp:bpbanks:info")
    public R info(@PathVariable("id") Long id) {
        BpBanksEntity bpBanks = bpBanksService.selectById(id);

        return R.ok().put("bpBanks", bpBanks);
    }

    /**
     * 保存
     */
    @RequestMapping("/save")
    @RequiresPermissions("bp:bpbanks:save")
    public R save(@RequestBody BpBanksEntity bpBanks) {
        bpBanksService.insert(bpBanks);

        return R.ok();
    }

    /**
     * 修改
     */
    @RequestMapping("/update")
    @RequiresPermissions("bp:bpbanks:update")
    public R update(@RequestBody BpBanksEntity bpBanks) {
        ValidatorUtils.validateEntity(bpBanks);
        bpBanksService.updateAllColumnById(bpBanks);//全部更新

        return R.ok();
    }

    /**
     * 删除
     */
    @RequestMapping("/delete")
    @RequiresPermissions("bp:bpbanks:delete")
    public R delete(@RequestBody Long[] ids) {
        bpBanksService.deleteBatchIds(Arrays.asList(ids));

        return R.ok();
    }

}
