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
@Table(name = "app_casestep", catalog = "springbootrocks", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AppCasestep.findAll", query = "SELECT a FROM AppCasestep a")
    , @NamedQuery(name = "AppCasestep.findById", query = "SELECT a FROM AppCasestep a WHERE a.id = :id")
    , @NamedQuery(name = "AppCasestep.findByCasestepname", query = "SELECT a FROM AppCasestep a WHERE a.casestepname = :casestepname")})
public class AppCasestep implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "casestepname")
    private String casestepname;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "appCasestep")
    private Collection<AppWorkqueue> appWorkqueueCollection;
    
//    @JoinColumn(name = "casetypeid", referencedColumnName = "id")
    @JoinColumn(name = "casetypeid", foreignKey = @ForeignKey(name = "FK_ACSCTID"))
    @ManyToOne(optional = false)
    private AppCasetype appCasetype;
    
    @JoinColumn(name = "roleid", referencedColumnName = "id")
    @ManyToOne(optional = false)
    private AppRole appRole;

    public AppCasestep() {
    }

    public AppCasestep(Integer id) {
        this.id = id;
    }

    public AppCasestep(Integer id, String casestepname) {
        this.id = id;
        this.casestepname = casestepname;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCasestepname() {
        return casestepname;
    }

    public void setCasestepname(String casestepname) {
        this.casestepname = casestepname;
    }

    @XmlTransient
    public Collection<AppWorkqueue> getAppWorkqueueCollection() {
        return appWorkqueueCollection;
    }

    public void setAppWorkqueueCollection(Collection<AppWorkqueue> appWorkqueueCollection) {
        this.appWorkqueueCollection = appWorkqueueCollection;
    }

    public AppCasetype getAppCasetype() {
        return appCasetype;
    }

    public void setAppCasetype(AppCasetype appCasetype) {
        this.appCasetype = appCasetype;
    }

    public AppRole getAppRole() {
        return appRole;
    }

    public void setAppRole(AppRole appRole) {
        this.appRole = appRole;
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
        if (!(object instanceof AppCasestep)) {
            return false;
        }
        AppCasestep other = (AppCasestep) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.spring.boot.rocks.model.AppCasestep[ id=" + id + " ]";
    }
    
}
