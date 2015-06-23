/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.io.Serializable;

/**
 *
 * @author Wojtek
 */
public class UŻYTKOWNIK implements Serializable {

    private String login;
    private String hasło;
    private String imie;
    private Boolean admin;
    private Boolean zapłacił;

    public UŻYTKOWNIK() {
    }

    public UŻYTKOWNIK(String login, String hasło, String imie, Boolean admin, Boolean zapłacił) {
        this.login = login;
        this.hasło = hasło;
        this.imie = imie;
        this.admin = admin;
        this.zapłacił = zapłacił;
    }

    public void SetLogin(String Login) {
        this.login = Login;
    }

    public String GetLogin() {
        return login;
    }

    public String GetHasło() {
        return hasło;
    }

    public void SetHasło(String hasło) {
        this.hasło = hasło;
    }

    public String GetImie() {
        return imie;
    }

    public void SetImie(String imie) {
        this.imie = imie;
    }

    public void UstawPoziom(Boolean admin) {
        this.admin = admin;
    }

    public boolean JestAdminem() {
        return admin;
    }

    public boolean Zapłacił() {
        return zapłacił.equals(true);
    }

}
