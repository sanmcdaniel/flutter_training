void main() {
  //implicit
  var a1 = 1234;
  var a2 = '1234';
  var a3 = true;
  a3 = false;

  //explicit
  int b1 = 1234;
  String b2 = '1234';
  bool b3 = true;

  print('$a1, $b1');

  //can't change value run time
  final c1 = 1234;
  //constant complie
  const d1 = 1234;

  //default value is null
  var a11;
  int b11;

  print('$a11, $b11');

  dynamic a = 10;
  a = '111';
  //a.CodeMobiles();

  Object bz = 10;
  bz = '111';
  //bz.CodeMobiles();

  cal(x2: 'sand', x1: 12345);
  cal(x2: 'sand');
  calV2(2, '11');
  calV2(2, 'test');

  var array1 = List(2); //if put number in list, it will be array.
  array1[0] = '1234';
  array1[1] = '1234';
  //array1[2] = '1234';
  //array1.add(1234);

  List<String> list1 = List();
  list1.add('sand');
  list1.add('test');
  list1.add('1234');
  print('Length: ${list1.length}');

  List<int> array4 = const [10, 20, 30]; //array
  List<int> array5 = [10, 20, 30]; //list

  List<int> array6 = [10, 20, 30];
  List<int> array7 = [10, 20, 30];
  List<int> array8 = [10, 20, 30];

  array6
    ..addAll(array7)
    ..removeAt(3)
    ..addAll(array8);
  print('Array 6 Length: ${array6.length}');
}

void cal({int x1, String x2, bool x3 = true}) {}
void calV2([int x1, String x2, bool x3 = true]) {}
