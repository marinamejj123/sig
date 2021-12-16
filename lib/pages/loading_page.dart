/*import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart' as Geolocator;
import 'package:permission_handler/permission_handler.dart';
///import 'package:sosuagrm/helpers/helpers.dart';
import 'package:sosuagrm/pages/pages.dart';

import 'package:flutter/material.dart';
class LoadingPage extends StatelessWidget {
  

 
   @override
   Widget build(BuildContext context) {
     return const Center(
      child:  Text("servicios", style:TextStyle(fontSize: 30),),

    );
   }
 }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: this.checkGpsYLocation(context),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          /*return Center(
            child: CircularProgressIndicator(strokeWidth: 2),
          );*/
          print(snapshot.data);
          if ( snapshot.hasData ) {
            return Center(child: Text( snapshot.data ) );
          } else {
            return Center(child: CircularProgressIndicator(strokeWidth: 2 ) );
          }
        },
      ),
    );
  }

  Future checkGpsYLocation(BuildContext context) async {
    // PermisoGPS
    final permisoGPS = await Permission.location.isGranted;
    // GPS está activo
    //final gpsActivo = await Geolocator.Geolocator.isLocationServiceEnabled();

    if (permisoGPS){ //&& gpsActivo) {
      Navigator.pushReplacement(
          context, navegarMapaFadeIn(context, MapaPage()));
      return '';
    } else if (!permisoGPS) {
      Navigator.pushReplacement(
          context, navegarMapaFadeIn(context, AccesoGpsPage()));
      return 'Es necesario el permiso de GPS';
    } else {
      return 'Active el GPS';
    }
    //await Future.delayed(Duration(milliseconds: 100));
    //Navigator.pushReplacement(context, navegarMapaFadeIn(context, MapaPage()));
    //Navigator.pushReplacement(context, navegarMapaFadeIn(context, AccesoGpsPage()));
  }
}*/



import 'package:flutter/material.dart';
import 'package:flutter_app_ubicacionusuario/boton/ambulancia.dart';
import 'package:flutter_app_ubicacionusuario/boton/bombero.dart';
import 'package:flutter_app_ubicacionusuario/boton/policia.dart';



void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
   //   home: primeraruta(),
    );
  }
}/*
class primeraruta extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Selecciona tu emergencia'),),
      

      body: Center(
        child: RaisedButton(child: Text('Policia'),
        onPressed: ()
        {
          //vamos a las segunda pagina
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Segundapage()));
        }
        ),
    

    ),

      

      );
  }

   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: primeraruta(),
    );
  }
}*/
class  LoadingPage extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
    child: Scaffold(
      appBar: AppBar(title:Text('Selecciona tu emergencia'),),
      

      body: Align(
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          RaisedButton(
            child: Text("Policia"),
        //  Icon(Icons.local_hospital_sharp),
        onPressed: ()
        {
          //vamos a las segunda pagina
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Policiapage()));
        }
        ),
        RaisedButton(
          
           child: Text("Bombero"),
           
          onPressed: ()
      {
          //vamos a las segunda pagina
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Bomberopage()));
        }
        ),
          RaisedButton(
           child: Text("Ambulancia"),
          onPressed: ()
      {
          //vamos a las segunda pagina
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Ambulanciapage()));
        }
        ),
        ],
          
    

       
        ),
        
     

    ),
      

      

      ),
    );
  }
 /*
@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Ayuda Ciudadana'),
      ),
      body: Center(
        child: Container(
            child: Column(
          children: <Widget>[
            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                print('Click');
              },
              color: Colors.blue,
              child: Text(
                'Bombero',
                style: TextStyle(color: Colors.white),
              ),
            ),

            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                print('Click');
              },
              color: Colors.blue,
              child: Text(
                'Policia',
                style: TextStyle(color: Colors.white),
              ),
            ),

            // ignore: deprecated_member_use
            FlatButton(
              onPressed: () {
                print('Click');
              },
              color: Colors.blue,
              child: Text(
                'Ambulancia',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        )),
      ));
}
*/
//@override
 /* Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          title: const Text("Selecciona tu emergencia"),
          
        ),
        body: SafeArea(
            child: Container(
                child: ListView(
                  children: [
                    const SizedBox(
                      height: 180,
                      
                    ),
                    InkWell(
                       /* onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder:(context)=>Aviso()),
                          );
                        },*/
                        child:  const Card(
                          child: ListTile(
                            leading: Icon(Icons.fire_hydrant),
                            
                            title: Text('Bombero'),
                            
                           // subtitle: Text('Presione para llamar un bombero'),
                           // trailing: Icon(Icons.fire_hydrant),
                          ),
                        )
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                        /*onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder:(context)=> Aviso()),
                          );
                        },*/
                        child:  const Card(
                          child: ListTile(
                            leading: Icon(Icons.local_police_sharp),
                            title: Text('Policia'),
                           // subtitle: Text('Presione para llamar un policia'),
                           // trailing: Icon(Icons.local_police_sharp),
                          ),
                        )
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                       /* onTap: (){
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder:(context)=>const Aviso()),
                          );
                        },*/
                        child:  const Card(
                          child: ListTile(
                            leading: Icon(Icons.local_hospital_sharp),
                            title: Text('Ambulancia'),
                           // subtitle: Text('Presione para llamar una ambulancia'),
                          //  trailing: Icon(Icons.local_hospital_sharp),
                          ),
                        )
                    ),
                    const SizedBox(
                      height: 200,
                    ),

                  ],
                )
            )
        )

    );*/
 
}
 