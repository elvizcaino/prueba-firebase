import 'dart:convert';

ProductosModel productosModelFromJson(String str) => ProductosModel.fromJson(json.decode(str));
String productosModelToJson(ProductosModel data) => json.encode(data.toJson());

class ProductosModel {
    ProductosModel({
        this.id,
        this.codigo,
        this.nombre,
    });

    String id;
    String codigo;
    String nombre;

    factory ProductosModel.fromJson(Map<String, dynamic> json) => ProductosModel(
        id: json["id"],
        codigo: json["codigo"],
        nombre: json["nombre"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "codigo": codigo,
        "nombre": nombre,
    };
}
