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
public class MiembroPK implements Serializable {

    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_USUARIO")
    private int idUsuario;
    @Basic(optional = false)
    @NotNull
    @Column(name = "ID_GRUPO")
    private int idGrupo;

    public MiembroPK() {
    }

    public MiembroPK(int idUsuario, int idGrupo) {
        this.idUsuario = idUsuario;
        this.idGrupo = idGrupo;
    }

    public int getIdUsuario() {
        return idUsuario;
    }

    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public int getIdGrupo() {
        return idGrupo;
    }

    public void setIdGrupo(int idGrupo) {
        this.idGrupo = idGrupo;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (int) idUsuario;
        hash += (int) idGrupo;
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof MiembroPK)) {
            return false;
        }
        MiembroPK other = (MiembroPK) object;
        if (this.idUsuario != other.idUsuario) {
            return false;
        }
        if (this.idGrupo != other.idGrupo) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "beans.MiembroPK[ idUsuario=" + idUsuario + ", idGrupo=" + idGrupo + " ]";
    }

}
