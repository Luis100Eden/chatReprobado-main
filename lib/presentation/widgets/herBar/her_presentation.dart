import 'package:flutter/material.dart';

class HerPresentation extends StatelessWidget implements PreferredSizeWidget {
  final String nombre;
  final String urlAvatar;

  const HerPresentation({
    super.key,
    this.nombre = 'Respuesta',
    this.urlAvatar =
        'https://i.pinimg.com/originals/82/8f/88/828f8891567c2037bd398f380fffd22d.jpg',
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: Padding(
        padding: const EdgeInsets.all(4.0),
        child: CircleAvatar(
          backgroundImage: NetworkImage(urlAvatar),
        ),
      ),
      title: Text(nombre),
      centerTitle: false,
    );
  }

  @override
  // ignore: todo
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
