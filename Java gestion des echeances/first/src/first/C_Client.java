/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package first;

/**
 *
 * @author frinkey
 */
public class C_Client {
    public int id_c;
        public String nom;
        public String prenom;
        public String adresse;
        public String tel;
        public String email;
        public int solv;
        
        public C_Client(){}

    /**
     * @return the id_c
     */
    public int getId_c() {
        return id_c;
    }

    /**
     * @param id_c the id_c to set
     */
    public void setId_c(int id_c) {
        this.id_c = id_c;
    }

    /**
     * @return the nom
     */
    public String getNom() {
        return nom;
    }

    /**
     * @param nom the nom to set
     */
    public void setNom(String nom) {
        this.nom = nom;
    }

    /**
     * @return the prenom
     */
    public String getPrenom() {
        return prenom;
    }

    /**
     * @param prenom the prenom to set
     */
    public void setPrenom(String prenom) {
        this.prenom = prenom;
    }

    /**
     * @return the adresse
     */
    public String getAdresse() {
        return adresse;
    }

    /**
     * @param adresse the adresse to set
     */
    public void setAdresse(String adresse) {
        this.adresse = adresse;
    }

    /**
     * @return the tel
     */
    public String getTel() {
        return tel;
    }

    /**
     * @param tel the tel to set
     */
    public void setTel(String tel) {
        this.tel = tel;
    }

    /**
     * @return the email
     */
    public String getEmail() {
        return email;
    }

    /**
     * @param email the email to set
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * @return the solv
     */
    public int getSolv() {
        return solv;
    }

    /**
     * @param solv the solv to set
     */
    public void setSolv(int solv) {
        this.solv = solv;
    }

}
