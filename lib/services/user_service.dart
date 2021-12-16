import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UserService extends ChangeNotifier {
  // final String _baseUrl = 'localhost';

  /*Future<String> createUser(String name, String password) async {
    final Map<String, dynamic> authData = {
      'name': name,
      'password': password,
    };

    final url = Uri.https(_baseUrl, '/public/api/login');
    final resp = await http.post(url, body: json.encode(authData));
    final Map<String, dynamic> decodedResp = json.decode(resp.body);
    print(decodedResp);
  } */

  //function to call login post api
  Future<String> login(String email, String password) async {
    var response = await http.post(
        Uri.parse('http://192.168.100.11/SOSUAGRM/public/api/login'),
        body: ({
          'email': email,
          'password': password,
        }));
    //print(response.body);
    return response.body;
  }

  Future<String> register(String name,String email, String password, String cellphone) async {
    var response = await http.post(
        Uri.parse('http://192.168.100.11/SOSUAGRM/public/api/register'),
        body: ({
          'name': name,
          'email' : email,
          'password': password,
          'cellphone': cellphone
        }));
    // print(response.body);
    return response.body;
  }

  Future<String> getdoc() async {
    var response = await http
        .get(Uri.parse('http://192.168.100.11/DocDrive/public/api/getdoc'));

    // print(response.body);
    return response.body;
  }
  /*Future<String> registerUser(String name, String nombre, String ci,
      String telefono, String email, String genero, String password) async {
    var response = await http.post(
        Uri.parse(
            'http://192.168.0.10/GestorDocumento/public/api/registerProcurador'),
        body: ({
          'name': name,
          'nombre': nombre,
          'ci': ci,
          'telefono': telefono,
          'email': email,
          'genero': genero,
          'password': password,
        }));
    // print(response.body);
    return response.body;
  }*/
}
