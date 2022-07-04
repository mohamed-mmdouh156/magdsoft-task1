import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/string_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/value_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_button.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/default_formField.dart';
import 'package:magdsoft_flutter_structure/presentation/widget/password_formField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var formKey = GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <GlobalCubit ,GlobalState>(
      listener: (context , state) {},
      builder: (context , state) {
        return Scaffold(
          backgroundColor: AppColor.primary,
          body: Container(
            width: double.infinity,
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.08,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: AppPadding.p12),
                  child: Column(
                    children: [
                      Align(
                        alignment: AlignmentDirectional.centerEnd,
                        child: Container(
                          height: 30,
                          width: 70,
                          decoration: BoxDecoration(
                            color: AppColor.white,
                            borderRadius: BorderRadius.circular(AppSize.s12),
                          ),
                          child: MaterialButton(
                            elevation: 0.0,
                            onPressed: (){},
                            child: const Text(
                              AppStrings.arabic,
                              style: TextStyle(
                                color: AppColor.primary,
                              ),
                            ),
                          ),
                        ),
                      ),
                      const Image(
                        image: AssetImage('assets/images/flutter.png'),),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 1,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(AppSize.s40),
                        topRight: Radius.circular(AppSize.s40),
                      ),
                    ),
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p22),
                        child: Form(
                          key: formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.15,
                              ),
                              DefaultFormField(
                                controller: emailController,
                                label: 'Email',
                                prefixIcon: Icons.email,
                                textInputType: TextInputType.emailAddress,
                                textValidator: 'Please enter your email',
                              ),
                              const SizedBox(
                                height: AppSize.s12,
                              ),
                              PasswordFormField(
                                label: 'Password',
                                textInputType: TextInputType.text,
                                controller: passwordController,
                                textValidator: 'Please entre your password',
                                prefixIcon: Icons.lock,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  DefaultButton(
                                    text: AppStrings.login,
                                    onClick: (){
                                      if(formKey.currentState!.validate())
                                      {
                                        GlobalCubit.get(context).getUser(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          context: context,
                                        );
                                      }
                                    },
                                    width: 160,
                                  ),
                                  DefaultButton(
                                    text: AppStrings.register,
                                    onClick: (){
                                      Navigator.pushReplacementNamed(context, RoutesManager.registerRoute);
                                    },
                                    width: 160,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
