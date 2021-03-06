import 'package:flutter/material.dart';
import 'package:form_validation/src/models/producto_model.dart';
import 'package:form_validation/src/providers/productos_providers.dart';
import 'package:form_validation/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {

  final formKey = GlobalKey<FormState>();
  ProductoModel producto = new ProductoModel();
  final productoProvider = new ProductosProvider();


  @override
  Widget build(BuildContext context) {
    
    //Envio los argumentos del producto si viene. Si no viene el productoData vendra como NULL
    final ProductoModel productoData = ModalRoute.of(context).settings.arguments;

    if(productoData != null) {
      producto = productoData;
    }
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed: () {}
            ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {}
            ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre() {
    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (String valor) => producto.titulo = valor,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre de un producto'; 
        } else {
          return null;
        }
      },
    );
  }

  Widget _crearPrecio() {
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      onSaved: (value) => producto.valor = double.parse(value),
      validator: (value) {
        if(utils.esUnNumero(value)) {
          return null;
        } else {
          return 'Solo deben ingresarse numeros';
        }
      },
    );
  }

  Widget _crearBoton() {
    return RaisedButton.icon(
      onPressed: _submit, 
      icon: Icon (Icons.save), 
      label: Text('Guardar'),
      textColor: Colors.white,
      color: Colors.deepPurple,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20.0),
      ),
      );
  }

  Widget _crearDisponible() {

    return SwitchListTile(
      value: producto.disponible,
      title: Text('Disponible'),
      onChanged: (value) => setState(() {
        producto.disponible = value;
      }),
      activeColor: Colors.deepPurple,
    );
  }

  void _submit() {

    if(!formKey.currentState.validate()) return;
    
    //Despues de realizar todas las validaciones, ejectuo el save para guardar los valores ingresados en el formulario
    formKey.currentState.save();

    print(producto.titulo);
    print(producto.valor);
    print(producto.disponible);
  
    if(producto.id != null) {
      productoProvider.crearProducto(producto);
    } else {
      productoProvider.modificarProducto(producto);
    }

  }
}