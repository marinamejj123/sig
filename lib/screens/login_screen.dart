import 'package:flutter/material.dart';
import 'package:flutter_app_ubicacionusuario/services/auth_service.dart';
import 'package:flutter_app_ubicacionusuario/widgets/auth_background.dart';
import 'package:flutter_app_ubicacionusuario/widgets/card_container.dart';
import 'package:provider/provider.dart';
import 'package:flutter_app_ubicacionusuario/providers/providers.dart';
import 'package:flutter_app_ubicacionusuario/services/services.dart';
import 'package:flutter_app_ubicacionusuario/ui/input_decorations.dart';
import 'package:flutter_app_ubicacionusuario/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: AuthBackground(
            child: SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(height: 50),
          CardContainer(
              child: Column(
              children: [
                SizedBox(height: 10),
                Text('Iniciar Sesion',
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 20.0,
                      decorationStyle: TextDecorationStyle.wavy,
                    )),
                SizedBox(height: 30),
                ChangeNotifierProvider(
                    create: (_) => LoginFormProvider(), 
                    child: _LoginForm()
                )
              ],
              ),
          ),
          SizedBox(height: 50),
          Text('No tienes Una Cuenta?',
              style: TextStyle(fontSize: 18, color: Colors.blueGrey)),
          TextButton(
            child: Text('Crear cuenta',
                style: TextStyle(fontSize: 18, color: Colors.blueGrey.shade700)),
            style: ButtonStyle(
                overlayColor:
                    MaterialStateProperty.all(Colors.blueGrey.withOpacity(0.1)),
                shape: MaterialStateProperty.all(StadiumBorder())),
            onPressed: () =>
                Navigator.pushReplacementNamed(context, 'register'),
          ),
          SizedBox(height: 50),
        ],
      ),
    )));
  }
}

class _LoginForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loginForm = Provider.of<LoginFormProvider>(context);
    return Container(
      child: Form(
        key: loginForm.formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
              autocorrect: false,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecorations.authInputDecoration(
                  hintText: 'uagrm@gmail.com',
                  labelText: 'Correo Electronico',
                  prefixIcon: Icons.alternate_email_rounded
              ),   
              onChanged: ( value ) => loginForm.email = value,
              validator: ( value ) {
                  String pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                  RegExp regExp  = new RegExp(pattern);
                  return regExp.hasMatch(value ?? '')
                    ? null
                    : 'El valor ingresado no luce como un correo';
              },   
            ),
            SizedBox(height: 30),
            TextFormField(
              style: TextStyle(fontSize: 15.0, color: Colors.blueGrey),
              autocorrect: false,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              decoration: InputDecorations.authInputDecoration(
                hintText: '*****',
                labelText: 'Contraseña',
                prefixIcon: Icons.lock_outline,
              ),
              onChanged: ( value ) => loginForm.password = value,
              validator: ( value ) {
                  return ( value != null && value.length >= 6 ) 
                    ? null
                    : 'La contraseña debe de ser de 6 caracteres';                                    
                  
              },
            ),
            SizedBox(height: 30),
            MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                disabledColor: Colors.grey,
                elevation: 0,
                color: Colors.blueGrey,
                child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    child: Text(
                      loginForm.isLoading 
                        ? 'Espere'
                        : 'Ingresar',
                      style: TextStyle( color: Colors.white ),
                    )
                ),
                onPressed: loginForm.isLoading ? null : () async {                
                  FocusScope.of(context).unfocus();
                  final authService = Provider.of<AuthService>(context, listen: false);                
                  if( !loginForm.isValidForm() ) return;
                  loginForm.isLoading = true;
                  // TODO: validar si el login es correcto
                  final String errorMessage = await authService.login(loginForm.email, loginForm.password);
                  if ( errorMessage == null ) {
                    Navigator.pushReplacementNamed(context, 'loading');
                  } else {
                    // TODO: mostrar error en pantalla
                    print( errorMessage );
                    //NotificationsService.showSnackbar(errorMessage);
                    loginForm.isLoading = false;
                  }
              }
            )
          ],
        ),
      ),
    );
  }
}
