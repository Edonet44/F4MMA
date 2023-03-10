import 'dart:convert';

class Person {
  String _name;
  int _age;

  Person(this._name, this._age);

  String get name => _name;
  set name(String name) => _name = name;

  int get age => _age;
  set age(int age) => _age = age;

  void createPerson(List<Person> persons) {
    persons.add(this);
  }

  void updatePerson(List<Person> persons, Person updatedPerson) {
    var index = persons.indexWhere((person) => person.name == this.name);
    if (index != -1) {
      persons[index] = updatedPerson;
    }
  }

  void deletePerson(List<Person> persons) {
    persons.removeWhere((person) => person.name == this.name);
  }

  // Factory method per creare una persona a partire da un oggetto JSON
  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(json['name'], json['age']);
  }

  // Metodo per convertire la persona in un oggetto JSON
  Map<String, dynamic> toJson() => {'name': name, 'age': age};
}

class Employee extends Person {
  String _jobTitle;

  Employee(String name, int age, this._jobTitle) : super(name, age);

  String get jobTitle => _jobTitle;
  set jobTitle(String jobTitle) => _jobTitle = jobTitle;

  void createEmployee(List<Employee> employees) {
    employees.add(this);
  }

  void updateEmployee(List<Employee> employees, Employee updatedEmployee) {
    var index = employees.indexWhere((employee) => employee.name == this.name);
    if (index != -1) {
      employees[index] = updatedEmployee;
    }
  }

  void deleteEmployee(List<Employee> employees) {
    employees.removeWhere((employee) => employee.name == this.name);
  }

  // Factory method per creare un dipendente a partire da un oggetto JSON
  factory Employee.fromJson(Map<String, dynamic> json) {
    return Employee(json['name'], json['age'], json['jobTitle']);
  }

  // Metodo per convertire il dipendente in un oggetto JSON
  Map<String, dynamic> toJson() =>
      {'name': name, 'age': age, 'jobTitle': jobTitle};
}

void main() {
  var persons = <Person>[];
  var employees = <Employee>[];

  var person = Person("Mario Rossi", 35);
  var employee = Employee("Luigi Bianchi", 28, "Programmatore");

  // Utilizzo dei metodi CRUD per la classe Person
  person.createPerson(persons);
  person.updatePerson(persons, Person("Mario Rossi", 40));
  person.deletePerson(persons);

  // Utilizzo dei metodi CRUD per la classe Employee
  employee.createEmployee(employees);
  employee.updateEmployee(employees, Employee("Luigi Bianchi", 30, "Analista"));
  employee.deleteEmployee(employees);

  // Utilizzo dei factory method e dei metodi JSON per creare oggetti e serializzarli in JSON
  var jsonPerson = '{"name": "Giovanni Verdi", "age": 42}';
  var decodedPerson = jsonDecode(jsonPerson);
  var personFromJson = Person.fromJson(decodedPerson);
  print(personFromJson.toJson());
}
