/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.edu.monster.controller;

import ec.edu.monster.ejb.ClienteFacadeLocal;
import ec.edu.monster.model.Cliente;
import ec.edu.monster.model.Persona;
import java.io.Serializable;
import javax.annotation.PostConstruct;
import javax.ejb.EJB;
import javax.faces.view.ViewScoped;
import javax.inject.Named;

/**
 *
 * @author danie
 */

@Named
@ViewScoped
public class ClienteController implements Serializable{

    @EJB
    private ClienteFacadeLocal clienteEJB;
    
    private Persona persona;
    private Cliente cliente;
    
    @PostConstruct
    public void init(){
        cliente= new Cliente();
        persona = new Persona();
    }

    public Persona getPersona() {
        return persona;
    }

    public void setPersona(Persona persona) {
        this.persona = persona;
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
        }
        catch(Exception e){
        }
    }
}
