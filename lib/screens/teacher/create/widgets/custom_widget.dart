import 'package:flutter/material.dart';

Widget buildDropdown({
  required String hint,
  required String? value,
  required List<String> items,
  required ValueChanged<String?> onChanged,
}) {
  // Vérifiez l'unicité des valeurs dans items
  final uniqueItems = items.toSet().toList();
  if (items.length != uniqueItems.length) {
    throw ArgumentError('Dropdown items should have unique values.');
  }

  // Assurez-vous que la valeur fournie est dans la liste des éléments
  String? validValue;
  if (value != null && uniqueItems.contains(value)) {
    validValue = value;
  } else {
    // Définir une valeur par défaut si aucune valeur valide n'est fournie
    validValue = uniqueItems.isNotEmpty ? uniqueItems.first : null;
  }

  return DropdownButtonFormField<String>(
    decoration: InputDecoration(
      filled: true,
      fillColor: Colors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
    ),
    hint: Text(hint),
    value: validValue,
    items: uniqueItems.map((item) {
      return DropdownMenuItem(
        value: item,
        child: Text(item),
      );
    }).toList(),
    onChanged: onChanged,
  );
}

Widget buildMultiSelectChip({
  required String title,
  required List<String> items,
  required List<String> selectedItems,
  required Function(List<String>) onSelectionChanged,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      const SizedBox(height: 8),
      Wrap(
        spacing: 8.0,
        children: items.map((item) {
          final isSelected = selectedItems.contains(item);
          return ChoiceChip(
            label: Text(item),
            selected: isSelected,
            selectedColor: Colors.red.shade100, // Selected color
            backgroundColor: Colors.grey.shade300, // Unselected color
            onSelected: (selected) {
              if (selected) {
                selectedItems.add(item);
              } else {
                selectedItems.remove(item);
              }
              onSelectionChanged(selectedItems);
            },
          );
        }).toList(),
      ),
    ],
  );
}
