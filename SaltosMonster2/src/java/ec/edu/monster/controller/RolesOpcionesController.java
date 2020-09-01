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
import javax.inject.Named;

/**
 *
 * @author danie
 */
@Named
@SessionScoped
public class RolesOpcionesController implements Serializable{

    @EJB
    private RolFacadeLocal rolEJB;
    private Rol rol;
    private Rol rolCreate;
    private List<Rol> roles;
    private Subsistema subsistemaCreate;

    @EJB
    private SubsistemaFacadeLocal subsistemaEJB;
    private List<Subsistema> subsistemas;
    private List<Subsistema> subsistemasNo;
    private Subsistema subsistema;

    @EJB
    private UsuarioFacadeLocal usuarioEJB;
    private List<Subsistema> subsistemaSi;
    private List<Subsistema> subsistemaNo;

    private String rolid;
    private String opValid;
    private String opNoValid;

    public String getRolid() {
        return rolid;
    }

    public void setRolid(String rolid) {
        this.rolid = rolid;
    }

    public String getOpValid() {
        return opValid;
    }

    public void setOpValid(String opValid) {
        this.opValid = opValid;
    }

    public String getOpNoValid() {
        return opNoValid;
    }

    public void setOpNoValid(String opNoValid) {
        this.opNoValid = opNoValid;
    }

    public Subsistema getSubsistemaCreate() {
        return subsistemaCreate;
    }

    public void setSubsistemaCreate(Subsistema subsistemaCreate) {
        this.subsistemaCreate = subsistemaCreate;
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

    public List<Subsistema> getSubsistemaSi() {
        return subsistemaSi;
    }

    public void setSubsistemaSi(List<Subsistema> subsistemaSi) {
        this.subsistemaSi = subsistemaSi;
    }

    public List<Subsistema> getSubsistemaNo() {
        return subsistemaNo;
    }

    public void setSubsistemaNo(List<Subsistema> subsistemaNo) {
        this.subsistemaNo = subsistemaNo;
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
        subsistemaCreate= new Subsistema();
    }

    public void registrar() {
        try {
            
            subsistemaCreate.setRol_id(18);
            
            subsistemaEJB.create(subsistemaCreate);

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
    public List<Subsistema> leerOp() {

        try {
            Rol rols = rolEJB.getRolId(rolid);
            subsistemaSi = subsistemaEJB.listarSubsistemas(rols.getRol_id());
        } catch (Exception e) {

        }

        return subsistemaSi;

    }

    
    /**************************************************/
    public List<Subsistema> leerOpNo() {
        try {
            Rol rols = rolEJB.getRolId(rolid);
            subsistemaNo = subsistemaEJB.listarNoSubsistemas(rols.getRol_id());
        } catch (Exception e) {

        }
        return subsistemaNo;
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
            
            Subsistema subsistemap= subsistemaEJB.subsistemaObjeto(opNoValid);
            Rol rols = rolEJB.getRolId(rolid);
            subsistemap.setRol_id(rols.getRol_id());
            subsistemaEJB.edit(subsistemap);

        } catch (Exception e) {

        }

    }


    public void regresar() {

        //Recuperar usuario  
        try {
            Subsistema subistemap= subsistemaEJB.subsistemaObjeto(opValid);
            Rol rols = rolEJB.getRolId("No asignado");
            subistemap.setRol_id(rols.getRol_id());
            subsistemaEJB.edit(subistemap);

        } catch (Exception e) {

        }
    }

}