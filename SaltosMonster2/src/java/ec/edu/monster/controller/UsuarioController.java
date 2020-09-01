/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.edu.monster.controller;

import ec.edu.monster.ejb.ClienteFacadeLocal;
import ec.edu.monster.ejb.PersonaFacadeLocal;
import ec.edu.monster.ejb.UsuarioFacadeLocal;
import ec.edu.monster.model.Cliente;
import ec.edu.monster.model.Persona;
import ec.edu.monster.model.Rol;
import ec.edu.monster.model.Usuario;
import java.io.Serializable;
import java.util.List;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;
import org.apache.commons.codec.digest.DigestUtils;

/**
 *
 * @author danie
 */

@Named
@ViewScoped
public class UsuarioController implements Serializable{
    
    
    @EJB
    private UsuarioFacadeLocal usuarioEJB;
    
    @EJB
    private ClienteFacadeLocal clienteEJB;
    
    @EJB
    private PersonaFacadeLocal personaEJB;
    
    private Persona persona;
    private Usuario usuario;
    private Cliente cliente;
    private Rol rol;
    
    private List<Persona> personas;
    private List<Usuario> usuarios;
    
    
    @PostConstruct
    public void init(){
        usuario= new Usuario();
        persona = new Persona();
        rol = new Rol();
        cliente = new Cliente();
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
    }

    public Usuario getUsuario() {
        return usuario;
    }

    public void setUsuario(Usuario usuario) {
        this.usuario = usuario;
    }

    public Rol getRol() {
        return rol;
    }

    public void setRol(Rol rol) {
        this.rol = rol;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }

    
    
    public void registrar(){
        try{
             
            this.cliente.setPersona(persona);
            clienteEJB.create(cliente);
            
            this.usuario.setPersona(persona.getPersona_id());
            this.usuario.setRol(1);
            String encriptado=DigestUtils.md5Hex(usuario.getUsuario_password());

            usuario.setUsuario_password(encriptado);
            
            usuarioEJB.create(usuario);
            
        }
        catch(Exception e){
        }
    }   
}
