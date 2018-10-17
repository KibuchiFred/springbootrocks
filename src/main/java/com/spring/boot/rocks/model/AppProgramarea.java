package com.spring.boot.rocks.model;

import java.io.Serializable;
import java.util.Collection;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.ForeignKey;

@Entity
@Table(name = "app_programarea", catalog = "springbootrocks", schema = "")
@NamedQueries({
    @NamedQuery(name = "AppProgramarea.findAll", query = "SELECT a FROM AppProgramarea a")
    , @NamedQuery(name = "AppProgramarea.findById", query = "SELECT a FROM AppProgramarea a WHERE a.id = :id")
    , @NamedQuery(name = "AppProgramarea.findByProgramareaname", query = "SELECT a FROM AppProgramarea a WHERE a.programareaname = :programareaname")
    , @NamedQuery(name = "AppProgramarea.findByProgramarealocation", query = "SELECT a FROM AppProgramarea a WHERE a.programarealocation = :programarealocation")
    , @NamedQuery(name = "AppProgramarea.findByProgramareaaddress", query = "SELECT a FROM AppProgramarea a WHERE a.programareaaddress = :programareaaddress")
    , @NamedQuery(name = "AppProgramarea.findByProgramareaheadname", query = "SELECT a FROM AppProgramarea a WHERE a.programareaheadname = :programareaheadname")
    , @NamedQuery(name = "AppProgramarea.findByProgramareaheademail", query = "SELECT a FROM AppProgramarea a WHERE a.programareaheademail = :programareaheademail")})

public class AppProgramarea implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Long id;
	@Basic(optional = false)
	@Column(name = "programareaname")
	private String programareaname;
	@Basic(optional = false)
	@Column(name = "programarealocation")
	private String programarealocation;
	@Basic(optional = false)
	@Column(name = "programareaaddress")
	private String programareaaddress;
	@Basic(optional = false)
	@Column(name = "programareaheadname")
	private String programareaheadname;
	@Basic(optional = false)
	@Column(name = "programareaheademail")
	private String programareaheademail;

	// @JoinColumn(name = "programareaagencyid", referencedColumnName = "id")

	@ManyToOne(optional = false)
	@JoinColumn(name = "programareaagencyid", foreignKey = @ForeignKey(name = "FK_APAAGENCYID"))
	private AppAgency appAgency;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "appProgramarea")
    private Collection<AppCasetype> appCasetypeCollection;
	
	public AppProgramarea() {
	}

	public AppProgramarea(Long id) {
		this.id = id;
	}

	public AppProgramarea(Long id, String programareaname, String programarealocation, String programareaaddress,
			String programareaheadname, String programareaheademail) {
		this.id = id;
		this.programareaname = programareaname;
		this.programarealocation = programarealocation;
		this.programareaaddress = programareaaddress;
		this.programareaheadname = programareaheadname;
		this.programareaheademail = programareaheademail;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getProgramareaname() {
		return programareaname;
	}

	public void setProgramareaname(String programareaname) {
		this.programareaname = programareaname;
	}

	public String getProgramarealocation() {
		return programarealocation;
	}

	public void setProgramarealocation(String programarealocation) {
		this.programarealocation = programarealocation;
	}

	public String getProgramareaaddress() {
		return programareaaddress;
	}

	public void setProgramareaaddress(String programareaaddress) {
		this.programareaaddress = programareaaddress;
	}

	public String getProgramareaheadname() {
		return programareaheadname;
	}

	public void setProgramareaheadname(String programareaheadname) {
		this.programareaheadname = programareaheadname;
	}

	public String getProgramareaheademail() {
		return programareaheademail;
	}

	public void setProgramareaheademail(String programareaheademail) {
		this.programareaheademail = programareaheademail;
	}

	public AppAgency getAppAgency() {
		return appAgency;
	}

	public void setAppAgency(AppAgency appAgency) {
		this.appAgency = appAgency;
	}
	
	public Collection<AppCasetype> getAppCasetypeCollection() {
		return appCasetypeCollection;
	}

	public void setAppCasetypeCollection(Collection<AppCasetype> appCasetypeCollection) {
		this.appCasetypeCollection = appCasetypeCollection;
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
		if (!(object instanceof AppProgramarea)) {
			return false;
		}
		AppProgramarea other = (AppProgramarea) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "com.spring.boot.rocks.model.AppProgramarea[ id=" + id + " ]";
	}

}
