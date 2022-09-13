import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina2Screen extends StatelessWidget {
  const Pagina2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioCubit = context.read<UsuarioCubit>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 2'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MaterialButton(
                color: Colors.blue,
                child: const Text('Establecer Usuario',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  final newUser = Usuario(
                      nombre: 'Luis',
                      edad: 57,
                      profesiones: [
                        'Hincha de la T',
                        'Programador en Flutter'
                      ]);
                  usuarioCubit.seleccionarUsuario(newUser);
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Cambiar Edad',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  usuarioCubit.cambiarEdad(30);
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Añadir Profesión',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  usuarioCubit.agregarProfesion();
                })
          ],
        ),
      ),
    );
  }
}
