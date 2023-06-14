package com.example.BDMabla.Servicios;

import com.example.BDMabla.Entidad.TablaCategorias;
import com.example.BDMabla.Repositorio.RTablaCategorias;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Collections;

@Service
public class STablaCategorias {

    private RTablaCategorias repCategorias;

    public STablaCategorias(RTablaCategorias repCategorias) {
        this.repCategorias = repCategorias;
    }

    public List<TablaCategorias> getCategorias(){
        return repCategorias.findAll();
    }

    public String postPreguntas(TablaCategorias cat){
        TablaCategorias catnuevo = new TablaCategorias();
        boolean inserto=false;
        if (getCategorias().isEmpty()){
            repCategorias.save(cat);
            inserto=true;
        }
        else {
            for (TablaCategorias c: getCategorias()){
                if (c.getIdCategoria() == cat.getIdCategoria()){
                    inserto = false;
                }
                else {
                    inserto = true;
                    repCategorias.save(cat);
                    break;
                }
            }
        }

        if (inserto==true){
            return "se registro";
        }
        else return "no se registro";
    }

    public String DeletePreg(Integer idcat){
        if(repCategorias.findById(idcat).isPresent()){
            repCategorias.deleteById(idcat);
            return "Se elimino el producto";
        }
        else return "No se elimino el producto";
    }
}

