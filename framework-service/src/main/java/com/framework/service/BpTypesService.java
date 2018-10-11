package com.framework.service;

import com.baomidou.mybatisplus.service.IService;
import com.framework.common.utils.PageUtils;
import com.framework.entity.BpTypesEntity;

import java.util.Map;

/**
 * 类型表; InnoDB free: 3072 kB
 *
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
public interface BpTypesService extends IService<BpTypesEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

