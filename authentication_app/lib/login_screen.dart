import 'package:flutter/material.dart';
import 'common_widgets.dart';
import 'circle_widget.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscureText = true;

  void _login() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      if (_emailController.text == 'elias.lemus@unah.hn' &&
          _passwordController.text == '20202000541') {

        Navigator.pushReplacementNamed(context, '/home', arguments: _emailController.text);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Oh no, tus credenciales son inválidas.'),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 59, 10, 207),
              Color.fromARGB(255, 95, 5, 120),
            ],
          ),
        ),
        child: Column(
          children: [
            const Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(width: 0),
                CircleWidget(
                  letter: 'U',
                  color: Color.fromARGB(255, 240, 220, 3),
                  textColor: Colors.black,
                ),
                const SizedBox(width: 0),
                CircleWidget(
                  letter: 'N',
                  color: Color.fromARGB(177, 213, 16, 16),
                  textColor: Colors.white,
                ),
                const SizedBox(width: 0),
                CircleWidget(
                  letter: 'A',
                  color: Color.fromARGB(255, 148, 148, 148),
                  textColor: Colors.white,
                ),
                const SizedBox(width: 0),
                CircleWidget(
                  letter: 'H',
                  color: Colors.black,
                  textColor: Colors.white,
                ),
              ],
            ),
            const SizedBox(height: 10),
            const Spacer(), // VEERRRR ESTOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOOO
            Padding(
              padding: const EdgeInsets.only(left: 32.0, bottom: 32.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'SanFranciscoDisplay',
                    color: Color.fromARGB(255, 235, 252, 48),
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                padding: const EdgeInsets.all(32.0),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.3),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(60.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10.0,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomTextFormField(
                        labelText: 'Correo electrónico:',
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingresá tu correo electrónico.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 24.0),
                      CustomTextFormField(
                        labelText: 'Contraseña:',
                        controller: _passwordController,
                        obscureText: _obscureText,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Ingresá tu contraseña.';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(height: 48.0),
                      ElevatedButton(
                        onPressed: _login,
                        style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 122, 232, 141),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                          elevation: 12.0,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32.0, vertical: 16.0),
                          child: Text(
                            'Iniciar sesión',
                            style: TextStyle(
                              fontFamily: 'SanFranciscoDisplay',
                              fontSize: 20.0,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 16.0),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/register');
                        },
                        style: TextButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          elevation: 0.0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30.0),
                          ),
                        ),
                        child: Text(
                          'Registrarse',
                          style: TextStyle(
                            fontFamily: 'SanFranciscoDisplay',
                            color: Colors.white,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Spacer(flex: 2), // Espaciado inferior
          ],
        ),
      ),
    );
  }
}