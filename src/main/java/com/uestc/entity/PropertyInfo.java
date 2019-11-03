package com.uestc.entity;

import java.util.Date;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 物业信息表
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-15
 */
@TableName("property_info")
public class PropertyInfo extends Model<PropertyInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 房间号
     */
    private String roomName;

    /**
     * 所属年月
     */
    private String month;

    /**
     * 当前用水量(吨)
     */
    private Integer waterNum;

    /**
     * 当前用电量(度)
     */
    private Integer electricNum;

    /**
     * 记录时间
     */
    private Date recordDateTime;

    /**
     * 版本号
     */
    private Integer version;

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
    public String getMonth() {
        return month;
    }

    public void setMonth(String month) {
        this.month = month;
    }
    public Integer getWaterNum() {
        return waterNum;
    }

    public void setWaterNum(Integer waterNum) {
        this.waterNum = waterNum;
    }
    public Integer getElectricNum() {
        return electricNum;
    }

    public void setElectricNum(Integer electricNum) {
        this.electricNum = electricNum;
    }
    public Date getRecordDateTime() {
        return recordDateTime;
    }

    public void setRecordDateTime(Date recordDateTime) {
        this.recordDateTime = recordDateTime;
    }
    public Integer getVersion() {
        return version;
    }

    public void setVersion(Integer version) {
        this.version = version;
    }

    @Override
    protected Serializable pkVal() {
        return this.roomName;
    }

    @Override
    public String toString() {
        return "PropertyInfo{" +
        "roomName=" + roomName +
        ", month=" + month +
        ", waterNum=" + waterNum +
        ", electricNum=" + electricNum +
        ", recordDateTime=" + recordDateTime +
        ", version=" + version +
        "}";
    }
}
