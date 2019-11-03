package com.uestc.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 房源信息表
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-13
 */
@TableName("room_info")
public class RoomInfo extends Model<RoomInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 房间号 xxxxx
     */
    private String roomName;

    /**
     * 房型 10 - 单间,11 - 一室一厅,21 - 两室一厅,31 - 三室一厅
     */
    private String roomType;

    /**
     * 用途
     */
    private String application;

    /**
     * 房间面积(平方米)
     */
    private Integer size;

    /**
     * 朝向
     */
    private String orientation;

    /**
     * 出租状态 1 -已出租，0-未出租
     */
    private Integer state;

    /**
     * 配套设施
     */
    private String appendix;

    /**
     * 家用电器
     */
    private String houseAppliances;

    /**
     * 租金
     */
    private BigDecimal rental;

    /**
     * 押付模式 1 - 押一付一，2 - 押二付一,3 - 自定义
     */
    private Integer rentPatten;

    /**
     * 押金
     */
    private BigDecimal deposit;

    /**
     * 网费
     */
    private BigDecimal netPrice;

    /**
     * 是否电梯房 1-是,0-否
     */
    private Integer hasLift;

    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
    public String getRoomType() {
        return roomType;
    }

    public void setRoomType(String roomType) {
        this.roomType = roomType;
    }
    public String getApplication() {
        return application;
    }

    public void setApplication(String application) {
        this.application = application;
    }
    public Integer getSize() {
        return size;
    }

    public void setSize(Integer size) {
        this.size = size;
    }
    public String getOrientation() {
        return orientation;
    }

    public void setOrientation(String orientation) {
        this.orientation = orientation;
    }
    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }
    public String getAppendix() {
        return appendix;
    }

    public void setAppendix(String appendix) {
        this.appendix = appendix;
    }
    public String getHouseAppliances() {
        return houseAppliances;
    }

    public void setHouseAppliances(String houseAppliances) {
        this.houseAppliances = houseAppliances;
    }
    public BigDecimal getRental() {
        return rental;
    }

    public void setRental(BigDecimal rental) {
        this.rental = rental;
    }
    public Integer getRentPatten() {
        return rentPatten;
    }

    public void setRentPatten(Integer rentPatten) {
        this.rentPatten = rentPatten;
    }
    public BigDecimal getDeposit() {
        return deposit;
    }

    public void setDeposit(BigDecimal deposit) {
        this.deposit = deposit;
    }
    public BigDecimal getNetPrice() {
        return netPrice;
    }

    public void setNetPrice(BigDecimal netPrice) {
        this.netPrice = netPrice;
    }
    public Integer getHasLift() {
        return hasLift;
    }

    public void setHasLift(Integer hasLift) {
        this.hasLift = hasLift;
    }

    @Override
    protected Serializable pkVal() {
        return this.roomName;
    }

    @Override
    public String toString() {
        return "RoomInfo{" +
        "roomName=" + roomName +
        ", roomType=" + roomType +
        ", application=" + application +
        ", size=" + size +
        ", orientation=" + orientation +
        ", state=" + state +
        ", appendix=" + appendix +
        ", houseAppliances=" + houseAppliances +
        ", rental=" + rental +
        ", rentPatten=" + rentPatten +
        ", deposit=" + deposit +
        ", netPrice=" + netPrice +
        ", hasLift=" + hasLift +
        "}";
    }
}
