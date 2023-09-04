import 'package:eventbus/eventbus.dart';
import 'package:flutter/material.dart';
import 'package:login/domain/entities/user_entity.dart';
import 'package:login/presentation/bloc/login_bloc.dart';
import 'package:login/presentation/bloc/login_event.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login/presentation/bloc/login_state.dart';
import 'package:micro_core/micro_core.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc bloc = GetIt.I.get<LoginBloc>();

  final _userNameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    bloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        centerTitle: true,
      ),
      body: BlocBuilder<LoginBloc, LoginState>(
          bloc: bloc,
          builder: (context, state) {
            if (state is LoginSuccessState) {
              WidgetsBinding.instance!.addPostFrameCallback((_) {
                EventBus.emit('Usuário Logou!');
                navigatorKey.currentState?.pushReplacementNamed('/home');
              });
            }

            return Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const SizedBox(height: 100),
                  TextField(
                    controller: _userNameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Usuário'),
                    ),
                  ),
                  const SizedBox(height: 15),
                  TextField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text('Senha'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed:
                          state is LoginLoadingState ? null : _submitLogin,
                      style: ButtonStyle(
                          padding: MaterialStateProperty.all(
                              const EdgeInsets.all(15))),
                      child: state is LoginLoadingState
                          ? const SizedBox(
                              width: 20,
                              height: 20,
                              child: CircularProgressIndicator())
                          : const Text('Entrar'),
                    ),
                  ),
                  const SizedBox(height: 20),
                  if (state is LoginErrorState)
                    Text(
                      state.errorMessage,
                      style: const TextStyle(color: Colors.red),
                    )
                ],
              ),
            );
          }),
    );
  }

  void _submitLogin() {
    var userEntity = UserEntity(
      userName: _userNameController.text,
      password: _passwordController.text,
    );
    bloc.add(SubmitLoginEvent(userEntity: userEntity));
  }
}
