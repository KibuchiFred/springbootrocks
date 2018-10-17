package com.spring.boot.rocks.model;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
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
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;


@Entity
@Table(name = "app_caseproperty", catalog = "springbootrocks", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AppCaseproperty.findAll", query = "SELECT a FROM AppCaseproperty a")
    , @NamedQuery(name = "AppCaseproperty.findById", query = "SELECT a FROM AppCaseproperty a WHERE a.id = :id")
    , @NamedQuery(name = "AppCaseproperty.findByCaseproperty1", query = "SELECT a FROM AppCaseproperty a WHERE a.caseproperty1 = :caseproperty1")
    , @NamedQuery(name = "AppCaseproperty.findByCaseproperty2", query = "SELECT a FROM AppCaseproperty a WHERE a.caseproperty2 = :caseproperty2")
    , @NamedQuery(name = "AppCaseproperty.findByCaseproperty3", query = "SELECT a FROM AppCaseproperty a WHERE a.caseproperty3 = :caseproperty3")
    , @NamedQuery(name = "AppCaseproperty.findByCaseproperty4", query = "SELECT a FROM AppCaseproperty a WHERE a.caseproperty4 = :caseproperty4")
    , @NamedQuery(name = "AppCaseproperty.findByCaseproperty5", query = "SELECT a FROM AppCaseproperty a WHERE a.caseproperty5 = :caseproperty5")})
public class AppCaseproperty implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "caseproperty1")
    private String caseproperty1;
    @Basic(optional = false)
    @Column(name = "caseproperty2")
    private String caseproperty2;
    @Basic(optional = false)
    @Column(name = "caseproperty3")
    private String caseproperty3;
    @Basic(optional = false)
    @Column(name = "caseproperty4")
    private String caseproperty4;
    @Basic(optional = false)
    @Column(name = "caseproperty5")
    private String caseproperty5;
    
    //@JoinColumn(name = "casetypeid", referencedColumnName = "id")
    @JoinColumn(name = "casetypeid", foreignKey = @ForeignKey(name = "FK_ACPCTID"))
    @ManyToOne(optional = false)
    private AppCasetype appCasetype;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "appCaseproperty")
    private Collection<AppWorkqueue> appWorkqueueCollection;

    public AppCaseproperty() {
    }

    public AppCaseproperty(Integer id) {
        this.id = id;
    }

    public AppCaseproperty(Integer id, String caseproperty1, String caseproperty2, String caseproperty3, String caseproperty4, String caseproperty5) {
        this.id = id;
        this.caseproperty1 = caseproperty1;
        this.caseproperty2 = caseproperty2;
        this.caseproperty3 = caseproperty3;
        this.caseproperty4 = caseproperty4;
        this.caseproperty5 = caseproperty5;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCaseproperty1() {
        return caseproperty1;
    }

    public void setCaseproperty1(String caseproperty1) {
        this.caseproperty1 = caseproperty1;
    }

    public String getCaseproperty2() {
        return caseproperty2;
    }

    public void setCaseproperty2(String caseproperty2) {
        this.caseproperty2 = caseproperty2;
    }

    public String getCaseproperty3() {
        return caseproperty3;
    }

    public void setCaseproperty3(String caseproperty3) {
        this.caseproperty3 = caseproperty3;
    }

    public String getCaseproperty4() {
        return caseproperty4;
    }

    public void setCaseproperty4(String caseproperty4) {
        this.caseproperty4 = caseproperty4;
    }

    public String getCaseproperty5() {
        return caseproperty5;
    }

    public void setCaseproperty5(String caseproperty5) {
        this.caseproperty5 = caseproperty5;
    }

    public AppCasetype getAppCasetype() {
        return appCasetype;
    }

    public void setAppCasetype(AppCasetype appCasetype) {
        this.appCasetype = appCasetype;
    }

    @XmlTransient
    public Collection<AppWorkqueue> getAppWorkqueueCollection() {
        return appWorkqueueCollection;
    }

    public void setAppWorkqueueCollection(Collection<AppWorkqueue> appWorkqueueCollection) {
        this.appWorkqueueCollection = appWorkqueueCollection;
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
        if (!(object instanceof AppCaseproperty)) {
            return false;
        }
        AppCaseproperty other = (AppCaseproperty) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.spring.boot.rocks.model.AppCaseproperty[ id=" + id + " ]";
    }
    
}
