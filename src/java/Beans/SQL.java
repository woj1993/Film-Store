/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Beans;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Wojtek
 */
public class SQL implements Serializable {
    private Connection połączenie = null;
    private Statement rawstatment = null;
    private PreparedStatement preparedstatment;
    public SQL(){
    try {
            Class.forName("org.sqlite.JDBC");
            połączenie = DriverManager.getConnection("jdbc:sqlite:użytkownicy.db");
            createTable();

        } catch (ClassNotFoundException | SQLException e) {
        }}
    private void createTable() throws SQLException {

        String tabFilmy = "CREATE TABLE IF NOT EXISTS Filmy"
                + "(tytuł VARCHAR(20)     NOT NULL,"
                + " autor VARCHAR(20)    NOT NULL, "
                + " rok   VARCHAR(20) NOT NULL, "
                + " Film        VARCHAR(100),"
                + "CONSTRAINT pk	PRIMARY KEY(tytuł))";
        String tabUżytkownicy = "CREATE TABLE IF NOT EXISTS Users"
                + "(login VARCHAR(30)     NOT NULL,"
                + " hasło VARCHAR(30)    NOT NULL, "
                + " imie        VARCHAR(30),"
                + " admin       Boolean,"
                + " abonament_zapłacony Boolean,"
                + "CONSTRAINT pk	PRIMARY KEY(login))";
        
    rawstatment = połączenie.createStatement();
        rawstatment.executeUpdate(tabFilmy);
        rawstatment.executeUpdate(tabUżytkownicy);
        rawstatment.close();
        WstawUżytkownika("a", "a", "a", true, true);
        WstawFilm("dan","dan","dan","http://www.mp4upload.com/znqard8wfaex");}
    
        public boolean isConnection() {
        return połączenie != null;

    }
    public boolean WstawUżytkownika(String login,String hasło,String imie,Boolean admin, Boolean zapłacił){
        String query = "INSERT INTO Users VALUES(?,?,?,?,?);";
        try {
            preparedstatment = połączenie.prepareStatement(query);
            preparedstatment.setString(1, login);
            preparedstatment.setString(2, hasło);
            preparedstatment.setString(3, imie);
            preparedstatment.setBoolean(4, admin);
            preparedstatment.setBoolean(5, zapłacił);
            preparedstatment.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SQL.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
    public boolean WstawFilm(String Nazwa,String Autor,String Opis,String URL){
        String query = "INSERT INTO Filmy VALUES(?,?,?,?,?);";
        try {
            preparedstatment = połączenie.prepareStatement(query);
            preparedstatment.setString(1, Nazwa);
            preparedstatment.setString(2, Autor);
            preparedstatment.setString(3, Opis);
            preparedstatment.setString(4, URL);
            preparedstatment.executeUpdate();
            return true;
        } catch (SQLException ex) {
            Logger.getLogger(SQL.class.getName()).log(Level.SEVERE, null, ex);
            return false;
        }
    }
}