package com.uestc.entity;

import java.math.BigDecimal;
import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 元器件库存信息表
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-06-11
 */
@TableName("component_info")
public class ComponentInfo extends Model<ComponentInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 元器件id
     */
    private String id;

    /**
     * 元器件类型     描述元器件大类信息，如电容，电阻，电感
     */
    private String compType;

    /**
     * 购买批次号  YYYYMMDDXXXX
     */
    private String purBatchNum;

    /**
     * 型号
     */
    private String typeDesc;

    /**
     * 标称数值
     */
    private BigDecimal standValue;

    /**
     * 允许误差（±%）
     */
    private BigDecimal errorValue;

    /**
     * 封装
     */
    private String capsulation;

    /**
     * 额定工作电压（V）
     */
    private BigDecimal ratedOperaVol;

    /**
     * 额定工作电流(m A)
     */
    private BigDecimal ratedOperaCur;

    /**
     * 最高工作电压（V）
     */
    private BigDecimal maxOperaVol;

    /**
     * 最高工作电流（mA）
     */
    private BigDecimal maxOperaCur;

    /**
     * 品质因数
     */
    private BigDecimal qualityFactor;

    /**
     * 功率因数
     */
    private BigDecimal powerFactor;

    /**
     * 工作阻抗
     */
    private BigDecimal opeImpedance;

    /**
     * 库存数量
     */
    private Integer qualityInStock;

    /**
     * 存放柜子编号
     */
    private String cabinetNum;

    /**
     * 存放盒子编号
     */
    private String boxNum;

    /**
     * 采购渠道
     */
    private String purChanel;

    /**
     * 采购人
     */
    private String purName;

    /**
     * 采购人联系方式
     */
    private String purTelphone;

    /**
     * 采购单价
     */
    private BigDecimal unitPrice;

    /**
     * 采购日期
     */
    private String purDate;

    /**
     * 供货商名称
     */
    private String supplyName;

    /**
     * 供货商联系方式
     */
    private String supplyTelphone;

    /**
     * 供货商地址
     */
    private String supplyAddress;

    /**
     * 登记日期时间
     */
    private String regDateTime;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }
    public String getCompType() {
        return compType;
    }

    public void setCompType(String compType) {
        this.compType = compType;
    }
    public String getPurBatchNum() {
        return purBatchNum;
    }

    public void setPurBatchNum(String purBatchNum) {
        this.purBatchNum = purBatchNum;
    }
    public String getTypeDesc() {
        return typeDesc;
    }

    public void setTypeDesc(String typeDesc) {
        this.typeDesc = typeDesc;
    }
    public BigDecimal getStandValue() {
        return standValue;
    }

    public void setStandValue(BigDecimal standValue) {
        this.standValue = standValue;
    }
    public BigDecimal getErrorValue() {
        return errorValue;
    }

    public void setErrorValue(BigDecimal errorValue) {
        this.errorValue = errorValue;
    }
    public String getCapsulation() {
        return capsulation;
    }

    public void setCapsulation(String capsulation) {
        this.capsulation = capsulation;
    }
    public BigDecimal getRatedOperaVol() {
        return ratedOperaVol;
    }

    public void setRatedOperaVol(BigDecimal ratedOperaVol) {
        this.ratedOperaVol = ratedOperaVol;
    }
    public BigDecimal getRatedOperaCur() {
        return ratedOperaCur;
    }

    public void setRatedOperaCur(BigDecimal ratedOperaCur) {
        this.ratedOperaCur = ratedOperaCur;
    }
    public BigDecimal getMaxOperaVol() {
        return maxOperaVol;
    }

    public void setMaxOperaVol(BigDecimal maxOperaVol) {
        this.maxOperaVol = maxOperaVol;
    }
    public BigDecimal getMaxOperaCur() {
        return maxOperaCur;
    }

    public void setMaxOperaCur(BigDecimal maxOperaCur) {
        this.maxOperaCur = maxOperaCur;
    }
    public BigDecimal getQualityFactor() {
        return qualityFactor;
    }

    public void setQualityFactor(BigDecimal qualityFactor) {
        this.qualityFactor = qualityFactor;
    }
    public BigDecimal getPowerFactor() {
        return powerFactor;
    }

    public void setPowerFactor(BigDecimal powerFactor) {
        this.powerFactor = powerFactor;
    }
    public BigDecimal getOpeImpedance() {
        return opeImpedance;
    }

    public void setOpeImpedance(BigDecimal opeImpedance) {
        this.opeImpedance = opeImpedance;
    }
    public Integer getQualityInStock() {
        return qualityInStock;
    }

    public void setQualityInStock(Integer qualityInStock) {
        this.qualityInStock = qualityInStock;
    }
    public String getCabinetNum() {
        return cabinetNum;
    }

    public void setCabinetNum(String cabinetNum) {
        this.cabinetNum = cabinetNum;
    }
    public String getBoxNum() {
        return boxNum;
    }

    public void setBoxNum(String boxNum) {
        this.boxNum = boxNum;
    }
    public String getPurChanel() {
        return purChanel;
    }

    public void setPurChanel(String purChanel) {
        this.purChanel = purChanel;
    }
    public String getPurName() {
        return purName;
    }

    public void setPurName(String purName) {
        this.purName = purName;
    }
    public String getPurTelphone() {
        return purTelphone;
    }

    public void setPurTelphone(String purTelphone) {
        this.purTelphone = purTelphone;
    }
    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }
    public String getPurDate() {
        return purDate;
    }

    public void setPurDate(String purDate) {
        this.purDate = purDate;
    }
    public String getSupplyName() {
        return supplyName;
    }

    public void setSupplyName(String supplyName) {
        this.supplyName = supplyName;
    }
    public String getSupplyTelphone() {
        return supplyTelphone;
    }

    public void setSupplyTelphone(String supplyTelphone) {
        this.supplyTelphone = supplyTelphone;
    }
    public String getSupplyAddress() {
        return supplyAddress;
    }

    public void setSupplyAddress(String supplyAddress) {
        this.supplyAddress = supplyAddress;
    }
    public String getRegDateTime() {
        return regDateTime;
    }

    public void setRegDateTime(String regDateTime) {
        this.regDateTime = regDateTime;
    }

    @Override
    protected Serializable pkVal() {
        return this.id;
    }

    @Override
    public String toString() {
        return "ComponentInfo{" +
        "id=" + id +
        ", compType=" + compType +
        ", purBatchNum=" + purBatchNum +
        ", typeDesc=" + typeDesc +
        ", standValue=" + standValue +
        ", errorValue=" + errorValue +
        ", capsulation=" + capsulation +
        ", ratedOperaVol=" + ratedOperaVol +
        ", ratedOperaCur=" + ratedOperaCur +
        ", maxOperaVol=" + maxOperaVol +
        ", maxOperaCur=" + maxOperaCur +
        ", qualityFactor=" + qualityFactor +
        ", powerFactor=" + powerFactor +
        ", opeImpedance=" + opeImpedance +
        ", qualityInStock=" + qualityInStock +
        ", cabinetNum=" + cabinetNum +
        ", boxNum=" + boxNum +
        ", purChanel=" + purChanel +
        ", purName=" + purName +
        ", purTelphone=" + purTelphone +
        ", unitPrice=" + unitPrice +
        ", purDate=" + purDate +
        ", supplyName=" + supplyName +
        ", supplyTelphone=" + supplyTelphone +
        ", supplyAddress=" + supplyAddress +
        ", regDateTime=" + regDateTime +
        "}";
    }
}
