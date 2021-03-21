import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'home/home.dart';

void main() {
  runApp(
    ProviderScope(
      child: Home(),
    ),
  );
}
