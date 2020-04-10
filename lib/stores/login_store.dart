import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store{

  @observable
  String email = '';

  @observable
  String password = "";

  @observable
  bool showPassword = false;

  @observable
  bool loading = false;

  @observable
  bool loggedIn = false;

  _LoginStore(){
    autorun((_){
      print(isFormValid);
    });
  }

  @action
  void setEmail(String value) => email = value;
  
  @action
  void toggleShowPassword() => showPassword = !showPassword;
  
  @action
  void setPassword(String value) => password = value;

  @action
  Future<void> login() async{
    loading = true;
    await Future.delayed(Duration(seconds: 2));
    loggedIn= true;
    loading = false;
    email = "";
    password = "";
  }

  @action 
  void logout(){
    loggedIn = false;
  }

  @computed
  bool get isFormValid => email.length > 6 && password.length > 6;

  @computed
  Function get loginPressed =>
    (isFormValid && !loading) ? login : null;


}