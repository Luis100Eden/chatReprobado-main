import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;
  const MessageFieldBox({super.key, required this.onValue});

  @override
  Widget build(BuildContext context) {
    // final colors = Theme.of(context).colorScheme;
    final focusNode = FocusNode();
    final textControl = TextEditingController();
    final outLineInputBorder = inputBorderCustom();
    final inputDecoration =
        inputDecoradorCustom(outLineInputBorder, textControl);

    void fieldSubmitCustom(textValue) {
      // valor al dar submit
      onValue(textValue);
      textControl.clear();
      focusNode.requestFocus();
    }

    return TextFormField(
      onTapOutside: (event) => focusNode.unfocus(),
      focusNode: focusNode,
      controller: textControl,
      decoration: inputDecoration,
      onFieldSubmitted: fieldSubmitCustom,
      //onChanged: (value) {
      //valores de tecla por tecla
      //},
    );
  }

  UnderlineInputBorder inputBorderCustom() {
    return UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));
  }

  InputDecoration inputDecoradorCustom(UnderlineInputBorder outLineInputBorder,
      TextEditingController textControl) {
    return InputDecoration(
      hintText: 'Termina el mensaje como pregunta ?',
      enabledBorder: outLineInputBorder,
      focusedBorder: outLineInputBorder,
      filled: true,
      suffixIcon: IconButton(
          icon: const Icon(Icons.send_outlined),
          onPressed: () {
            //valor de la caja de texto
            final textValue = textControl.value.text;
            onValue(textValue);
            textControl.clear();
          }),
    );
  }
}
