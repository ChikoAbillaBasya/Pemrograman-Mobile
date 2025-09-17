void main() {
  var halogens = {'fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'};
  print('Halogens: $halogens');

  var names1 = <String>{};
  Set<String> names2 = {}; // This works, too.
  var names3 = {}; // Creates a map, not a set.

  print('names1 (before): $names1');
  print('names2 (before): $names2');
  print('names3 (before): $names3');

  names1.add('Chiko Abilla Basya');
  names1.add('2341720005');

  names2.addAll(['Chiko Abilla Basya', '2341720005']);

  print('names1 (after add): $names1');
  print('names2 (after addAll): $names2');
}