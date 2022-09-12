import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina2Screen extends StatelessWidget {
  const Pagina2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(usuarioService.existeUsuario
            ? usuarioService.usuario!.nombre
            : ('Pagina 2')),
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
                  usuarioService.usuario = newUser;
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Cambiar Edad',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  if (usuarioService.usuario != null) {
                    usuarioService.cambiarEdad(30);
                  }
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Añadir Profesión',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  usuarioService.agregarProfesion();
                })
          ],
        ),
      ),
    );
  }
}
