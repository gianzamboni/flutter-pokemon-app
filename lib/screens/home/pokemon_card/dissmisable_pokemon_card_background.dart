import 'package:flutter/material.dart';

class DismissablePokemonCardBackground extends StatelessWidget {
  final Alignment alignment;

  const DismissablePokemonCardBackground({
    super.key,
    this.alignment = Alignment.centerLeft,
  });
  
  @override
  Widget build(BuildContext context) {
    
    final padding = alignment == Alignment.centerLeft ? const EdgeInsets.only(left: 32.0) : const EdgeInsets.only(right: 32.0);
    final borderRadius = alignment == Alignment.centerLeft ? const BorderRadius.only(
      topLeft: Radius.circular(8),
      bottomLeft: Radius.circular(8),
    ) : const BorderRadius.only(
      topRight: Radius.circular(8),
      bottomRight: Radius.circular(8),
    );  

    return Container(
        decoration: BoxDecoration(
          color: Colors.red,
          borderRadius: borderRadius,
        ),
        padding: padding,
        child: Align(
          alignment: alignment,
          child: Icon(Icons.delete, color: Colors.white, size: 32,),
        ),
    );
  }
}
