package com.framework.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.common.utils.PageUtils;
import com.framework.common.utils.Query;

import com.framework.dao.BpUrlDao;
import com.framework.entity.BpUrlEntity;
import com.framework.service.BpUrlService;


@Service("bpUrlService")
public class BpUrlServiceImpl extends ServiceImpl<BpUrlDao, BpUrlEntity> implements BpUrlService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BpUrlEntity> page = this.selectPage(
                new Query<BpUrlEntity>(params).getPage(),
                new EntityWrapper<BpUrlEntity>()
        );

        return new PageUtils(page);
    }

}
