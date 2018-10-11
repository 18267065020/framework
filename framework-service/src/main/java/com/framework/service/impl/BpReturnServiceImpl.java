package com.framework.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.common.utils.PageUtils;
import com.framework.common.utils.Query;

import com.framework.dao.BpReturnDao;
import com.framework.entity.BpReturnEntity;
import com.framework.service.BpReturnService;


@Service("bpReturnService")
public class BpReturnServiceImpl extends ServiceImpl<BpReturnDao, BpReturnEntity> implements BpReturnService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BpReturnEntity> page = this.selectPage(
                new Query<BpReturnEntity>(params).getPage(),
                new EntityWrapper<BpReturnEntity>()
        );

        return new PageUtils(page);
    }

}
