class MyDuration {
  // Private field for storing duration in milliseconds
  final int _milliseconds;

  // Constructor to initialize MyDuration from hours
  MyDuration.fromHours(int hours) : _milliseconds = hours * 60 * 60 * 1000;

  // Constructor to initialize MyDuration from minutes
  MyDuration.fromMinutes(int minutes) : _milliseconds = minutes * 60 * 1000;

  // Constructor to initialize MyDuration from seconds
  MyDuration.fromSeconds(int seconds) : _milliseconds = seconds * 1000;

  // Getter to retrieve the duration in milliseconds
  int get milliseconds => _milliseconds;

  // Overload the > operator to compare two durations
  bool operator >(MyDuration other) {
    return _milliseconds > other._milliseconds;
  }

  // Overload the + operator to add two durations and return a new MyDuration object
  MyDuration operator +(MyDuration other) {
    return MyDuration._fromMilliseconds(_milliseconds + other._milliseconds);
  }

  // Overload the - operator to subtract two durations and return a new MyDuration object
  // If the result is negative, it throws an exception.
  MyDuration operator -(MyDuration other) {
    int result = _milliseconds - other._milliseconds;
    if (result < 0) {
      throw Exception('Duration cannot be negative');
    }
    return MyDuration._fromMilliseconds(result);
  }

  // Private constructor that accepts milliseconds directly
  MyDuration._fromMilliseconds(this._milliseconds);

  // Display the duration in a readable format
  @override
  String toString() {
    int seconds = (_milliseconds / 1000).round();
    int minutes = (seconds / 60).floor();
    seconds = seconds % 60;
    int hours = (minutes / 60).floor();
    minutes = minutes % 60;
    return '$hours hours, $minutes minutes, $seconds seconds';
  }
 }

void main() {
  MyDuration duration1 = MyDuration.fromHours(3); // 3 hours
  MyDuration duration2 = MyDuration.fromMinutes(45); // 45 minutes
  print(duration1 + duration2); // 3 hours, 45 minutes, 0 seconds
  print(duration1>duration2); //true

  try {
    print(duration2 - duration1); // This will throw an exception
  } catch (e) {
    print(e); 
  }
}
