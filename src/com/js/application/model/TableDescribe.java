package com.js.application.model;

import qlight.frames.base.annotation.Column;
import qlight.frames.base.model.BaseModel;

/**
 * 表描述信息
 * @author superC
 */
public class TableDescribe extends BaseModel {
    private String guid;

    private String tableIdent;//表标识符

    private String tableName;//表名

    private Integer indexnum;//序号

    private String fieldname;//字段名

    private String fieldident;//字段标识

    private String charlength;//类型及长度

    private String isnull;//可否为空

    private String unit;//计量单位

    private String pk;//主键

    private Integer refnum;//索引号

    @Column(name="guid")
    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    @Column(name="table_name")
    public String getTableName() {
        return tableName;
    }

    public void setTableName(String tableName) {
        this.tableName = tableName;
    }

    @Column(name="table_ident")
    public String getTableIdent() {
        return tableIdent;
    }

    public void setTableIdent(String tableIdent) {
        this.tableIdent = tableIdent;
    }

    @Column(name="indexNum")
    public Integer getIndexnum() {
        return indexnum;
    }

    public void setIndexnum(Integer indexnum) {
        this.indexnum = indexnum;
    }

    @Column(name="fieldName")
    public String getFieldname() {
        return fieldname;
    }

    public void setFieldname(String fieldname) {
        this.fieldname = fieldname;
    }

    @Column(name="fieldIdent")
    public String getFieldident() {
        return fieldident;
    }

    public void setFieldident(String fieldident) {
        this.fieldident = fieldident;
    }

    @Column(name="charLength")
    public String getCharlength() {
        return charlength;
    }

    public void setCharlength(String charlength) {
        this.charlength = charlength;
    }

    @Column(name="isNull")
    public String getIsnull() {
        return isnull;
    }

    public void setIsnull(String isnull) {
        this.isnull = isnull;
    }

    @Column(name="unit")
    public String getUnit() {
        return unit;
    }

    public void setUnit(String unit) {
        this.unit = unit;
    }

    @Column(name="pk")
    public String getPk() {
        return pk;
    }

    public void setPk(String pk) {
        this.pk = pk;
    }

    @Column(name="refNum")
    public Integer getRefnum() {
        return refnum;
    }

    public void setRefnum(Integer refnum) {
        this.refnum = refnum;
    }
}