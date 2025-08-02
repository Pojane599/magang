class Validator {
  /// Validasi Nama → hanya huruf & spasi, minimal 3
  static String? validateName(String name) {
    if (name.isEmpty) {
      return "Nama tidak boleh kosong";
    }
    if (name.length < 3) {
      return "Nama minimal 3 karakter";
    }
    final regex = RegExp(r"^[a-zA-Z\s]+$");
    if (!regex.hasMatch(name)) {
      return "Nama hanya boleh huruf dan spasi";
    }
    return null; // valid
  }

  /// Validasi Email
  static String? validateEmail(String email) {
    if (email.isEmpty) {
      return "Email tidak boleh kosong";
    }
    final regex = RegExp(r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$");
    if (!regex.hasMatch(email)) {
      return "Format email tidak valid";
    }
    return null; // valid
  }

  /// Validasi Password → Min 8 karakter, ada huruf besar, kecil, angka, simbol
  static String? validatePassword(String password) {
    if (password.isEmpty) {
      return "Password tidak boleh kosong";
    }
    if (password.length < 8) {
      return "Password minimal 8 karakter";
    }
    if (!RegExp(r'[A-Z]').hasMatch(password)) {
      return "Password harus ada huruf besar";
    }
    if (!RegExp(r'[a-z]').hasMatch(password)) {
      return "Password harus ada huruf kecil";
    }
    if (!RegExp(r'[0-9]').hasMatch(password)) {
      return "Password harus ada angka";
    }
    if (!RegExp(r'[!@#\$&*~]').hasMatch(password)) {
      return "Password harus ada simbol (!@#\$&*~)";
    }
    return null; // valid
  }
}
