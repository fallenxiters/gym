import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'animated_pulse_icon.dart';

Widget buildNumericTextField(
  String label,
  TextEditingController controller,
  String errorMessage,
  List<GlobalKey<FormFieldState>> fieldKeys,
  bool showErrorIcon,
) {
  final fieldKey = GlobalKey<FormFieldState>();
  fieldKeys.add(fieldKey);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            key: fieldKey,
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                fontFamily: 'GFFDevanagari',
                color: Colors.white70,
                fontSize: 18,
              ),
              floatingLabelStyle: TextStyle(
                fontFamily: 'GFFDevanagari',
                color: Colors.white,
                fontSize: 18,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontFamily: 'GFFDevanagari',
              color: Colors.white,
              fontSize: 18,
            ),
            onSaved: (value) => controller.text = value!,
            validator: (value) {
              if (value == null || value.isEmpty || int.tryParse(value) == null) {
                return errorMessage;
              }
              return null;
            },
          ),
        ),
        SizedBox(width: 8),
        if (showErrorIcon && controller.text.isEmpty) AnimatedPulseIcon(),
      ],
    ),
  );
}

Widget buildHeightTextField(
  String label,
  TextEditingController controller,
  List<GlobalKey<FormFieldState>> fieldKeys,
  bool showErrorIcon,
) {
  final fieldKey = GlobalKey<FormFieldState>();
  fieldKeys.add(fieldKey);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
          child: TextFormField(
            key: fieldKey,
            controller: controller,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                fontFamily: 'GFFDevanagari',
                color: Colors.white70,
                fontSize: 18,
              ),
              floatingLabelStyle: TextStyle(
                fontFamily: 'GFFDevanagari',
                color: Colors.white,
                fontSize: 18,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            keyboardType: TextInputType.number,
            style: TextStyle(
              fontFamily: 'GFFDevanagari',
              color: Colors.white,
              fontSize: 18,
            ),
            inputFormatters: [
              FilteringTextInputFormatter.allow(RegExp(r'[0-9.,]')),
              TextInputFormatter.withFunction(
                (oldValue, newValue) {
                  final text = newValue.text.replaceAll(',', '.');
                  if (double.tryParse(text) != null && double.parse(text) > 2.50) {
                    return oldValue;
                  }
                  if (text.length == 1 && int.tryParse(text) != null) {
                    return TextEditingValue(
                      text: '$text,',
                      selection: TextSelection.collapsed(offset: 2),
                    );
                  }
                  return newValue;
                },
              ),
            ],
            onSaved: (value) => controller.text = value!,
            validator: (value) {
              final altura = value?.replaceAll(',', '.');
              if (altura == null || altura.isEmpty || double.tryParse(altura) == null || double.parse(altura) > 2.50) {
                return 'Altura inválida. Máximo permitido é 2,50 metros.';
              }
              return null;
            },
          ),
        ),
        SizedBox(width: 8),
        if (showErrorIcon && controller.text.isEmpty) AnimatedPulseIcon(),
      ],
    ),
  );
}

Widget buildDropdownField(
  String label,
  List<String> items,
  String? currentValue,
  Function(String?) onChanged,
  List<GlobalKey<FormFieldState>> fieldKeys,
  bool showErrorIcon,
) {
  final fieldKey = GlobalKey<FormFieldState>();
  fieldKeys.add(fieldKey);

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Expanded(
          child: DropdownButtonFormField<String>(
            key: fieldKey,
            value: currentValue,
            decoration: InputDecoration(
              labelText: label,
              labelStyle: TextStyle(
                fontFamily: 'GFFDevanagari',
                color: Colors.white70,
                fontSize: 18,
              ),
              floatingLabelStyle: TextStyle(
                fontFamily: 'GFFDevanagari',
                color: Colors.white,
                fontSize: 18,
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1),
                borderRadius: BorderRadius.circular(8.0),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 1.5),
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            dropdownColor: Colors.grey[800],
            style: TextStyle(
              fontFamily: 'GFFDevanagari',
              color: Colors.white,
              fontSize: 18,
            ),
            items: items.map((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    fontFamily: 'GFFDevanagari',
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              onChanged(value);
            },
            validator: (value) {
              if (value == null) {
                return 'Por favor, selecione $label';
              }
              return null;
            },
          ),
        ),
        SizedBox(width: 8),
        if (showErrorIcon && (currentValue == null || currentValue.isEmpty)) AnimatedPulseIcon(),
      ],
    ),
  );
}
