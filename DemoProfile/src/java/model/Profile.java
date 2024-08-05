/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author Admin
 */
public class Profile {
    private int profileId;
    private String email;
    private String fullname;
    private String phoneNumber;
    private String address;
    private String country;
    private String state;
    private String experience;
    private String addDetail;

    public Profile() {
    }

    public Profile(int profileId, String email, String fullname, String phoneNumber, String address, String country, String state, String experience, String addDetail) {
        this.profileId = profileId;
        this.email = email;
        this.fullname = fullname;
        this.phoneNumber = phoneNumber;
        this.address = address;
        this.country = country;
        this.state = state;
        this.experience = experience;
        this.addDetail = addDetail;
    }

    public int getProfileId() {
        return profileId;
    }

    public void setProfileId(int profileId) {
        this.profileId = profileId;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getExperience() {
        return experience;
    }

    public void setExperience(String experience) {
        this.experience = experience;
    }

    public String getAddDetail() {
        return addDetail;
    }

    public void setAddDetail(String addDetail) {
        this.addDetail = addDetail;
    }

    @Override
    public String toString() {
        return "Profile{" + "profileId=" + profileId + ", email=" + email + ", fullname=" + fullname + ", phoneNumber=" + phoneNumber + ", address=" + address + ", country=" + country + ", state=" + state + ", experience=" + experience + ", addDetail=" + addDetail + '}';
    }
    
    
}
