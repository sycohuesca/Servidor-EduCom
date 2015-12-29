/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package beans;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.validation.constraints.NotNull;

/**
 *
 * @author syco
 */
@Embeddable
public class UsuarioTipoUsuarioPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_USUARIO")
    private int idUsuario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_TIPO_USUARIO")
    private int idTipoUsuario;

    public UsuarioTipoUsuarioPK() {
    }

    public UsuarioTipoUsuarioPK(int idUsuario, int idTipoUsuario) {
        this.idUsuario = idUsuario;
        this.idTipoUsuario = idTipoUsuario;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdTipoUsuario() {
        return idTipoUsuario;
    }

    public void setIdTipoUsuario(int idTipoUsuario) {
        this.idTipoUsuario = idTipoUsuario;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idUsuario;
        hash += (int) idTipoUsuario;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof UsuarioTipoUsuarioPK)) {
            return false;
        }
        UsuarioTipoUsuarioPK other = (UsuarioTipoUsuarioPK) object;
        if (this.idUsuario != other.idUsuario) {
            return false;
        }
        if (this.idTipoUsuario != other.idTipoUsuario) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "ws.UsuarioTipoUsuarioPK[ idUsuario=" + idUsuario + ", idTipoUsuario=" + idTipoUsuario + " ]";
    }

}
