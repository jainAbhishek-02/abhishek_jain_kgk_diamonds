import 'package:flutter/material.dart';

class AscDescBtn extends StatelessWidget {
  const AscDescBtn({
    super.key,
    required this.isSelected,
    required this.text,
    this.onTap,
  });

  final bool? isSelected;
  final String text;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: CircleAvatar(
          backgroundColor:
              isSelected == null
                  ? Colors.grey[200]
                  : isSelected!
                  ? Colors.lightBlueAccent
                  : Colors.grey[200],
          child: Text(text, style: TextStyle(fontSize: 13)),
        ),
      ),
    );
  }
}
