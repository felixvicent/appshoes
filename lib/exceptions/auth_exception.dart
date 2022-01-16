class AuthException implements Exception {
  static const Map<String, String> errors = {
    "EMAIL_EXISTS": 'E-mail já existe',
    "OPERATION_NOT_ALLOWED": 'Operação não permitida',
    "TO_MANY_ATTEMPTS_TRY_LATER": 'Tente mais tarde',
    "EMAIL_NOT_FOUND": 'E-mail não encontrado',
    "INVALID_PASSWORD": 'Senha inválida',
    "USER_DISABLED": 'Usuário desabilitado',
  };

  final String key;

  const AuthException(this.key);

  @override
  String toString() {
    if (errors.containsKey(key)) {
      return errors[key] as String;
    } else {
      return 'Ocorreu um erro inesperado';
    }
  }
}
