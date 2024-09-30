class ISugget {
  final String text;

  ISugget(this.text);

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ISugget && other.text == text;
  }

  @override
  int get hashCode => text.hashCode;
}
