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
import javax.validation.constraints.Size;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Thulisile
 */
@Entity
@Table(name = "reservation")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Reservation.findAll", query = "SELECT r FROM Reservation r"),
    @NamedQuery(name = "Reservation.findByResNo", query = "SELECT r FROM Reservation r WHERE r.resNo = :resNo"),
    @NamedQuery(name = "Reservation.findByCheckIn", query = "SELECT r FROM Reservation r WHERE r.checkIn = :checkIn"),
    @NamedQuery(name = "Reservation.findByCheckOut", query = "SELECT r FROM Reservation r WHERE r.checkOut = :checkOut"),
    @NamedQuery(name = "Reservation.findByIsCancelled", query = "SELECT r FROM Reservation r WHERE r.isCancelled = :isCancelled")})
public class Reservation implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "ResNo")
    private Integer resNo;
    @Basic(optional = false)
    @NotNull
    @Column(name = "CheckIn")
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkIn;
    @Column(name = "CheckOut")
    @Temporal(TemporalType.TIMESTAMP)
    private Date checkOut;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 3)
    @Column(name = "IsCancelled")
    private String isCancelled;
    @JoinColumn(name = "AssetID", referencedColumnName = "AssetID")
    @ManyToOne(optional = false)
    private Assets assetID;
    @JoinColumn(name = "EmployeeNumber", referencedColumnName = "EmployeeNumber")
    @ManyToOne(optional = false)
    private Employee employeeNumber;

    public Reservation() {
    }

    public Reservation(Integer resNo) {
        this.resNo = resNo;
    }

    public Reservation(Integer resNo, Date checkIn, String isCancelled) {
        this.resNo = resNo;
        this.checkIn = checkIn;
        this.isCancelled = isCancelled;
    }

    public Integer getResNo() {
        return resNo;
    }

    public void setResNo(Integer resNo) {
        this.resNo = resNo;
    }

    public Date getCheckIn() {
        return checkIn;
    }

    public void setCheckIn(Date checkIn) {
        this.checkIn = checkIn;
    }

    public Date getCheckOut() {
        return checkOut;
    }

    public void setCheckOut(Date checkOut) {
        this.checkOut = checkOut;
    }

    public String getIsCancelled() {
        return isCancelled;
    }

    public void setIsCancelled(String isCancelled) {
        this.isCancelled = isCancelled;
    }

    public Assets getAssetID() {
        return assetID;
    }

    public void setAssetID(Assets assetID) {
        this.assetID = assetID;
    }

    public Employee getEmployeeNumber() {
        return employeeNumber;
    }

    public void setEmployeeNumber(Employee employeeNumber) {
        this.employeeNumber = employeeNumber;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (resNo != null ? resNo.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Reservation)) {
            return false;
        }
        Reservation other = (Reservation) object;
        if ((this.resNo == null && other.resNo != null) || (this.resNo != null && !this.resNo.equals(other.resNo))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "thuli.Reservation[ resNo=" + resNo + " ]";
    }
    
}
