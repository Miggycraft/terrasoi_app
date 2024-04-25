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
}
