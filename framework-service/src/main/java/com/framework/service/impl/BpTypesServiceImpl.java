package com.framework.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.common.utils.PageUtils;
import com.framework.common.utils.Query;

import com.framework.dao.BpTypesDao;
import com.framework.entity.BpTypesEntity;
import com.framework.service.BpTypesService;


@Service("bpTypesService")
public class BpTypesServiceImpl extends ServiceImpl<BpTypesDao, BpTypesEntity> implements BpTypesService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BpTypesEntity> page = this.selectPage(
                new Query<BpTypesEntity>(params).getPage(),
                new EntityWrapper<BpTypesEntity>()
        );

        return new PageUtils(page);
    }

}
