import 'dart:io';

abstract class Vehicle{

  dynamic VehicleNumber;
  String brand;
  String model;

  Vehicle(this.VehicleNumber,this.brand,this.model);

  calculateRent();
}
abstract class Payment{

  void pay();
}

class CarRental implements Payment{
  @override
  Future<void> pay() async {
    await Future.delayed(Duration(seconds: 2));
    print("Payment Done Successful");
  }
}

class Car extends Vehicle with Gps{
  int noofSeats;
  Car(dynamic VehicleNumber,String brand, String model,this.noofSeats): super(VehicleNumber,brand,model);

  @override
  void calculateRent() {
    int total =0;
    int rentperDay = 2000;
    print("Enter the number of Days:");
    int days = int.parse(stdin.readLineSync()!);
    total = rentperDay * days;

    print("total: $total");

  }

  @override
  void getlocation() {
    print("Car in Madurai");
  }
}

class LuxuryCar extends Car with Gps{
  int Extracharges;
  LuxuryCar(super.VehicleNumber, super.brand, super.model, super.noofSeats,this.Extracharges);

  void luxuryRent(){
    int total =0;
    int rentperDay = 2000;
    print("Enter the number of Days:");
    int days = int.parse(stdin.readLineSync()!);
    total = (rentperDay * days) + Extracharges;

    print("total: $total");
  }
}
class Bike extends Vehicle with Gps{
  int Bikecc;
  Bike(dynamic vehicleNumber,String brand, String model,this.Bikecc):super(vehicleNumber,brand,model);

  @override
  void calculateRent() {
    int total =0;
    int rentperDay = 1000;
    print("Enter the number of Days:");
    int days = int.parse(stdin.readLineSync()!);
    total = rentperDay * days;

    print("total: $total");
  }

  @override
  void getlocation() {
    // TODO: implement getlocation
  }
}
mixin Gps{
  void getlocation();
}

Future<void> main() async {

  Vehicle car = Car(2345, "Honda", "City", 7);
  Vehicle bike = Bike(7777, "KTM", "Duke", 150);
  LuxuryCar luxury = LuxuryCar(6666, "BMW", "M2", 4, 1000);
  CarRental obj = CarRental();

  List<Vehicle> vehicles = [];
  vehicles.add(car);
  vehicles.add(bike);
  vehicles.add(luxury);


  print("----Vehicle Rental System----");
  print("--Enter the option--");

  print("1.Bike Rent,2.Car Rent,3.Luxury Car Rent");
  while (true) {
    int option = int.parse(stdin.readLineSync()!);

    switch (option) {
      case 1:
        print("----Bike Rent----");
        print(bike.VehicleNumber);
        print(bike.brand);
        print(bike.model);
        bike.calculateRent();
        await obj.pay();
        break;

      case 2:
        print("----Car Rent----");
        print(car.VehicleNumber);
        print(car.brand);
        print(car.model);
        car.calculateRent();
        await obj.pay();
        break;

      case 3:
        print("----Luxury Car----");
        print(luxury.VehicleNumber);
        print(luxury.brand);
        print(luxury.model);
        luxury.luxuryRent();
        await obj.pay();
        return;
    }
  }
}

