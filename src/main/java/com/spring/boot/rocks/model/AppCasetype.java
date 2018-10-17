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
@Table(name = "app_casetype", catalog = "springbootrocks", schema = "")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "AppCasetype.findAll", query = "SELECT a FROM AppCasetype a")
    , @NamedQuery(name = "AppCasetype.findById", query = "SELECT a FROM AppCasetype a WHERE a.id = :id")
    , @NamedQuery(name = "AppCasetype.findByCasetypename", query = "SELECT a FROM AppCasetype a WHERE a.casetypename = :casetypename")})
public class AppCasetype implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "casetypename")
    private String casetypename;
    
    //@JoinColumn(name = "programareaid", referencedColumnName = "id")
    
    @ManyToOne(optional = false)
    @JoinColumn(name = "programareaid", foreignKey = @ForeignKey(name = "FK_ACTPAREAID"))
    private AppProgramarea appProgramarea;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "appCasetype")
    private Collection<AppCaseproperty> appCasepropertyCollection;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "appCasetype")
    private Collection<AppDocumenttype> appDocumenttypeCollection;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "appCasetype")
    private Collection<AppWorkqueue> appWorkqueueCollection;
    
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "appCasetype")
    private Collection<AppCasestep> appCasestepCollection;

    public AppCasetype() {
    }

    public AppCasetype(Integer id) {
        this.id = id;
    }

    public AppCasetype(Integer id, String casetypename) {
        this.id = id;
        this.casetypename = casetypename;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getCasetypename() {
        return casetypename;
    }

    public void setCasetypename(String casetypename) {
        this.casetypename = casetypename;
    }

    public AppProgramarea getAppProgramarea() {
        return appProgramarea;
    }

    public void setAppProgramarea(AppProgramarea appProgramarea) {
        this.appProgramarea = appProgramarea;
    }

    @XmlTransient
    public Collection<AppCaseproperty> getAppCasepropertyCollection() {
        return appCasepropertyCollection;
    }

    public void setAppCasepropertyCollection(Collection<AppCaseproperty> appCasepropertyCollection) {
        this.appCasepropertyCollection = appCasepropertyCollection;
    }

    @XmlTransient
    public Collection<AppDocumenttype> getAppDocumenttypeCollection() {
        return appDocumenttypeCollection;
    }

    public void setAppDocumenttypeCollection(Collection<AppDocumenttype> appDocumenttypeCollection) {
        this.appDocumenttypeCollection = appDocumenttypeCollection;
    }

    @XmlTransient
    public Collection<AppWorkqueue> getAppWorkqueueCollection() {
        return appWorkqueueCollection;
    }

    public void setAppWorkqueueCollection(Collection<AppWorkqueue> appWorkqueueCollection) {
        this.appWorkqueueCollection = appWorkqueueCollection;
    }

    @XmlTransient
    public Collection<AppCasestep> getAppCasestepCollection() {
        return appCasestepCollection;
    }

    public void setAppCasestepCollection(Collection<AppCasestep> appCasestepCollection) {
        this.appCasestepCollection = appCasestepCollection;
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
        if (!(object instanceof AppCasetype)) {
            return false;
        }
        AppCasetype other = (AppCasetype) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.spring.boot.rocks.model.AppCasetype[ id=" + id + " ]";
    }
    
}