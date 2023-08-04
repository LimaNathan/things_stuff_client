mixin ValidatorMixin{

 String? combine(List<String? Function()> validators) {
    for (final func in validators) {
      final validation = func();
      if (validation != null) return validation;
    }
    return null;
  }


  String? isNotEmpty(String? value, [String? message]) {
    if (value!.isEmpty) return message ?? 'Este campo é obrigatório';
    return null;
  }


}