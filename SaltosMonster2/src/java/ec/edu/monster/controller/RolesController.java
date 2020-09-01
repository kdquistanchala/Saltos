/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.edu.monster.controller;

import ec.edu.monster.ejb.RolFacadeLocal;
import ec.edu.monster.ejb.SubsistemaFacadeLocal;
import ec.edu.monster.ejb.UsuarioFacadeLocal;
import ec.edu.monster.model.Rol;
import ec.edu.monster.model.Subsistema;
import ec.edu.monster.model.Usuario;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author danie
 */
@Named
@SessionScoped
public class RolesController implements Serializable {

    @EJB
    private RolFacadeLocal rolEJB;
    private Rol rol;
    private Rol rolCreate;
    private List<Rol> roles;

    @EJB
    private SubsistemaFacadeLocal subsistemaEJB;
    private List<Subsistema> subsistemas;
    private List<Subsistema> subsistemasNo;
    private Subsistema subsistema;

    @EJB
    private UsuarioFacadeLocal usuarioEJB;
    private List<Usuario> usuario;
    private List<Usuario> usuarioNo;

    private String rolid;
    private String userValid;
    private String userNoValid;

    public String getRolid() {
        return rolid;
    }

    public void setRolid(String rolid) {
        this.rolid = rolid;
    }

    public String getUserValid() {
        return userValid;
    }

    public void setUserValid(String userValid) {
        this.userValid = userValid;
    }

    public String getUserNoValid() {
        return userNoValid;
    }

    public void setUserNoValid(String userNoValid) {
        this.userNoValid = userNoValid;
    }

    public List<Subsistema> getSubsistemasNo() {
        return subsistemasNo;
    }

    public void setSubsistemasNo(List<Subsistema> subsistemasNo) {
        this.subsistemasNo = subsistemasNo;
    }

    public List<Subsistema> getSubsistemas() {
        return subsistemas;
    }

    public void setSubsistemas(List<Subsistema> subsistemas) {
        this.subsistemas = subsistemas;
    }

    //U
    private int selectedItemIndex;

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }

    public List<Rol> getRoles() {
        return roles;
    }

    public void setRoles(List<Rol> roles) {
        this.roles = roles;
    }

    public int getSelectedItemIndex() {
        return selectedItemIndex;
    }

    public void setSelectedItemIndex(int selectedItemIndex) {
        this.selectedItemIndex = selectedItemIndex;
    }

    public Rol getRolCreate() {
        return rolCreate;
    }

    public void setRolCreate(Rol rolCreate) {
        this.rolCreate = rolCreate;
    }

    public Subsistema getSubsistema() {
        return subsistema;
    }

    public void setSubsistema(Subsistema subsistema) {
        this.subsistema = subsistema;
    }

    public List<Usuario> getUsuario() {
        return usuario;
    }

    public void setUsuario(List<Usuario> usuario) {
        this.usuario = usuario;
    }

    public List<Usuario> getUsuarioNo() {
        return usuarioNo;
    }

    public void setUsuarioNo(List<Usuario> usuarioNo) {
        this.usuarioNo = usuarioNo;
    }

    @PostConstruct
    public void init() {
        roles = rolEJB.findAll();
        try {
            //usuario = usuarioEJB.usuarioRol(1);
            //usuarioNo = usuarioEJB.usuarioNoRol(1);
        } catch (Exception e) {

        }

        rol = new Rol();
        rolCreate = new Rol();
        subsistema = new Subsistema();
    }

    public void registrar() {
        try {
            rolEJB.create(rolCreate);
            roles = rolEJB.findAll();

        } catch (Exception e) {
        }

    }

    public Rol getSelected() {

        if (rol == null) {
            rol = new Rol();
            selectedItemIndex = -1;
        }
        return rol;
    }

    /*
    public void recuperarRoles(){
        rol=rolEJB.findAll();
    }
     */
    public List<Usuario> leerUsuario() {

        try {
            Rol rols = rolEJB.getRolId(rolid);
            usuario = usuarioEJB.usuarioRol(rols.getRol_id());
        } catch (Exception e) {

        }

        return usuario;

    }

    public List<Usuario> leerUsuarioNo() {
        try {
            Rol rols = rolEJB.getRolId(rolid);
            usuarioNo = usuarioEJB.usuarioNoRol(rols.getRol_id());
        } catch (Exception e) {

        }
        return usuarioNo;
    }

    public void leer(Rol rolSeleccion) {
        rol = rolSeleccion;
        subsistemas = subsistemaEJB.listarSubsistemas(rol.getRol_id());
        subsistemasNo = subsistemaEJB.listarNoSubsistemas(rol.getRol_id());
    }

    public void addPermiso(Subsistema subsistemaSeleccion) {
        subsistema = subsistemaSeleccion;
        subsistema.setRol_id(rol.getRol_id());
        //System.out.println(rol.getRol_id());
        subsistemaEJB.create(subsistema);
    }

    public void update() {

        try {
            rolEJB.edit(rol);
        } catch (Exception e) {

        }
    }

    public void guardado() {

        subsistemasNo = subsistemaEJB.listarNoSubsistemas(rol.getRol_id());
    }

    public void actualizar() {

        //Recuperar usuario  
        try {
            Usuario usuario = usuarioEJB.usuarioObjeto(userNoValid);
            Rol rols = rolEJB.getRolId(rolid);
            usuario.setRol(rols.getRol_id());
            usuarioEJB.edit(usuario);

        } catch (Exception e) {

        }

    }

    public void actualizarTodos() {

        //Recuperar usuario  
        try {
            Rol rols = rolEJB.getRolId(rolid);
            
            usuarioEJB.actualizarTodos(rols.getRol_id());

        } catch (Exception e) {

        }
    }

    public void regresar() {

        //Recuperar usuario  
        try {
            Usuario usuario = usuarioEJB.usuarioObjeto(userValid);
            Rol rols = rolEJB.getRolId("No asignado");
            usuario.setRol(rols.getRol_id());
            usuarioEJB.edit(usuario);

        } catch (Exception e) {

        }
    }

    public void quitarTodos() {

        try {
            Rol rols = rolEJB.getRolId("No asignado");
            
            usuarioEJB.actualizarTodos(rols.getRol_id());

        } catch (Exception e) {

        }
    }
}
