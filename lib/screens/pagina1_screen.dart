import 'package:estados/models/usuario.dart';
import 'package:estados/services/usuario_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final usuarioService = Provider.of<UsuarioService>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              final usuarioService =
                  Provider.of<UsuarioService>(context, listen: false);
              usuarioService.removerUsuario();
            },
            icon: Icon(Icons.exit_to_app),
          ),
        ],
      ),
      body: usuarioService.existeUsuario
          ? InformacionUsuario(usuario: usuarioService.usuario!)
          : const Center(
              child: Text('No hay Usuario seleccionado'),
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

//--------------------- InformacionUsuario ------------------------
class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario({
    Key? key,
    required this.usuario,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('General',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const Divider(
            color: Colors.black,
          ),
          ListTile(title: Text('Nombre: ${usuario.nombre}')),
          ListTile(title: Text('Edad: ${usuario.edad}')),
          const Text('Profesiones',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.bold)),
          const Divider(
            color: Colors.black,
          ),
          //const ListTile(title: Text('Profesión 1: ')),
          ...usuario.profesiones
              .map((profesion) => ListTile(title: Text(profesion)))
              .toList(),
        ],
      ),
    );
  }
}
