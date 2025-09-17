void main() {
  // Langkah 1
  var list = [1, 2, 3];
  var list2 = [0, ...list];
  print(list);
  print(list2);
  print(list2.length);

  // Langkah 3
  var list1 = [1, 2, null];
  print(list1);
  var list3 = [0, ...?list1];
  print(list3.length);

  var nim = ['2', '3', '4', '1', '7', '2', '0', '0', '0', '5'];
  var listWithNIM = ['NIM:', ...nim];
  
  // Langkah 4
  print('List with NIM: $listWithNIM');
  bool promoActive = true;
  var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print('Nav (promo true): $nav');

  promoActive = false;
  nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];
  print('Nav (promo false): $nav');

  // Langkah 5
  String login = 'Manager';
  var nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print('Nav2 (login Manager): $nav2');

  login = 'Employee';
  nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print('Nav2 (login Employee): $nav2');

  login = 'Guest';
  nav2 = ['Home', 'Furniture', 'Plants', if (login case 'Manager') 'Inventory'];
  print('Nav2 (login Guest): $nav2');

  // Langkah 6
  var listOfInts = [1, 2, 3];
  var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
  assert(listOfStrings[1] == '#1');
  print('listOfStrings: $listOfStrings');
}