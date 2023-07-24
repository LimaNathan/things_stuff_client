class EmailCredentialDto {
  final String email;
  final String password;

  EmailCredentialDto(this.email, this.password);

  EmailCredentialDto.empty()
      : email = '',
        password = '';
}
