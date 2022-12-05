<?php

namespace Dao\Mnt;

use Dao\Table;

class Pasarela extends Table
{
    public static function ObtenerLibro(int $ID)
    {
        $sqlstr = "
        SELECT * FROM carrito where Libro = :ID";
        $sqlParams = array("ID" => $ID);
        return self::obtenerUnRegistro($sqlstr, $sqlParams);
    }


    public static function insert($Libro, $Usuario)
    {
        $sqlstr = "INSERT INTO `Carrito` (`Libro`, `Usuario`) VALUES (:Libro, :Usuario)";
        $sqlParams = [
            "Libro" => $Libro,
            "Usuario" => $Usuario,
        ];
        return self::executeNonQuery($sqlstr, $sqlParams);
    }


    public static function CargarCarrito($Usuario)
    {
        $sqlstr = "
        select b.ID,  a.Usuario, b.Titulo, b.Autor, b.Genero, b.Imagen, b.Genero, b.Idioma, b.Precio, b.Fecha from Carrito a inner join LibrosInventario b
        on a.Libro = b.ID 
        where a.Usuario = :Usuario";
        $sqlParams = array("Usuario" => $Usuario);
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }


    public static function CarritoTotal($Usuario){
        $sqlstr = "
        select sum(b.Precio) as Total from Carrito a inner join LibrosInventario b
        on a.Libro = b.ID  
        where a.Usuario = :Usuario";
        $sqlParams = array("Usuario" => $Usuario);
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }


    public static function CarritoCount($Usuario){
        $sqlstr = "
        select count(*) as LibrosCarrito from Carrito a inner join LibrosInventario b
        on a.Libro = b.ID 
        where a.Usuario = :Usuario";
        $sqlParams = array("Usuario" => $Usuario);
        return self::obtenerRegistros($sqlstr, $sqlParams);
    }



}
