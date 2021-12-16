import 'package:flutter/material.dart';
import 'package:flutter_app_ubicacionusuario/boton/ubicacion.dart';
//import 'package:sosuagrm/ubicacion.dart';

class Policiapage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {


  /*
    return Scaffold(
      appBar: AppBar(title:Text('Policia'),),
      body: Center(
        child: RaisedButton(child: Text('volver'),
        onPressed: ()
        {
          Navigator.pop(context);
        }
        ),
      
    ),
      );
  */
    return SafeArea(
    child: Scaffold(
    body: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          RaisedButton(
            child: Text("ubicacion"),
        onPressed: ()
        {
          //vamos a las segunda pagina
          Navigator.push(context, MaterialPageRoute(builder: (context)=> MapSample ()));
         //Navigator.pop(context);
        }
       ),
        /*RaisedButton(
           child: Text("ubicacion"),
          onPressed: ()
      {
          //vamos a las segunda pagina
          //Navigator.push(context, MaterialPageRoute(builder: (context)=>MapSample()));
        }
        ),   */ 
        ],
       
        ),
    ),
      ),
    );
 
 
 
  }
}