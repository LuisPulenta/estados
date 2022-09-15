import 'package:estados/controllers/usuario_controller.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';

class Pagina2Screen extends StatelessWidget {
  const Pagina2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print(Get.arguments);
    // print(Get.arguments['nombre']);
    // print(Get.arguments['edad']);

    final usuarioCtrl = Get.find<UsuarioController>();

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
                  usuarioCtrl.cargarUsuario(
                    Usuario(nombre: 'Luis', edad: 57),
                  );
                  Get.snackbar('Usuario agregado', 'Luis se agregó',
                      backgroundColor: Colors.white,
                      boxShadows: [
                        const BoxShadow(
                          color: Colors.orange,
                          blurRadius: 10,
                        )
                      ]);
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Cambiar Edad',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  usuarioCtrl.cambiarEdad(30);
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Añadir Profesión',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  //usuarioCtrl.agregarProfesion('Profesion N° ${usuarioCtrl.usuario.value.profesiones.length + 1}');
                  usuarioCtrl.agregarProfesion(
                      'Profesion N° ${usuarioCtrl.profesionesCount + 1}');
                }),
            MaterialButton(
                color: Colors.blue,
                child: const Text('Cambiar tema',
                    style: TextStyle(color: Colors.white)),
                onPressed: () {
                  Get.changeTheme(
                      Get.isDarkMode ? ThemeData.light() : ThemeData.dark());
                })
          ],
        ),
      ),
    );
  }
}
