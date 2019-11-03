package com.uestc.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 系统设置表
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-19
 */
@TableName("bus_param")
public class BusParam extends Model<BusParam> {

    private static final long serialVersionUID = 1L;

    /**
     * 主键
     */
    private String Id;

    /**
     * KEY
     */
    private String sysKey;

    /**
     * 名称
     */
    private String sysName;

    /**
     * 值
     */
    private String sysValue;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 说明
     */
    private String sysDesc;

    public String getId() {
        return Id;
    }

    public void setId(String Id) {
        this.Id = Id;
    }
    public String getSysKey() {
        return sysKey;
    }

    public void setSysKey(String sysKey) {
        this.sysKey = sysKey;
    }
    public String getSysName() {
        return sysName;
    }

    public void setSysName(String sysName) {
        this.sysName = sysName;
    }
    public String getSysValue() {
        return sysValue;
    }

    public void setSysValue(String sysValue) {
        this.sysValue = sysValue;
    }
    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }
    public String getSysDesc() {
        return sysDesc;
    }

    public void setSysDesc(String sysDesc) {
        this.sysDesc = sysDesc;
    }

    @Override
    protected Serializable pkVal() {
        return this.Id;
    }

    @Override
    public String toString() {
        return "BusParam{" +
        "Id=" + Id +
        ", sysKey=" + sysKey +
        ", sysName=" + sysName +
        ", sysValue=" + sysValue +
        ", sort=" + sort +
        ", sysDesc=" + sysDesc +
        "}";
    }
}
