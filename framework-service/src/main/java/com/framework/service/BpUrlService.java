package com.framework.service;

import com.baomidou.mybatisplus.service.IService;
import com.framework.common.utils.PageUtils;
import com.framework.entity.BpUrlEntity;
import com.framework.entity.BpUrlEntity;

import java.util.Map;

/**
 * 链接信息; InnoDB free: 3072 kB
 *
 * @author MIT
 * @email framework@gmail.com
 * @date 2018-10-11 22:27:05
 */
public interface BpUrlService extends IService<BpUrlEntity> {

    PageUtils queryPage(Map<String, Object> params);
}

