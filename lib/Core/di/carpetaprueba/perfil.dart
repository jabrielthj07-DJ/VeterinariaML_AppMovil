import "package:flutter/matarial.dart";
import "package:flutter/material.dart";

class perfil extends statalesWidget
  perfil (super.key());


  @override
  Widget build (BuildContext context){
return Scaffold(
  appBar: AppBar(
    title: Text('Hoy es Juves'),
  ),
  body: Column(
  children: [
    Row(
      children: [
      
      Text("Bienvenido",
      style: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.bold,
        
      ),
      )
      ],
      
    ),
    ElevatedButton(
    onPressed: (){
      print('Boton precionado');

    },
    child: const Text('Precioname'),

    )
  ],
  
  ),
 );

  }

)

