import 'package:flutter/material.dart';
import 'package:pruebafirebase/src/helpers/firebase.dart';
import 'package:pruebafirebase/src/models/productos_model.dart';

class HomePage extends StatelessWidget {
  
    @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(''),),
      body: Container(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Container(
          child: FutureBuilder<List<ProductosModel>>(
            future: FirebaseDB.getProductos(),
            initialData: [],
            builder: (context, snapshot) {
              if(snapshot.hasError) {
                print(snapshot.error);
              }
              if(snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (_, index) {
                    return productoItem(snapshot.data[index]);
                  }
                );
              } else {
                return Center(child: Text('Sin datos'),);
              }
            },
          )
        ),
      ),
    );
  }

  Widget productoItem(ProductosModel producto) {
    return ListTile(
      title: Text(producto.nombre),
      subtitle: Text(producto.codigo),
    );
  }

}