import 'package:doctors/app/widgets/button.dart';
import 'package:doctors/app/widgets/input.dart';
import 'package:doctors/app/widgets/loading.dart';
import 'package:doctors/app/widgets/logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:doctors/app/login/bloc/bloc.dart' as bloc;
import 'package:flutter_modular/flutter_modular.dart'
    hide ModularWatchExtension;

class LogIn extends StatelessWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => bloc.Bloc(),
      child: BlocListener<bloc.Bloc, bloc.State>(
        listener: (context, state) {
          if (state is bloc.SendingState) {
            Loading.show(context);
          }

          if (state is bloc.SendedState) {
            Navigator.pop(context);
            final credential = state.model.userCredential;
            print(credential);
            Modular.to.pushReplacementNamed(
              '/home',
            );
          }

          if (state is bloc.FailureState) {
            Modular.to.pop();
          }
        },
        child: const _Content(),
      ),
    );
  }
}

class _Content extends StatelessWidget {
  const _Content();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: SizedBox(
            height: MediaQuery.of(context).size.height * 0.9,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 48.0),
                const Logo(),
                const SizedBox(height: 36.0),
                _Form(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Form extends StatefulWidget {
  @override
  __FormState createState() => __FormState();
}

class __FormState extends State<_Form> {
  final emailCtrl = TextEditingController();
  final passCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(top: 10),
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Column(
          children: <Widget>[
            CustomInput(
              icon: Icons.mail_outline,
              isPassword: false,
              placeholder: 'Correo',
              keyboardType: TextInputType.emailAddress,
              textController: emailCtrl,
            ),
            const SizedBox(height: 16.0),
            CustomInput(
              icon: Icons.lock_outline,
              keyboardType: TextInputType.text,
              placeholder: 'Contraseña',
              textController: passCtrl,
              isPassword: true,
            ),
            const SizedBox(height: 48.0),
            Button(
              label: 'Ingrese',
              onTap: () {
                if (emailCtrl.text.isEmpty || passCtrl.text.isEmpty) {
                  return;
                }
                context.read<bloc.Bloc>().add(
                      bloc.SendEvent(
                        email: emailCtrl.text,
                        password: passCtrl.text,
                      ),
                    );
              },
            )
          ],
        ));
  }
}
