/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.service;

import beans.Grupo;
import java.util.Date;
import java.util.List;
import javax.ejb.Stateless;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import javax.ws.rs.Consumes;
import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;

/**
 *
 * @author syco
 */
@Stateless
@Path("grupos")
public class GrupoFacadeREST extends AbstractFacade<Grupo> {

    @PersistenceContext(unitName = "EduComPU")
    private EntityManager em;

    public GrupoFacadeREST() {
        super(Grupo.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Grupo entity) {
        entity.setIdGrupo(1);
        entity.setFechaHoraCreacion(new Date());
        super.create(entity);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Integer id, Grupo entity) {
        entity.setIdGrupo(id);
        entity.setFechaHoraCreacion(new Date());
        super.edit(entity);
    }

    @DELETE
    @Path("{id}")
    public void remove(@PathParam("id") Integer id) {
        super.remove(super.find(id));
    }

    @GET
    @Path("{id}")
    @Produces({"application/xml", "application/json"})
    public Grupo find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Path("centro={id}")
    @Produces({"application/json"})
    public List<Grupo> getFindAllByIdCentro(@PathParam("id") Integer idCentro) {
        Query sql = em.createNamedQuery("Grupo.findAllByIdCentro");
        sql.setParameter("idCentro", idCentro);
        List<Grupo> salida = sql.getResultList();
        if (salida.isEmpty()) {
            return null;
        } else {
            return salida;
        }
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Grupo> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Grupo> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
        return super.findRange(new int[]{from, to});
    }

    @GET
    @Path("count")
    @Produces("text/plain")
    public String countREST() {
        return String.valueOf(super.count());
    }

    @Override
    protected EntityManager getEntityManager() {
        return em;
    }

}
