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
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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

    public SQL() {
        try {
            Class.forName("org.sqlite.JDBC");
            połączenie = DriverManager.getConnection("jdbc:sqlite:aaa.db");
            createTable();

        } catch (ClassNotFoundException | SQLException e) {
        }
    }

    private void createTable() throws SQLException {

        String tabFilmy = "CREATE TABLE IF NOT EXISTS Filmy"
                + "(tytuł VARCHAR(20)     NOT NULL,"
                + " autor VARCHAR(20)    NOT NULL, "
                + " rok   VARCHAR(20) NOT NULL, "
                + " Film        VARCHAR(100) NOT NULL,"
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
        WstawUżytkownika("admin", "admin", "admin", true, true);
        WstawFilm("dan", "dan", "dan", "http://www.mp4upload.com/embed-znqard8wfaex.html");
    }

    public boolean isConnection() {
        return połączenie != null;

    }

    public boolean WstawUżytkownika(String login, String hasło, String imie, Boolean admin, Boolean zapłacił) {
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

    public boolean WstawFilm(String Nazwa, String Autor, String Opis, String URL) {
        String query = "INSERT INTO Filmy VALUES(?,?,?,?);";
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

    public UŻYTKOWNIK SprawdźUżytkownika(String login, String hasło) {

        String query = "SELECT * FROM Users WHERE login=? AND hasło=?;";
        UŻYTKOWNIK Użytkownik = null;

        try {
            preparedstatment = połączenie.prepareStatement(query);
            preparedstatment.setString(1, login);
            preparedstatment.setString(2, hasło);
            try (ResultSet rs = preparedstatment.executeQuery()) {
                rs.next();
                Użytkownik = new UŻYTKOWNIK(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5));
            }
            preparedstatment.close();
        } catch (Exception e) {
        }
        return Użytkownik;
    }

    public ArrayList<FILM> PokażFilmy() {
        String query;
        query = "SELECT * FROM Filmy ORDER BY lower(tytuł);";
        ArrayList<FILM> FilmyList = new ArrayList<>();
        FILM Film;
        try {
            preparedstatment = połączenie.prepareStatement(query);

            try (ResultSet rs = preparedstatment.executeQuery()) {
                while (rs.next()) {
                    Film = new FILM(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
                    System.out.println(Film);
                    FilmyList.add(Film);
                }
            }
            preparedstatment.close();
        } catch (Exception e) {
        }
        return FilmyList;
    }

    public FILM WybierzJedenFilm(String Tytuł) {
        String query = "SELECT * FROM Filmy WHERE tytuł=?;";
        FILM Film = null;

        try {
            preparedstatment = połączenie.prepareStatement(query);
            preparedstatment.setString(1, Tytuł);
            try (ResultSet rs = preparedstatment.executeQuery()) {
                rs.next();
                Film = new FILM(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4));
            }
            preparedstatment.close();
        } catch (Exception e) {
        }
        return Film;
    }

    public ArrayList<UŻYTKOWNIK> WybierzWszystkich() {
        String query;
        query = "SELECT * FROM Users WHERE login<>'admin';";
        ArrayList<UŻYTKOWNIK> userList = new ArrayList<>();
        UŻYTKOWNIK Użytkownik;
        try {
            preparedstatment = połączenie.prepareStatement(query);
            try (ResultSet rs = preparedstatment.executeQuery()) {
                while (rs.next()) {
                    Użytkownik = new UŻYTKOWNIK(rs.getString(1), rs.getString(2), rs.getString(3), rs.getBoolean(4), rs.getBoolean(5));
                    userList.add(Użytkownik);
                }
            }
            preparedstatment.close();
        } catch (Exception e) {
        }
        return userList;
    }

    public boolean UsuńUżytkownika(String Login) {
        String query = "DELETE from Users WHERE login=?";
        try {
            preparedstatment = połączenie.prepareStatement(query);
            preparedstatment.setString(1, Login);
            preparedstatment.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }

    public boolean ZmieńHasło(String login, String hasło) {
        String query = "UPDATE Users SET hasło=? WHERE login=?";
        try {
            preparedstatment = połączenie.prepareStatement(query);
            preparedstatment.setString(1, hasło);
            preparedstatment.setString(2, login);
            preparedstatment.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;

    }

    public boolean ZmieńDanePersonalne(String login, String imie) {
        String query = "UPDATE Users SET imie=? WHERE login=?";
        try {
            preparedstatment = połączenie.prepareStatement(query);
            preparedstatment.setString(1, imie);
            preparedstatment.setString(2, login);
            preparedstatment.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;

    }

    public boolean TakZapłacił(String Login, Boolean zapłacony) {
        String query = "UPDATE Users SET abonament_zapłacony=? WHERE login=?";
        try {
            preparedstatment = połączenie.prepareStatement(query);
            preparedstatment.setBoolean(1, zapłacony);
            preparedstatment.setString(2, Login);
            preparedstatment.executeUpdate();
            return true;
        } catch (Exception e) {
        }
        return false;
    }

    public boolean UsuńFilm(String Tytuł) {
        String query = "DELETE from Filmy WHERE tytuł=?";
        try {
            preparedstatment = połączenie.prepareStatement(query);
            preparedstatment.setString(1, Tytuł);
            preparedstatment.executeUpdate();
            return true;
        } catch (Exception e) {
            System.out.println(e);
            return false;
        }
    }
}
