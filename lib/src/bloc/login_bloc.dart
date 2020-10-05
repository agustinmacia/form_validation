//Archivo para hacer validaciones en el login form

import 'dart:async';

class LoginBloc {

  //Le especifico la informacion que va a pasar por el stream Controller. Con el broadcast puedo escuchar mas de una instancia
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Recuperar datos del stream(Salida)
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passwordStream => _passwordController.stream;
  
  //Agrego info al stream
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;


  //Cerrar los streams. Uso dipose.
  dispose() {
    
    //Con el ? valido que el valor no sea nulo
    _emailController?.close();
    _passwordController?.close();
  }


}