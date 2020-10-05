import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _loginForm(context),
        ],
      )
    );
  }

  Widget _crearFondo(BuildContext context) {

    final size = MediaQuery.of(context).size;

    final fondoVioleta =  Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: <Color> [
            Color.fromRGBO(63, 63, 156, 1.0),
            Color.fromRGBO(90, 70, 178, 1.0),
          ]
        ),
      ),
    );

    final circuloVioleta = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
      ),
    );


    return Stack(
      children: <Widget> [
        fondoVioleta,
        Positioned(top: 90.0, left: 28.0, child: circuloVioleta),
        Positioned(top: -40.0, right: -28.0, child: circuloVioleta),
        Positioned(bottom: -50.0, right: -10.0, child: circuloVioleta),
        Positioned(bottom: 120.0, right: 20.0, child: circuloVioleta),
        Positioned(bottom: -50.0, left: -20.0, child: circuloVioleta),

        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle, color: Colors.white, size: 100.0),
              SizedBox(
                height: 10.0, width: double.infinity),
              Text('Agustin Macia', style: TextStyle(color: Colors.white, fontSize: 25.0))

            ],
          ),
        )
      ],
    );

  }

  Widget _loginForm(BuildContext context) {
    
    final size = MediaQuery.of(context).size;
    
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          
          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),
          
          Container(
            width: size.width * 0.80,
            margin: EdgeInsets.symmetric(vertical: 30.0),
            padding: EdgeInsets.symmetric(vertical: 50.0),
            decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(5.0), boxShadow: <BoxShadow>[BoxShadow(color: Colors.black26, blurRadius: 3.0, offset: Offset(0.0, 5.0), spreadRadius: 3.0)]),
            child: Column(
              children: <Widget>[
                Text('Ingreso', style: TextStyle(fontSize: 20.0)),
                _crearEmail(),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _crearEmail() {

    return Container(
      child: TextField(
        keyboardType: TextInputType.emailAddress,
        decoration: InputDecoration(
          icon: Icon(Icons.alternate_email, color: Colors.deepPurple,
        ),
      ),
    );
  }
}