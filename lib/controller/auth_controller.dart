import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:n_crypt/service/secure_storage_service.dart';
import '../models/user.dart';
import '../repository/auth_repository.dart';

final userProvider = StateProvider<User?>((ref) => null);

final authControllerProvider = StateNotifierProvider<AuthController, bool>((ref) => AuthController(
    authRepository: ref.watch(authRepositoryProvider),
    ref: ref,
));

class AuthController extends StateNotifier<bool>{
  final AuthRepository _authRepository;
  final Ref _ref;
  AuthController({required AuthRepository authRepository, required Ref ref})
      : _authRepository = authRepository,
        _ref = ref,
        super(false);

  void login({ required String email, required String password, required BuildContext context}) async {
    state = true;
    final User? user = await _authRepository.login(email: email, password: password);
    state = false;
    if(user == null){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Failed to login")));
      return ;
    }
    _ref.read(secureStorageProvider).saveUser(user);
    _ref.read(userProvider.notifier).update((state) => user);
  }

  void signUp(){

  }

}