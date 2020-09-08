/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package ec.edu.monster.ejb;

import ec.edu.monster.model.Reservavuelo;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

/**
 *
 * @author danie
 */
@Stateless
public class ReservavueloFacade extends AbstractFacade<Reservavuelo> implements ReservavueloFacadeLocal {

    @PersistenceContext(unitName = "SaltosMonsterPU")
    private EntityManager em;

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

    public ReservavueloFacade() {
        super(Reservavuelo.class);
    }

    @Override
    public List<Reservavuelo> listarReservas(int numVuelo) {

        List<Reservavuelo> lista = null;
        String consulta;
        try {
            consulta = "SELECT r FROM Reservavuelo r WHERE r.numVuelo = ?1";
            //consulta="SELECT * FROM Usuario u WHERE u.USUARIO_NOMBRE = ?1 and u.USUARIO_PASSWORD = ?2";
            Query query = em.createQuery(consulta);
            query.setParameter(1, numVuelo);
            //Query query= em.createNativeQuery(consulta);

            lista = query.getResultList();

        } catch (Exception e) {
            throw e;
        }
        return lista;

    }

}
