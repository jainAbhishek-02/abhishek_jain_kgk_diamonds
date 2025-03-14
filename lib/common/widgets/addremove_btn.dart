import 'package:flutter/material.dart';

class AddRemoveBtn extends StatelessWidget {
  const AddRemoveBtn({super.key, this.onTap, this.isAdded = false});

  final void Function()? onTap;
  final bool isAdded;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: AnimatedContainer(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
        duration: Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: isAdded ? Colors.redAccent[100] : Colors.greenAccent,
          border: Border.all(color: isAdded ? Colors.red : Colors.green),
        ),
        child: isAdded ? Text("Remove") : Text("Add"),
      ),
    );
  }
}
