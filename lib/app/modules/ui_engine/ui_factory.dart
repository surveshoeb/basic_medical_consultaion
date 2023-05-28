class UIFactory {
  static final UIFactory _instance = UIFactory._internal();

  UIFactory._internal();

  factory UIFactory() {
    return _instance;
  }
}
