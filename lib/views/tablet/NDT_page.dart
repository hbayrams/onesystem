import 'package:flutter/material.dart';
import 'package:dropdown_search/dropdown_search.dart';

class NDTPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(15.0),
      child: DropdownSearch(
        dropdownSearchDecoration: InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide(width: 1)),
            contentPadding: EdgeInsets.all(1)),
        autoValidateMode: AutovalidateMode.always,
        showSearchBox: true,
        items: olustur(),
        label: "Country",
        onChanged: print,
        selectedItem: "Tunisia",
        validator: (String item) {
          if (item == null)
            return "Required field";
          else if (item == "Brazil")
            return "Invalid item";
          else
            return null;
        },
      ),
    );
  }
}

olustur() {
  List<String> deneme = [];
  for (var i = 0; i < 10; i++) {
    deneme.add('000' + i.toString());
  }
  print(deneme.toString());
  return deneme;
}
