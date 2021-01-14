import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pruebafirebase/src/models/productos_model.dart';

class FirebaseDB {
  static Future<List<ProductosModel>> getProductos() async {
    final firebase = FirebaseFirestore.instance;
    final productos = List<ProductosModel>();

    print(firebase);

    await firebase.collection('productos').get()
      .then((snapshot) {
        snapshot.docs.forEach((doc) { 
          productos.add(new ProductosModel(
            id: doc.id,
            codigo: doc.data()["codigo"],
            nombre: doc.data()["nombre"],
          ));
        });
      });

    return productos;
  }
}