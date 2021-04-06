import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http3/models/user_model.dart';

final userControllerProvider = StateNotifierProvider<UserController>((ref) {
  final user = ref.watch(userProvider);
  return UserController(user);
});

class UserController extends StateNotifier<User> {
  UserController(User state) : super(state);

  updateSorting(String newSorting) {
    return state = state.copyWith(currentSorting: newSorting);
  }
}
