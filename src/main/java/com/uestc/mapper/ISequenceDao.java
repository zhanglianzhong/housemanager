package com.uestc.mapper;


import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

/**
 * sequence dao
 */

@Repository
public interface ISequenceDao {

    @Select("SELECT nextval('component_serial_number') seq ")
    public int getComponentSeqNum();


    @Select("SELECT nextval('chip_serial_number) seq")
    public int getChipSeqNum();


    @Select("SELECT nextval('outstock_serial_num') seq")
    public int getOutStockSeqNum();
}
