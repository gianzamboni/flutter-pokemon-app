  String capitalizeFirstLetter(String _name) {
    return "${_name[0].toUpperCase()}${_name.substring(1).toLowerCase()}";
  }

  String kebabCaseToPrintable(String _name) {
    return _name.split("-").map(capitalizeFirstLetter).join(" ");
  }