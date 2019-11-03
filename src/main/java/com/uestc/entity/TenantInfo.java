package com.uestc.entity;

import com.baomidou.mybatisplus.activerecord.Model;
import com.baomidou.mybatisplus.annotations.TableId;
import com.baomidou.mybatisplus.annotations.TableName;
import com.baomidou.mybatisplus.enums.IdType;

import java.io.Serializable;

/**
 * <p>
 * 租户信息表
 * </p>
 *
 * @author Zhang Lianzhong
 * @since 2019-10-07
 */
@TableName("tenant_info")
public class TenantInfo extends Model<TenantInfo> {

    private static final long serialVersionUID = 1L;

    /**
     * 租户Id
     */
    @TableId(type= IdType.UUID)
    private String tenantId;

    /**
     * 租户姓名
     */
    private String tenantName;

    /**
     * 房间编号
     */
    private String roomName;

    /**
     * 入住时间
     */
    private String tenantDate;

    /**
     * 租房合同期限 (月)
     */
    private Integer contractDuration;

    /**
     * 身份证号
     */
    private String identityCardNum;

    /**
     * 手机号码
     */
    private String telephone;

    /**
     * 年龄
     */
    private Integer age;

    /**
     * 性别 M 男，F 女
     */
    private String sex;



    /**
     * 租住状态, 1 - 已入住 , 2 - 已退租
     */
    private Integer tenantState;

    /**
     * 备注信息
     */
    private String note;

    public String getTenantId() {
        return tenantId;
    }

    public void setTenantId(String tenantId) {
        this.tenantId = tenantId;
    }
    public String getTenantName() {
        return tenantName;
    }

    public void setTenantName(String tenantName) {
        this.tenantName = tenantName;
    }
    public String getRoomName() {
        return roomName;
    }

    public void setRoomName(String roomName) {
        this.roomName = roomName;
    }
    public String getTenantDate() {
        return tenantDate;
    }

    public void setTenantDate(String tenantDate) {
        this.tenantDate = tenantDate;
    }
    public Integer getContractDuration() {
        return contractDuration;
    }

    public void setContractDuration(Integer contractDuration) {
        this.contractDuration = contractDuration;
    }
    public String getIdentityCardNum() {
        return identityCardNum;
    }

    public void setIdentityCardNum(String identityCardNum) {
        this.identityCardNum = identityCardNum;
    }
    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }
    public Integer getAge() {
        return age;
    }

    public void setAge(Integer age) {
        this.age = age;
    }
    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getNote() {
        return note;
    }

    public Integer getTenantState() {
        return tenantState;
    }

    public void setTenantState(Integer tenantState) {
        this.tenantState = tenantState;
    }

    public void setNote(String note) {
        this.note = note;
    }

    @Override
    protected Serializable pkVal() {
        return this.tenantId;
    }

    @Override
    public String toString() {
        return "TenantInfo{" +
        "tenantId=" + tenantId +
        ", tenantName=" + tenantName +
        ", roomName=" + roomName +
        ", tenantDate=" + tenantDate +
        ", contractDuration=" + contractDuration +
        ", identityCardNum=" + identityCardNum +
        ", telephone=" + telephone +
        ", age=" + age +
        ", sex=" + sex +
        ", tenantState=" + tenantState +
        ", note=" + note +
        "}";
    }
}
