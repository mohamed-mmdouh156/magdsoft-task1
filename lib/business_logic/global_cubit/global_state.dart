part of 'global_cubit.dart';

@immutable
abstract class GlobalState {}

class GlobalInitial extends GlobalState {}

class CreateUserLoadingState extends GlobalState {}
class CreateUserSuccessState extends GlobalState {}
class CreateUserErrorState extends GlobalState {}

class GetUserLoadingState extends GlobalState {}
class GetUserSuccessState extends GlobalState {}
class GetUserErrorState extends GlobalState {}