/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans.service;

import beans.Usuario;
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
@Path("usuarios")
public class UsuarioFacadeREST extends AbstractFacade<Usuario> {

    @PersistenceContext(unitName = "EduComPU")
    private EntityManager em;

    public UsuarioFacadeREST() {
        super(Usuario.class);
    }

    @POST
    @Override
    @Consumes({"application/xml", "application/json"})
    public void create(Usuario entity) {
        entity.setIdUsuario(1);
        super.create(entity);
    }

    @POST
    @Path("nombre")
    @Produces({"application/xml", "application/json"})
    public Usuario findByNombre(Usuario entity) {
        Query sql = em.createNamedQuery("Usuario.findByNombre");
        sql.setParameter("nombre", entity.getNombre());
        List<Usuario> usuarios = sql.getResultList();
        return usuarios.get(0);
    }

    @PUT
    @Path("{id}")
    @Consumes({"application/xml", "application/json"})
    public void edit(@PathParam("id") Integer id, Usuario entity) {
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
    public Usuario find(@PathParam("id") Integer id) {
        return super.find(id);
    }

    @GET
    @Path("centro={id}")
    @Produces({"application/xml", "application/json"})
    public List<Usuario> findAllByCentro(@PathParam("id") int idCentro) {
        Query sql = em.createNamedQuery("Usuario.findAllByCentro");
        sql.setParameter("idCentro", idCentro);
        List<Usuario> usuarios = sql.getResultList();
        return usuarios;
    }

    @GET
    @Override
    @Produces({"application/xml", "application/json"})
    public List<Usuario> findAll() {
        return super.findAll();
    }

    @GET
    @Path("{from}/{to}")
    @Produces({"application/xml", "application/json"})
    public List<Usuario> findRange(@PathParam("from") Integer from, @PathParam("to") Integer to) {
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
