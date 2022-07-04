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
import 'package:magdsoft_flutter_structure/presentation/widget/toast.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {

  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();
  var formKey = GlobalKey <FormState>();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <GlobalCubit, GlobalState> (
      listener: (context , state) {},
      builder: (context , state) {
        return Scaffold(
          backgroundColor: AppColor.primary,
          body: Container(
            width: double.infinity,
            child: Column(
              children: [
                const Image(
                  image: AssetImage('assets/images/flutter.png'),),
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
                                height: MediaQuery.of(context).size.height * 0.08,
                              ),
                              DefaultFormField(
                                controller: nameController,
                                label: 'FullName',
                                prefixIcon: Icons.person,
                                textInputType: TextInputType.text,
                                textValidator: 'Please enter your FullName',
                              ),
                              const SizedBox(
                                height: AppSize.s12,
                              ),
                              DefaultFormField(
                                controller: phoneController,
                                label: 'Phone',
                                prefixIcon: Icons.phone,
                                textInputType: TextInputType.phone,
                                textValidator: 'Please enter your Phone',
                              ),
                              const SizedBox(
                                height: AppSize.s12,
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
                              const SizedBox(
                                height: AppSize.s12,
                              ),
                              PasswordFormField(
                                label: 'Confirm Password',
                                textInputType: TextInputType.text,
                                controller: confirmPasswordController,
                                textValidator: 'Please entre your password',
                                prefixIcon: Icons.lock,
                              ),
                              SizedBox(
                                height: MediaQuery.of(context).size.height * 0.08,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  DefaultButton(
                                    text: AppStrings.login,
                                    onClick: (){
                                      Navigator.pushReplacementNamed(context, RoutesManager.loginRoute);
                                    },
                                    width: 160,
                                  ),
                                  DefaultButton(
                                    text: AppStrings.register,
                                    onClick: (){
                                      if(formKey.currentState!.validate())
                                        {
                                          if(passwordController.text == confirmPasswordController.text)
                                            {
                                              GlobalCubit.get(context).createUser(
                                                fullName: nameController.text,
                                                email: emailController.text,
                                                phone: phoneController.text,
                                                password: passwordController.text,
                                              );
                                            }else{
                                            showToast('password not match');
                                          }

                                        }
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
