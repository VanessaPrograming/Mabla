package com.example.BDMabla.Controlador;
import com.example.BDMabla.Servicios.STablaCategorias;
import org.springframework.web.bind.annotation.*;
import com.example.BDMabla.Entidad.TablaCategorias;


import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;


import java.util.List;

@RestController
public class CTablaCategorias {
    private STablaCategorias serCategorias;

    public CTablaCategorias(STablaCategorias serCategorias) {
        this.serCategorias = serCategorias;
    }

    @GetMapping("/getCategorias")
    public List<TablaCategorias> vercategorias(){
        return serCategorias.getCategorias();
    }

    @PostMapping("/postCategoria")
    public String insertCategoria(@RequestBody TablaCategorias cat){
        return serCategorias.postCategorias(cat);
    }

    @DeleteMapping("/deletePreg/{cat}")
    public String eliminarProducto(@PathVariable("cat") Integer cat){
        return serCategorias.DeletePreg(cat);
    }

}

