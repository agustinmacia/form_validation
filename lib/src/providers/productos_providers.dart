//Archivo encargado de hacer las interacciones directas con la Base de datos

import 'dart:convert';

import 'package:form_validation/src/models/producto_model.dart';
import 'package:http/http.dart' as http;

class ProductosProvider {

  final String _url = 'https://flutter-varios-5f69c.firebaseio.com';

  
  
  Future<bool> crearProducto(ProductoModel producto) async{

    final url = '$_url/productos.json';

    final response = await http.post(url, body: productoModelToJson(producto));

    final decodedData = json.decode(response.body);

    print(decodedData);

    return true;
  }

}