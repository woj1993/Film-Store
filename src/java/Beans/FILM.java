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
public class FILM implements Serializable {

    private String Tytuł;
    private String Autor;
    private String Rok;
    private String Film;

    public FILM() {

    }

    public FILM(String Tytuł, String Autor, String Rok, String Film) {
        this.Tytuł = Tytuł;
        this.Autor = Autor;
        this.Rok = Rok;
        this.Film = Film;
    }

    public String GetTytuł() {
        return Tytuł;
    }

    public void SetTytuł(String Tytuł) {
        this.Tytuł = Tytuł;
    }

    public String GetAutor() {
        return Autor;
    }

    public void SetAutor(String Autor) {
        this.Autor = Autor;
    }

    public String GetRok() {
        return Rok;
    }

    public void SetRok(String Rok) {
        this.Rok = Rok;
    }

    public String GetFilm() {
        return Film;
    }

    public void SetFilm(String Film) {
        this.Film = Film;
    }
}
