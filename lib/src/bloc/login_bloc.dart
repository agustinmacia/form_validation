//Archivo para hacer validaciones en el login form

import 'dart:async';

import 'package:form_validation/src/bloc/validators.dart';

class LoginBloc with Validators{

  //Le especifico la informacion que va a pasar por el stream Controller. Con el broadcast puedo escuchar mas de una instancia
  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  //Recuperar datos del stream(Salida)
  Stream<String> get emailStream => _emailController.stream.transform( validarEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validarPassword );
  
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

/*static LoginBloc of ( BuildContext context ){
   return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
}*/