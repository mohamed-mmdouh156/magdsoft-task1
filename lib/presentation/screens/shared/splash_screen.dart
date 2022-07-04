import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/router/app_router.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer ;

  _startDelay()
  {
    _timer = Timer(const Duration(seconds: 4), _goNext());
  }

  _goNext ()
  {
    Navigator.pushReplacementNamed(context, RoutesManager.loginRoute);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer <GlobalCubit , GlobalState>(
      listener: (context , state) {},
      builder: (context , state) {
        return  Scaffold(
          backgroundColor: AppColor.lightPrimary,
          appBar: AppBar(
            backgroundColor: AppColor.lightPrimary,
            elevation: 0.0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:  [
              Align(
                alignment: AlignmentDirectional.center,
                child: Image(
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.6,
                  image: const AssetImage('assets/images/logo.png'),
                ),
              ),

            ],
          ),
        );
      },
    );
  }
}
