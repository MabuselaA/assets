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
import javax.persistence.Lob;
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
@Table(name = "employee")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Employee.findAll", query = "SELECT e FROM Employee e"),
    @NamedQuery(name = "Employee.findByEmployeeNumber", query = "SELECT e FROM Employee e WHERE e.employeeNumber = :employeeNumber"),
    @NamedQuery(name = "Employee.findByEmployeeName", query = "SELECT e FROM Employee e WHERE e.employeeName = :employeeName"),
    @NamedQuery(name = "Employee.findByEmployeeSurname", query = "SELECT e FROM Employee e WHERE e.employeeSurname = :employeeSurname"),
    @NamedQuery(name = "Employee.findByIdentityNumber", query = "SELECT e FROM Employee e WHERE e.identityNumber = :identityNumber"),
    @NamedQuery(name = "Employee.findByGender", query = "SELECT e FROM Employee e WHERE e.gender = :gender"),
    @NamedQuery(name = "Employee.findByPhoneNumber", query = "SELECT e FROM Employee e WHERE e.phoneNumber = :phoneNumber")})
public class Employee implements Serializable {
    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @NotNull
    @Column(name = "EmployeeNumber")
    private Integer employeeNumber;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "EmployeeName")
    private String employeeName;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "EmployeeSurname")
    private String employeeSurname;
    @Basic(optional = false)
    @NotNull
    @Size(min = 1, max = 20)
    @Column(name = "IdentityNumber")
    private String identityNumber;
    @Basic(optional = false)
    @NotNull
    @Column(name = "Gender")
    private char gender;
    @Column(name = "PhoneNumber")
    private Integer phoneNumber;
    @Lob
    @Size(max = 65535)
    @Column(name = "Address")
    private String address;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "employeeNumber")
    private Collection<Reservation> reservationCollection;

    public Employee() {
    }

    public Employee(Integer employeeNumber) {
        this.employeeNumber = employeeNumber;
    }

    public Employee(Integer employeeNumber, String employeeName, String employeeSurname, String identityNumber, char gender) {
        this.employeeNumber = employeeNumber;
        this.employeeName = employeeName;
        this.employeeSurname = employeeSurname;
        this.identityNumber = identityNumber;
        this.gender = gender;
    }

    public Integer getEmployeeNumber() {
        return employeeNumber;
    }

    public void setEmployeeNumber(Integer employeeNumber) {
        this.employeeNumber = employeeNumber;
    }

    public String getEmployeeName() {
        return employeeName;
    }

    public void setEmployeeName(String employeeName) {
        this.employeeName = employeeName;
    }

    public String getEmployeeSurname() {
        return employeeSurname;
    }

    public void setEmployeeSurname(String employeeSurname) {
        this.employeeSurname = employeeSurname;
    }

    public String getIdentityNumber() {
        return identityNumber;
    }

    public void setIdentityNumber(String identityNumber) {
        this.identityNumber = identityNumber;
    }

    public char getGender() {
        return gender;
    }

    public void setGender(char gender) {
        this.gender = gender;
    }

    public Integer getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(Integer phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
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
        hash += (employeeNumber != null ? employeeNumber.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Employee)) {
            return false;
        }
        Employee other = (Employee) object;
        if ((this.employeeNumber == null && other.employeeNumber != null) || (this.employeeNumber != null && !this.employeeNumber.equals(other.employeeNumber))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "thuli.Employee[ employeeNumber=" + employeeNumber + " ]";
    }
    
}
