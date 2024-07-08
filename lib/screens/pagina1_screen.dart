import 'package:estados/bloc/usuario/usuario_cubit.dart';
import 'package:estados/models/usuario.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Pagina1Screen extends StatelessWidget {
  const Pagina1Screen({Key? key}) : super(key: key);

  get builder => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pagina 1'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () => context.read<UsuarioCubit>().borrarUsuario(),
          )
        ],
      ),
      body: const BodyScaffold(),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.play_arrow),
        onPressed: () => Navigator.pushNamed(context, 'pagina2'),
      ),
    );
  }
}

//--------------------- BodyScaffold ------------------------
class BodyScaffold extends StatelessWidget {
  const BodyScaffold({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UsuarioCubit, UsuarioState>(builder: (_, state) {
      switch (state.runtimeType) {
        case UsuarioInitial:
          return const Center(
            child: Text('No hay información del usuario'),
          );
        case UsuarioActivo:
          return InformacionUsuario((state as UsuarioActivo).usuario);
        default:
          return const Center(child: Text('Estado no reconocido'));
      }

      // if (state is UsuarioInitial) {
      //   return const Center(
      //     child: Text('No hay información del usuario'),
      //   );
      // } else if (state is UsuarioActivo) {
      //   return InformacionUsuario(state.usuario);
      // } else {
      //   return const Center(child: Text('Estado no reconocido'));
      // }
    });
  }
}

//--------------------- InformacionUsuario ------------------------
class InformacionUsuario extends StatelessWidget {
  final Usuario usuario;
  const InformacionUsuario(this.usuario, {Key? key}) : super(key: key);

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
          ...usuario.profesiones
              .map((profesion) => ListTile(
                    title: Text(profesion),
                  ))
              .toList(),
        ],
      ),
    );
  }
}
