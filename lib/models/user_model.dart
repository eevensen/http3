import 'package:flutter_riverpod/flutter_riverpod.dart';

final userProvider = Provider<User>((ref) {
  return User(currentSorting: 'initSorting');
});

class User {
  User({required this.currentSorting});
  final String currentSorting;

  User copyWith({
    String? currentSorting,
  }) {
    return User(
      currentSorting: currentSorting ?? this.currentSorting,
    );
  }
}
