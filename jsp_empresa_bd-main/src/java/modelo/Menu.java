
package modelo;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;


public class Menu {
    
     Conexion cn;
    private String nombre;
    private int rol;

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getRol() {
        return rol;
    }

    public void setRol(int rol) {
        this.rol = rol;
    }
      public HashMap drop() {
        HashMap<String, String> drop = new HashMap();
        try {
            String query = "Select contenido,roles from menu ORDER by id_menu ASC;";
            cn = new Conexion();
            cn.abrir_conexion();
            ResultSet consulta = cn.conexionBD.createStatement().executeQuery(query);
            while (consulta.next()) {
                drop.put(consulta.getString("contenido"), consulta.getString("roles"));
            }
            cn.cerrar_conexion();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
        return drop;
    }
}
