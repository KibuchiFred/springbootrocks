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
import javax.xml.bind.annotation.XmlRootElement;

@Entity
@Table(name = "app_workqueue", catalog = "springbootrocks", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AppWorkqueue.findAll", query = "SELECT a FROM AppWorkqueue a")
    , @NamedQuery(name = "AppWorkqueue.findById", query = "SELECT a FROM AppWorkqueue a WHERE a.id = :id")})
public class AppWorkqueue implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    
//    @JoinColumn(name = "casepropertyid", referencedColumnName = "id")
    @JoinColumn(name = "casepropertyid", foreignKey = @ForeignKey(name = "FK_AWQCPID"))
    @ManyToOne(optional = false)
    private AppCaseproperty appCaseproperty;
    
//    @JoinColumn(name = "casestepid", referencedColumnName = "id")
    @JoinColumn(name = "casestepid", foreignKey = @ForeignKey(name = "FK_AWQCSID"))
    @ManyToOne(optional = false)
    private AppCasestep appCasestep;
    
//    @JoinColumn(name = "casetypeid", referencedColumnName = "id")
    @JoinColumn(name = "casetypeid", foreignKey = @ForeignKey(name = "FK_AWQCTID"))
    @ManyToOne(optional = false)
    private AppCasetype appCasetype;

    public AppWorkqueue() {
    }

    public AppWorkqueue(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public AppCaseproperty getAppCaseproperty() {
        return appCaseproperty;
    }

    public void setAppCaseproperty(AppCaseproperty appCaseproperty) {
        this.appCaseproperty = appCaseproperty;
    }

    public AppCasestep getAppCasestep() {
        return appCasestep;
    }

    public void setAppCasestep(AppCasestep appCasestep) {
        this.appCasestep = appCasestep;
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
        if (!(object instanceof AppWorkqueue)) {
            return false;
        }
        AppWorkqueue other = (AppWorkqueue) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.spring.boot.rocks.model.AppWorkqueue[ id=" + id + " ]";
    }
    
}
