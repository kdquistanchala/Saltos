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
import javax.servlet.http.Part;

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
    

    private String foto;
    
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

    public ClienteFacadeLocal getClienteEJB() {
        return clienteEJB;
    }

    public void setClienteEJB(ClienteFacadeLocal clienteEJB) {
        this.clienteEJB = clienteEJB;
    }

    public String getFoto() {
        return foto;
    }

    public void setFoto(String foto) {
        this.foto = foto;
    }

    
    
    
    public void doUpload(){
        System.out.println(foto);
        /*
        try{
            InputStream in=image.getInputStream();
            
            File f = new File(""+image.getSubmittedFileName());
            f.createNewFile();
            FileOutputStream out = new FileOutputStream(f);
            
            byte[] buffer = new byte[1024];
            int length;
            
            while((length=in.read(buffer))>0){
                out.write(buffer,0,length);
            }
            
            out.close();
            in.close();
            
        }catch(Exception e){
            e.printStackTrace(System.out);
        }*/
    }
    
    public void registrar(){
        try{
            
            persona.setPersona_foto(null);
            this.cliente.setPersona(persona);
            clienteEJB.create(cliente);
        }
        catch(Exception e){
        }
    }
}
