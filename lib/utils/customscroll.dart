import 'package:flutter/material.dart';
import 'package:flutter/physics.dart';

class CustomBounceScroll extends BouncingScrollPhysics {
  const CustomBounceScroll({ScrollPhysics? parent}) : super(parent: parent);

  @override
  SpringDescription get spring => SpringDescription(
        mass: 200,
        stiffness: 400,
        damping: 0.4,
      );
}
