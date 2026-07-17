import 'package:flutter/material.dart';

import '../../../../core/constants/screen_size.dart';
import '../../../../core/constants/values_manager.dart';
import '../../../../generated/l10n.dart';

class AuthView extends StatelessWidget {
  const AuthView({super.key});

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
                      decoration: InputDecoration(hintText: S.current.email),
                    ),

                    const SizedBox(
                      height: AppSize.s30,
                    ),

                    Text(
                      S.current.password,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    TextField(
                      decoration: InputDecoration(
                        hintText: S.current.password,
                        suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_outlined),
                        ),
                      ),
                    ),

                    const SizedBox(
                      height: AppSize.s30,
                    ),

                    SizedBox(
                      width: .infinity,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(S.current.singIn),
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
