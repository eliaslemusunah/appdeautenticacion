import 'package:flutter/material.dart';
import 'common_widgets.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  void _register() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (_passwordController.text == _confirmPasswordController.text) {
        print('Nombre: ${_nameController.text}');
        print('Correo: ${_emailController.text}');
        print('Teléfono: ${_phoneController.text}');
        print('Contraseña: ${_passwordController.text}');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'La contraseña y la confirmación no coinciden.',
              style: TextStyle(fontFamily: 'SanFranciscoDisplay'),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 4.0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color.fromARGB(255, 59, 10, 207)),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Registro',
          style: TextStyle(
            color: Color.fromARGB(255, 255, 0, 51),
            fontWeight: FontWeight.bold,
            fontSize: 30.0,
            fontFamily: 'SanFranciscoDisplay',
          ),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 255, 0, 51),
              Color.fromARGB(255, 255, 0, 238),
            ],
          ),
        ),
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                constraints: const BoxConstraints(maxWidth: 600),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.4),
                  borderRadius: BorderRadius.circular(40.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.5),
                      blurRadius: 10.0,
                      spreadRadius: 5.0,
                      offset: const Offset(0, 15),
                    ),
                  ],
                ),
                child: Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(height: 20.0),
                        CustomTextFormField(
                          labelText: 'Nombre:',
                          controller: _nameController,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ingresá tu nombre.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 70.0),
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
                        const SizedBox(height: 70.0),
                        CustomTextFormField(
                          labelText: 'Teléfono:',
                          controller: _phoneController,
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ingresá tu teléfono.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 70.0),
                        CustomTextFormField(
                          labelText: 'Contraseña:',
                          controller: _passwordController,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Ingresá tu contraseña.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 70.0),
                        CustomTextFormField(
                          labelText: 'Confirmar contraseña:',
                          controller: _confirmPasswordController,
                          obscureText: true,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Confirmá tu contraseña.';
                            }
                            return null;
                          },
                        ),
                        const SizedBox(height: 40.0),
                        ElevatedButton(
                          onPressed: _register,
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 122, 232, 141),
                            elevation: 12.0,
                            minimumSize: const Size(200, 50),
                          ),
                          child: const Text(
                            'Registrarse',
                            style: TextStyle(
                              fontSize: 20,
                              fontFamily: 'SanFranciscoDisplay',
                            ),
                          ),
                        ),
                        const SizedBox(height: 20.0),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}