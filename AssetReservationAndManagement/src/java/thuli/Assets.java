/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package thuli;

import java.io.Serializable;
import java.util.Collection;
import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Thulisile
 */
@Entity
@Table(name = "assets")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Assets.findAll", query = "SELECT a FROM Assets a"),
    @NamedQuery(name = "Assets.findByAssetID", query = "SELECT a FROM Assets a WHERE a.assetID = :assetID"),
    @NamedQuery(name = "Assets.findByAssetType", query = "SELECT a FROM Assets a WHERE a.assetType = :assetType"),
    @NamedQuery(name = "Assets.findByAvailabitliy", query = "SELECT a FROM Assets a WHERE a.availabitliy = :availabitliy"),
    @NamedQuery(name = "Assets.findByLocation", query = "SELECT a FROM Assets a WHERE a.location = :location")})
public class Assets implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "AssetID")
    private Integer assetID;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "AssetType")
    private String assetType;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "Availabitliy")
    private String availabitliy;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "Location")
    private String location;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "assetID")
    private Collection<Assetregister> assetregisterCollection;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "assetID")
    private Collection<Reservation> reservationCollection;

    public Assets() {
    }

    public Assets(Integer assetID) {
        this.assetID = assetID;
    }

    public Assets(Integer assetID, String assetType, String availabitliy, String location) {
        this.assetID = assetID;
        this.assetType = assetType;
        this.availabitliy = availabitliy;
        this.location = location;
    }

    public Integer getAssetID() {
        return assetID;
    }

    public void setAssetID(Integer assetID) {
        this.assetID = assetID;
    }

    public String getAssetType() {
        return assetType;
    }

    public void setAssetType(String assetType) {
        this.assetType = assetType;
    }

    public String getAvailabitliy() {
        return availabitliy;
    }

    public void setAvailabitliy(String availabitliy) {
        this.availabitliy = availabitliy;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    @XmlTransient
    public Collection<Assetregister> getAssetregisterCollection() {
        return assetregisterCollection;
    }

    public void setAssetregisterCollection(Collection<Assetregister> assetregisterCollection) {
        this.assetregisterCollection = assetregisterCollection;
    }

    @XmlTransient
    public Collection<Reservation> getReservationCollection() {
        return reservationCollection;
    }

    public void setReservationCollection(Collection<Reservation> reservationCollection) {
        this.reservationCollection = reservationCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (assetID != null ? assetID.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Assets)) {
            return false;
        }
        Assets other = (Assets) object;
        if ((this.assetID == null && other.assetID != null) || (this.assetID != null && !this.assetID.equals(other.assetID))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "thuli.Assets[ assetID=" + assetID + " ]";
    }
    
}
