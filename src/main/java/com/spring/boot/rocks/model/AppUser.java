package com.spring.boot.rocks.model;

import javax.persistence.*;

import java.io.Serializable;
import java.util.List;
import java.util.Set;

@Entity
@Table(name = "app_user")
public class AppUser implements Serializable{
	 private static final long serialVersionUID = 1L;
    private Long id;
    private String username;
    private String password;
    private String passwordConfirm;
 	private String useremail;
    private String userfirstname;
    private String userlastname;
    private String useraddress;
    
    private List<AppRole> roles;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }
    

	public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }
    
    
   
    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(name = "app_user_role", 
    joinColumns = @JoinColumn(name = "userid"), 
    inverseJoinColumns = @JoinColumn(name = "roleid"))
   
    
    public List<AppRole> getRoles() {
        return roles;
    }

    public void setRoles(List<AppRole> roles) {
        this.roles = roles;
    }
    
    
    public String getUseremail() {
 		return useremail;
 	}

 	public void setUseremail(String useremail) {
 		this.useremail = useremail;
 	}

 	public String getUserfirstname() {
 		return userfirstname;
 	}

 	public void setUserfirstname(String userfirstname) {
 		this.userfirstname = userfirstname;
 	}

 	public String getUserlastname() {
 		return userlastname;
 	}

 	public void setUserlastname(String userlastname) {
 		this.userlastname = userlastname;
 	}

 	public String getUseraddress() {
 		return useraddress;
 	}

 	public void setUseraddress(String useraddress) {
 		this.useraddress = useraddress;
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
        if (!(object instanceof AppUser)) {
            return false;
        }
        AppUser other = (AppUser) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.spring.boot.rocks.model.AppUser[ id=" + id + " ]";
    }
    
    
}
