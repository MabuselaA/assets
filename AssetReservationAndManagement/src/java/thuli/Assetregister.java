/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package thuli;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.validation.constraints.NotNull;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Thulisile
 */
@Entity
@Table(name = "assetregister")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Assetregister.findAll", query = "SELECT a FROM Assetregister a"),
    @NamedQuery(name = "Assetregister.findBySerialNumber", query = "SELECT a FROM Assetregister a WHERE a.serialNumber = :serialNumber"),
    @NamedQuery(name = "Assetregister.findByDateAcquired", query = "SELECT a FROM Assetregister a WHERE a.dateAcquired = :dateAcquired"),
    @NamedQuery(name = "Assetregister.findByDateRegistered", query = "SELECT a FROM Assetregister a WHERE a.dateRegistered = :dateRegistered"),
    @NamedQuery(name = "Assetregister.findByMarketValue", query = "SELECT a FROM Assetregister a WHERE a.marketValue = :marketValue")})
public class Assetregister implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "SerialNumber")
    private Integer serialNumber;
    @Column(name = "DateAcquired")
    @Temporal(TemporalType.DATE)
    private Date dateAcquired;
    @Column(name = "DateRegistered")
    @Temporal(TemporalType.DATE)
    private Date dateRegistered;
    @Column(name = "MarketValue")
    private Long marketValue;
    @JoinColumn(name = "AssetID", referencedColumnName = "AssetID")
    @ManyToOne(optional = false)
    private Assets assetID;

    public Assetregister() {
    }

    public Assetregister(Integer serialNumber) {
        this.serialNumber = serialNumber;
    }

    public Integer getSerialNumber() {
        return serialNumber;
    }

    public void setSerialNumber(Integer serialNumber) {
        this.serialNumber = serialNumber;
    }

    public Date getDateAcquired() {
        return dateAcquired;
    }

    public void setDateAcquired(Date dateAcquired) {
        this.dateAcquired = dateAcquired;
    }

    public Date getDateRegistered() {
        return dateRegistered;
    }

    public void setDateRegistered(Date dateRegistered) {
        this.dateRegistered = dateRegistered;
    }

    public Long getMarketValue() {
        return marketValue;
    }

    public void setMarketValue(Long marketValue) {
        this.marketValue = marketValue;
    }

    public Assets getAssetID() {
        return assetID;
    }

    public void setAssetID(Assets assetID) {
        this.assetID = assetID;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (serialNumber != null ? serialNumber.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Assetregister)) {
            return false;
        }
        Assetregister other = (Assetregister) object;
        if ((this.serialNumber == null && other.serialNumber != null) || (this.serialNumber != null && !this.serialNumber.equals(other.serialNumber))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "thuli.Assetregister[ serialNumber=" + serialNumber + " ]";
    }
    
}
