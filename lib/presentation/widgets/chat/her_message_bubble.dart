import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  final String message;
  final String? urlGif;
  const HerMessageBubble({super.key, this.message='',  this.urlGif});

  @override
  Widget build(BuildContext context) {
    // buscar el tema del contexto
    final colors = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          // height: 10,
          // width: 10,
          decoration: BoxDecoration(
              color: Colors.lightGreenAccent, borderRadius: BorderRadius.circular(20)),
          child:  Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(message,
              style: const TextStyle(color: Colors.black),
            ),
          ),
        ),
        const SizedBox(height: 5),
        _ImageBubble(urlGif: urlGif),
        const SizedBox(height: 10),
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
    final String? urlGif;

  const _ImageBubble({ this.urlGif});
  @override
  Widget build(BuildContext context) {
    // return const Placeholder();
    final size = MediaQuery.of(context).size;
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network(urlGif!,
        width: size.width * 0.7,
        height: 150,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) =>
            (loadingProgress == null)
                ? child
                : Container(
                    width: size.width * 0.8,
                    height: 160,
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: const Text('cargando la imagen...'),
                  ),
      ),
    );
  }
}
