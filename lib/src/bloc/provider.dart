//InheritedWidget personalizado

import 'package:flutter/material.dart';
import 'package:form_validation/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget{

  final loginBloc = LoginBloc();

  //Implementacion de un inheritedWidget
  Provider({Key key, Widget child})
    : super(key: key, child: child);
  
  //Cuando se actualice debe avisar a los hijos
  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  //Toma el contexto y busca el widget con el tipo de Provider
  static LoginBloc of ( BuildContext context ){
   return context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc;
}

}