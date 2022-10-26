String cutString(String s) {
  if (s.length > 18) {
    return s.replaceRange(18, s.length, '...');
  } else {
    return s;
  }
}
