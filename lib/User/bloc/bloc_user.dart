import 'package:flutter_app/User/repository/auth_repository.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';


class UserBloc implements Bloc{

  final _auth_repository = AuthRepository();
  //Caso Uso
  //1. SignIn a la aplicacion Google




  @override
  void dispose() {
    // TODO: implement dispose
  }

}