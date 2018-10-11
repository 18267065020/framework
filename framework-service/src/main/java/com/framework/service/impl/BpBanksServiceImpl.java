package com.framework.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.common.utils.PageUtils;
import com.framework.common.utils.Query;

import com.framework.dao.BpBanksDao;
import com.framework.entity.BpBanksEntity;
import com.framework.service.BpBanksService;


@Service("bpBanksService")
public class BpBanksServiceImpl extends ServiceImpl<BpBanksDao, BpBanksEntity> implements BpBanksService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BpBanksEntity> page = this.selectPage(
                new Query<BpBanksEntity>(params).getPage(),
                new EntityWrapper<BpBanksEntity>()
        );

        return new PageUtils(page);
    }

}
