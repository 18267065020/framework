package com.framework.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.framework.common.utils.PageUtils;
import com.framework.common.utils.Query;

import com.framework.dao.BpMemberDao;
import com.framework.entity.BpMemberEntity;
import com.framework.service.BpMemberService;


@Service("bpMemberService")
public class BpMemberServiceImpl extends ServiceImpl<BpMemberDao, BpMemberEntity> implements BpMemberService {

    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BpMemberEntity> page = this.selectPage(
                new Query<BpMemberEntity>(params).getPage(),
                new EntityWrapper<BpMemberEntity>()
        );

        return new PageUtils(page);
    }

}
