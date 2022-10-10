part of 'user_cubit.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class UsersLoaded extends UserState {
  final User allDatas;
  const UsersLoaded({required this.allDatas});
}
