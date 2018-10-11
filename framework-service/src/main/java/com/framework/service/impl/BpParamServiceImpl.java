package com.framework.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.common.utils.PageUtils;
import com.framework.common.utils.Query;

import com.framework.dao.BpParamDao;
import com.framework.entity.BpParamEntity;
import com.framework.service.BpParamService;


@Service("bpParamService")
public class BpParamServiceImpl extends ServiceImpl<BpParamDao, BpParamEntity> implements BpParamService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BpParamEntity> page = this.selectPage(
                new Query<BpParamEntity>(params).getPage(),
                new EntityWrapper<BpParamEntity>()
        );

        return new PageUtils(page);
    }

}
