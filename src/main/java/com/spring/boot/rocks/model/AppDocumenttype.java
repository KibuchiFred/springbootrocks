/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.spring.boot.rocks.model;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.ForeignKey;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;

@Entity
@Table(name = "app_documenttype", catalog = "springbootrocks", schema = "")
@NamedQueries({
    @NamedQuery(name = "AppDocumenttype.findAll", query = "SELECT a FROM AppDocumenttype a")
    , @NamedQuery(name = "AppDocumenttype.findById", query = "SELECT a FROM AppDocumenttype a WHERE a.id = :id")
    , @NamedQuery(name = "AppDocumenttype.findByDocumenttypename", query = "SELECT a FROM AppDocumenttype a WHERE a.documenttypename = :documenttypename")
    , @NamedQuery(name = "AppDocumenttype.findByDocumenttypeproperty1", query = "SELECT a FROM AppDocumenttype a WHERE a.documenttypeproperty1 = :documenttypeproperty1")
    , @NamedQuery(name = "AppDocumenttype.findByDocumenttypeproperty2", query = "SELECT a FROM AppDocumenttype a WHERE a.documenttypeproperty2 = :documenttypeproperty2")
    , @NamedQuery(name = "AppDocumenttype.findByDocumenttypeproperty3", query = "SELECT a FROM AppDocumenttype a WHERE a.documenttypeproperty3 = :documenttypeproperty3")
    , @NamedQuery(name = "AppDocumenttype.findByDocumenttypeproperty4", query = "SELECT a FROM AppDocumenttype a WHERE a.documenttypeproperty4 = :documenttypeproperty4")
    , @NamedQuery(name = "AppDocumenttype.findByDocumenttypeproperty5", query = "SELECT a FROM AppDocumenttype a WHERE a.documenttypeproperty5 = :documenttypeproperty5")})
public class AppDocumenttype implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "documenttypename")
    private String documenttypename;
    @Basic(optional = false)
    @Column(name = "documenttypeproperty1")
    private String documenttypeproperty1;
    @Basic(optional = false)
    @Column(name = "documenttypeproperty2")
    private String documenttypeproperty2;
    @Basic(optional = false)
    @Column(name = "documenttypeproperty3")
    private String documenttypeproperty3;
    @Basic(optional = false)
    @Column(name = "documenttypeproperty4")
    private String documenttypeproperty4;
    @Basic(optional = false)
    @Column(name = "documenttypeproperty5")
    private String documenttypeproperty5;
    //@JoinColumn(name = "casetypeid", referencedColumnName = "id")
    
    @ManyToOne(optional = false)
    @JoinColumn(name = "casetypeid", foreignKey = @ForeignKey(name = "FK_ADTCTID"))
    private AppCasetype appCasetype;

    public AppDocumenttype() {
    }

    public AppDocumenttype(Integer id) {
        this.id = id;
    }

    public AppDocumenttype(Integer id, String documenttypename, String documenttypeproperty1, String documenttypeproperty2, String documenttypeproperty3, String documenttypeproperty4, String documenttypeproperty5) {
        this.id = id;
        this.documenttypename = documenttypename;
        this.documenttypeproperty1 = documenttypeproperty1;
        this.documenttypeproperty2 = documenttypeproperty2;
        this.documenttypeproperty3 = documenttypeproperty3;
        this.documenttypeproperty4 = documenttypeproperty4;
        this.documenttypeproperty5 = documenttypeproperty5;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getDocumenttypename() {
        return documenttypename;
    }

    public void setDocumenttypename(String documenttypename) {
        this.documenttypename = documenttypename;
    }

    public String getDocumenttypeproperty1() {
        return documenttypeproperty1;
    }

    public void setDocumenttypeproperty1(String documenttypeproperty1) {
        this.documenttypeproperty1 = documenttypeproperty1;
    }

    public String getDocumenttypeproperty2() {
        return documenttypeproperty2;
    }

    public void setDocumenttypeproperty2(String documenttypeproperty2) {
        this.documenttypeproperty2 = documenttypeproperty2;
    }

    public String getDocumenttypeproperty3() {
        return documenttypeproperty3;
    }

    public void setDocumenttypeproperty3(String documenttypeproperty3) {
        this.documenttypeproperty3 = documenttypeproperty3;
    }

    public String getDocumenttypeproperty4() {
        return documenttypeproperty4;
    }

    public void setDocumenttypeproperty4(String documenttypeproperty4) {
        this.documenttypeproperty4 = documenttypeproperty4;
    }

    public String getDocumenttypeproperty5() {
        return documenttypeproperty5;
    }

    public void setDocumenttypeproperty5(String documenttypeproperty5) {
        this.documenttypeproperty5 = documenttypeproperty5;
    }

    public AppCasetype getAppCasetype() {
        return appCasetype;
    }

    public void setAppCasetype(AppCasetype appCasetype) {
        this.appCasetype = appCasetype;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof AppDocumenttype)) {
            return false;
        }
        AppDocumenttype other = (AppDocumenttype) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "javaapplication1.AppDocumenttype[ id=" + id + " ]";
    }
    
}
