package com.framework.service;

import com.baomidou.mybatisplus.service.IService;
import com.framework.common.utils.PageUtils;
import com.framework.entity.BpMemberEntity;

import java.util.Map;

/**
 * 会员表; InnoDB free: 3072 kB
 *
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
public interface BpMemberService extends IService<BpMemberEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

