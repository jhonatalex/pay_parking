class User {
  String name = "";
  String password = "";
  String email = "";

  User(this.name, this.password, this.email);

  void printName() {
    print("Hola soy $name");
  }
}
