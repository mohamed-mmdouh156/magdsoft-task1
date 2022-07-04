import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:magdsoft_flutter_structure/business_logic/global_cubit/global_cubit.dart';
import 'package:magdsoft_flutter_structure/presentation/string_manager.dart';
import 'package:magdsoft_flutter_structure/presentation/styles/colors.dart';
import 'package:magdsoft_flutter_structure/presentation/value_manager.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({Key? key}) : super(key: key);

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer <GlobalCubit , GlobalState>(
      listener: (context , state) {},
      builder: (context , state) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: AppColor.primary,
          ),
          body: Padding(
            padding: const EdgeInsets.all(AppSize.s16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    const Text(
                      AppStrings.name,
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: AppSize.s25,
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s4,
                    ),
                    Expanded(
                      child: Text(
                        '${GlobalCubit.get(context).userName}',
                        style: const TextStyle(
                          color: AppColor.primary,
                          fontSize: AppSize.s25,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Row(
                  children: [
                    const Text(
                      AppStrings.email,
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: AppSize.s25,
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s4,
                    ),
                    Expanded(
                      child: Text(
                        '${GlobalCubit.get(context).userEmail}',
                        style: const TextStyle(
                          color: AppColor.primary,
                          fontSize: AppSize.s25,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: AppSize.s12,
                ),
                Row(
                  children: [
                    const Text(
                      AppStrings.phone,
                      style: TextStyle(
                        color: AppColor.primary,
                        fontSize: AppSize.s25,
                      ),
                    ),
                    const SizedBox(
                      width: AppSize.s4,
                    ),
                    Expanded(
                      child: Text(
                        '${GlobalCubit.get(context).userPhone}',
                        style: const TextStyle(
                          color: AppColor.primary,
                          fontSize: AppSize.s25,
                        ),
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
