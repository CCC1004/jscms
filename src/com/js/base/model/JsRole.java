package com.js.base.model;

import java.util.Date;
import qlight.frames.base.annotation.Column;
import qlight.frames.base.model.BaseModel;

public class JsRole extends BaseModel {
    private String guid;

    private String rolename;

    private String status;

    private Date ts;

    private String nt;

    private String sort;

    @Column(name="GUID")
    public String getGuid() {
        return guid;
    }

    public void setGuid(String guid) {
        this.guid = guid;
    }

    @Column(name="ROLENAME")
    public String getRolename() {
        return rolename;
    }

    public void setRolename(String rolename) {
        this.rolename = rolename;
    }

    @Column(name="STATUS")
    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Column(name="TS")
    public Date getTs() {
        return ts;
    }

    public void setTs(Date ts) {
        this.ts = ts;
    }

    @Column(name="NT")
    public String getNt() {
        return nt;
    }

    public void setNt(String nt) {
        this.nt = nt;
    }

    @Column(name="SORT")
    public String getSort() {
        return sort;
    }

    public void setSort(String sort) {
        this.sort = sort;
    }
}