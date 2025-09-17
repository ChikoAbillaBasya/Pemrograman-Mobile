void main() {
  var gifts = {
    // Key:    Value
    'first': 'partridge',
    'second': 'turtledoves',
    'fifth': 1
  };

  var nobleGases = {
    2: 'helium',
    10: 'neon',
    18: 2,
  };

  print('Initial gifts: $gifts');
  print('Initial nobleGases: $nobleGases');

  var mhs1 = Map<String, String>();
  gifts['first'] = 'partridge';
  gifts['second'] = 'turtledoves';
  gifts['fifth'] = 'golden rings';

  var mhs2 = Map<int, String>();
  nobleGases[2] = 'helium';
  nobleGases[10] = 'neon';
  nobleGases[18] = 'argon';

  gifts['name'] = 'Chiko Abilla Basya';
  gifts['nim'] = '2341720005';

  nobleGases[1] = 'Chiko Abilla Basya';
  nobleGases[3] = '2341720005';

  mhs1['name'] = 'Chiko Abilla Basya';
  mhs1['nim'] = '2341720005';

  mhs2[1] = 'Chiko Abilla Basya';
  mhs2[2] = '2341720005';

  print('gifts after modifications: $gifts');
  print('nobleGases after modifications: $nobleGases');
  print('mhs1: $mhs1');
  print('mhs2: $mhs2');
}