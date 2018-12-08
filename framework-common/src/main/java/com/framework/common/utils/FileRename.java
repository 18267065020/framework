package com.framework.common.utils;

import java.util.HashMap;
import java.util.Map;

/**
 * 重命名规则类
 *
 * @author jack
 */
public class FileRename {
    private Map<String, String> map;


    public FileRename() {
        this.map = new HashMap<String, String>();
    }

    public Map<String, String> getMap() {
        return map;
    }

    // 添加新的替换规则(字符串替换)
    public FileRename addRegulation(String oldStr, String newStr) {
        this.map.put(oldStr, newStr);
        return this;
    }

}
