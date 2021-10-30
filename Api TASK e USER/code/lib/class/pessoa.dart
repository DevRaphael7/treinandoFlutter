
class Pessoa {
  final int id;
  final String message;
  final String nome;
  final String email;
  final String token;
  Pessoa({this.id = 0, this.message = "", this.nome = "", this.email = "", this.token = ""});

  // converte o formato JSON para um objeto "Pessoa"
  factory Pessoa.fromJson(Map<String, dynamic> json) {
    return Pessoa(
      id: json['id'] as int,
      message: json['message'] as String,
      nome: json['name'] as String,
      email: json['email'] as String,
      token: json['token'] as String,
    );
  }
}