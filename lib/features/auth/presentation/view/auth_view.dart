import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/screen_size.dart';
import '../../../../core/constants/values_manager.dart';
import '../../../../generated/l10n.dart';
import '../view_model/auth_cubit.dart';
import '../view_model/auth_event.dart';
import '../view_model/auth_state.dart';

class AuthView extends StatelessWidget {
  AuthView({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: .spaceBetween,
          children: [
            Column(
              children: [
                ClipRRect(
                  borderRadius: BorderRadiusGeometry.circular(RadiusSize.r16),
                  child: Image.asset(
                    width: AppSize.s70,
                    height: AppSize.s70,
                    AssetsConst.logo,
                    fit: BoxFit.contain,
                  ),
                ),

                const SizedBox(
                  height: AppSize.s30,
                ),

                Text(
                  S.current.welcomeBack,
                  style: Theme.of(context).textTheme.headlineMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
                Text(
                  S.current.signInToManageYourClasses,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Theme.of(context).colorScheme.onPrimary,
                  ),
                ),
              ],
            ),

            Container(
              height: ScreenSize.height / 1.5,
              width: .infinity,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.onPrimary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(RadiusSize.r16),
                  topRight: Radius.circular(RadiusSize.r16),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppSize.s20),
                child: Column(
                  crossAxisAlignment: .start,
                  children: [
                    const SizedBox(
                      height: AppSize.s30,
                    ),

                    Text(
                      S.current.email,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextField(
                      controller: emailController,
                      decoration: InputDecoration(hintText: S.current.email),
                    ),

                    const SizedBox(
                      height: AppSize.s30,
                    ),

                    Text(
                      S.current.password,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    BlocBuilder<AuthCubit, AuthState>(
                      buildWhen: (previous, current) =>
                          previous.isPasswordVisibale !=
                          current.isPasswordVisibale,
                      builder: (context, state) {
                        return TextField(
                          controller: passwordController,
                          obscureText: state.isPasswordVisibale,
                          obscuringCharacter: '^',
                          decoration: InputDecoration(
                            hintText: S.current.password,
                            suffixIcon: IconButton(
                              onPressed: () => context
                                  .read<AuthCubit>()
                                  .onEvent(TogglePasswordVisibilityEvent()),
                              icon: state.isPasswordVisibale
                                  ? const Icon(Icons.visibility_outlined)
                                  : const Icon(Icons.visibility_off_outlined),
                            ),
                          ),
                        );
                      },
                    ),

                    const SizedBox(
                      height: AppSize.s30,
                    ),

                    SizedBox(
                      width: .infinity,
                      child: BlocConsumer<AuthCubit, AuthState>(
                        listenWhen: (previous, current) =>
                            previous.signInState != current.signInState,
                        listener: (context, state) {
                          if (state.signInState.data != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text('Sign in successfully'),
                              ),
                            );
                          }

                          if (state.signInState.errorMessage != null) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  state.signInState.errorMessage ?? '',
                                ),
                              ),
                            );
                          }
                        },

                        buildWhen: (previous, current) =>
                            previous.signInState != current.signInState,
                        builder: (context, state) {
                          final isLoading =
                              state.signInState.isLoading ?? false;
                          return ElevatedButton(
                            onPressed: () => context.read<AuthCubit>().onEvent(
                              SignInEvent(
                                email: emailController.text,
                                password: passwordController.text,
                              ),
                            ),
                            child: isLoading
                                ? const CircularProgressIndicator()
                                : Text(S.current.singIn),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
