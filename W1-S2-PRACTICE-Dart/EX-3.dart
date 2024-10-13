

void main() {
  // List of student scores
  List<int> scores = [45, 67, 82, 49, 51, 78, 92, 30];
  var passScore = scores.where((number) => number >= 50  );
  int itemCount = passScore.length;
  print(passScore.toList());
  print('$itemCount students passed');
}