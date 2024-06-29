class Verification {
  // something something db....

  // username, password
  List registeredAccounts = [
    ['admin', 'admin'],
    ['admin', 'password']
  ];

  bool isValid(String name, String pass) {
    for (var e in registeredAccounts) {
      if (e[0] == name && e[1] == pass) {
        return true;
      }
    }

    return false;
  }

  bool validUsername(String name){
    return name.length > 8;
  }

  bool validPassword(String pass){
    return pass.length > 8;
  }

  bool validEmail(String email){
    if (email.length < 8){
      return false;
    }
    int l = email.length;
    if (email.substring(l - 4) != ".com"){
      return false;
    }

    return true;
  }
}
