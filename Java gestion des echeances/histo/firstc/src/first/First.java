/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package first;

import javax.swing.UIManager;

/**
 *
 * @author frinkey
 */
public class First {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        try { 
    UIManager.setLookAndFeel("com.sun.java.swing.plaf.nimbus.NimbusLookAndFeel"); 
} catch (Exception ex) { 
    ex.printStackTrace(); 
}
        new Home().setVisible(true);
        
    }
}
