enum Skill { FLUTTER, DART, OTHER }

class Address {
  String street;
  String city;
  String zipCode;

  Address(this.street, this.city, this.zipCode);

  String get fullAddress => '$street, $city, $zipCode';
}

class Employee {
  String _name;
  double _baseSalary;
  List<Skill> _skills;
  Address _address;
  int _yearsOfExperience;

  Employee(this._name, this._baseSalary, this._skills, this._address, this._yearsOfExperience);

  // Named constructor for Mobile Developer with default skills FLUTTER and DART
  Employee.mobileDeveloper(String name, double baseSalary, Address address, int yearsOfExperience)
      : this(name, baseSalary, [Skill.FLUTTER, Skill.DART], address, yearsOfExperience);

  // Getters
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => _skills;
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  // Compute salary
  double computeSalary() {
    double salary = 40000.0 + (2000.0 * _yearsOfExperience);

    // Add bonuses for each skill
    for (Skill skill in _skills) {
      switch (skill) {
        case Skill.FLUTTER:
          salary += 5000;
          break;
        case Skill.DART:
          salary += 3000;
          break;
        case Skill.OTHER:
          salary += 1000;
          break;
      }
    }

    return salary;
  }

  // Print employee details
  void printDetails() {
    print('Employee: $_name');
    print('Base Salary: \$${_baseSalary.toStringAsFixed(2)}');
    print('Address: ${_address.fullAddress}');
    print('Years of Experience: $_yearsOfExperience');
    print('Skills: ${_skills.map((s) => s.toString().split('.').last).join(', ')}');
    print('Computed Salary: \$${computeSalary().toStringAsFixed(2)}');
  }
}

void main() {
  Address address1 = Address('123 Main St', 'Phnom Penh', '12345');
  Employee emp1 = Employee('Sokea', 40000, [Skill.FLUTTER, Skill.OTHER], address1, 5);
  emp1.printDetails();

  Address address2 = Address('456 Elm St', 'Siem Reap', '54321');
  Employee emp2 = Employee.mobileDeveloper('Ronan', 45000, address2, 3);
  emp2.printDetails();
}
