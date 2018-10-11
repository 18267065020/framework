package com.framework.service;

import com.baomidou.mybatisplus.service.IService;
import com.framework.common.utils.PageUtils;
import com.framework.entity.BpReturnEntity;

import java.util.Map;

/**
 * 会员表; InnoDB free: 3072 kB
 *
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
public interface BpReturnService extends IService<BpReturnEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

