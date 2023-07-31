enum Collections {theBeginning}

extension CollectionsExtension on Collections {
  String get getName {
    switch (this) {
      case Collections.theBeginning:
        return "시작 (The Beginning)";
    }
  }
}