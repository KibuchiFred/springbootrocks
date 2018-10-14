/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
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
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "app_agency", catalog = "springbootrocks", schema = "")
@NamedQueries({ @NamedQuery(name = "AppAgency.findAll", query = "SELECT a FROM AppAgency a") })
public class AppAgency implements Serializable {

	private static final long serialVersionUID = 1L;
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Basic(optional = false)
	@Column(name = "id")
	private Integer id;
	@Basic(optional = false)
	@Column(name = "agencyname")
	private String agencyname;
	@Basic(optional = false)
	@Column(name = "agencylocation")
	private String agencylocation;
	@Basic(optional = false)
	@Column(name = "agencyaddress")
	private String agencyaddress;
	@Basic(optional = false)
	@Column(name = "agencyheadname")
	private String agencyheadname;
	@Basic(optional = false)
	@Column(name = "agencyheademail")
	private String agencyheademail;

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "appAgency")
	private Collection<AppProgramarea> appProgramareaCollection;

	public AppAgency() {
	}

	public AppAgency(Integer id) {
		this.id = id;
	}

	public AppAgency(Integer id, String agencyname, String agencylocation, String agencyaddress, String agencyheadname,
			String agencyheademail) {
		this.id = id;
		this.agencyname = agencyname;
		this.agencylocation = agencylocation;
		this.agencyaddress = agencyaddress;
		this.agencyheadname = agencyheadname;
		this.agencyheademail = agencyheademail;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getAgencyname() {
		return agencyname;
	}

	public void setAgencyname(String agencyname) {
		this.agencyname = agencyname;
	}

	public String getAgencylocation() {
		return agencylocation;
	}

	public void setAgencylocation(String agencylocation) {
		this.agencylocation = agencylocation;
	}

	public String getAgencyaddress() {
		return agencyaddress;
	}

	public void setAgencyaddress(String agencyaddress) {
		this.agencyaddress = agencyaddress;
	}

	public String getAgencyheadname() {
		return agencyheadname;
	}

	public void setAgencyheadname(String agencyheadname) {
		this.agencyheadname = agencyheadname;
	}

	public String getAgencyheademail() {
		return agencyheademail;
	}

	public void setAgencyheademail(String agencyheademail) {
		this.agencyheademail = agencyheademail;
	}

	public Collection<AppProgramarea> getAppProgramareaCollection() {
		return appProgramareaCollection;
	}

	public void setAppProgramareaCollection(Collection<AppProgramarea> appProgramareaCollection) {
		this.appProgramareaCollection = appProgramareaCollection;
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
		if (!(object instanceof AppAgency)) {
			return false;
		}
		AppAgency other = (AppAgency) object;
		if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
			return false;
		}
		return true;
	}

	@Override
	public String toString() {
		return "javaapplication1.AppAgency[ id=" + id + " ]";
	}

}
