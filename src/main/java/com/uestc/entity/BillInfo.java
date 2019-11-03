package com.uestc.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableName;
import java.io.Serializable;

/**
 * <p>
 * 账单信息表
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-26
 */
@TableName("bill_info")
public class BillInfo extends Model<BillInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 房间编号
     */
    private String roomName;

    /**
     * 账单年月
     */
    private String month;

    /**
     * 租客姓名
     */
    private String tenantName;

    /**
     * 上月水量
     */
    private Integer lastMonthWater;

    /**
     * 本月水量
     */
    private Integer curMonthWater;

    /**
     * 实用水量
     */
    private Integer realUseWater;

    /**
     * 水费单价
     */
    private BigDecimal waterUnitPrice;

    /**
     * 上月电量
     */
    private Integer lastMonthEle;

    /**
     * 本月电量
     */
    private Integer curMonthEle;

    /**
     * 实用电量
     */
    private Integer realUseEle;

    /**
     * 电费单价
     */
    private BigDecimal eleUnitPrice;

    /**
     * 月租
     */
    private BigDecimal rental;

    /**
     * 电梯费
     */
    private BigDecimal liftFee;

    /**
     * 网费
     */
    private BigDecimal netFee;

    /**
     * 卫生费
     */
    private BigDecimal sanitaryFee;

    /**
     * 公共费
     */
    private BigDecimal publicFee;

    /**
     * 房租总费用
     */
    private BigDecimal totalFees;

    /**
     * 缴纳标志 T - 已缴纳,F - 未缴纳
     */
    private String payFlag;

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
    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }
    public Integer getLastMonthWater() {
        return lastMonthWater;
    }

    public void setLastMonthWater(Integer lastMonthWater) {
        this.lastMonthWater = lastMonthWater;
    }
    public Integer getCurMonthWater() {
        return curMonthWater;
    }

    public void setCurMonthWater(Integer curMonthWater) {
        this.curMonthWater = curMonthWater;
    }
    public Integer getRealUseWater() {
        return realUseWater;
    }

    public void setRealUseWater(Integer realUseWater) {
        this.realUseWater = realUseWater;
    }
    public BigDecimal getWaterUnitPrice() {
        return waterUnitPrice;
    }

    public void setWaterUnitPrice(BigDecimal waterUnitPrice) {
        this.waterUnitPrice = waterUnitPrice;
    }
    public Integer getLastMonthEle() {
        return lastMonthEle;
    }

    public void setLastMonthEle(Integer lastMonthEle) {
        this.lastMonthEle = lastMonthEle;
    }
    public Integer getCurMonthEle() {
        return curMonthEle;
    }

    public void setCurMonthEle(Integer curMonthEle) {
        this.curMonthEle = curMonthEle;
    }
    public Integer getRealUseEle() {
        return realUseEle;
    }

    public void setRealUseEle(Integer realUseEle) {
        this.realUseEle = realUseEle;
    }
    public BigDecimal getEleUnitPrice() {
        return eleUnitPrice;
    }

    public void setEleUnitPrice(BigDecimal eleUnitPrice) {
        this.eleUnitPrice = eleUnitPrice;
    }
    public BigDecimal getRental() {
        return rental;
    }

    public void setRental(BigDecimal rental) {
        this.rental = rental;
    }
    public BigDecimal getLiftFee() {
        return liftFee;
    }

    public void setLiftFee(BigDecimal liftFee) {
        this.liftFee = liftFee;
    }
    public BigDecimal getNetFee() {
        return netFee;
    }

    public void setNetFee(BigDecimal netFee) {
        this.netFee = netFee;
    }
    public BigDecimal getSanitaryFee() {
        return sanitaryFee;
    }

    public void setSanitaryFee(BigDecimal sanitaryFee) {
        this.sanitaryFee = sanitaryFee;
    }
    public BigDecimal getPublicFee() {
        return publicFee;
    }

    public void setPublicFee(BigDecimal publicFee) {
        this.publicFee = publicFee;
    }
    public BigDecimal getTotalFees() {
        return totalFees;
    }

    public void setTotalFees(BigDecimal totalFees) {
        this.totalFees = totalFees;
    }
    public String getPayFlag() {
        return payFlag;
    }

    public void setPayFlag(String payFlag) {
        this.payFlag = payFlag;
    }

    @Override
    protected Serializable pkVal() {
        return this.roomName;
    }

    @Override
    public String toString() {
        return "BillInfo{" +
        "roomName=" + roomName +
        ", month=" + month +
        ", tenantName=" + tenantName +
        ", lastMonthWater=" + lastMonthWater +
        ", curMonthWater=" + curMonthWater +
        ", realUseWater=" + realUseWater +
        ", waterUnitPrice=" + waterUnitPrice +
        ", lastMonthEle=" + lastMonthEle +
        ", curMonthEle=" + curMonthEle +
        ", realUseEle=" + realUseEle +
        ", eleUnitPrice=" + eleUnitPrice +
        ", rental=" + rental +
        ", liftFee=" + liftFee +
        ", netFee=" + netFee +
        ", sanitaryFee=" + sanitaryFee +
        ", publicFee=" + publicFee +
        ", totalFees=" + totalFees +
        ", payFlag=" + payFlag +
        "}";
    }
}
