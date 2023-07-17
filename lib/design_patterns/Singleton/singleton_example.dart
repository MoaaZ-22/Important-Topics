import 'package:flutter/material.dart';

class SingletonExample {
  /// Instance of SingletonExample Class
  /// instance mean Object from it SingletonExample singleton1 = SingletonExample;
  static SingletonExample? _instance;

  /// To ensure that class cannot create instance from it
  /// And Make Private Constructor cannot use it out side class
  SingletonExample._internal(){
   debugPrint('Private Constructor');
  }

  static getInstance() {
    /// create instance if it null
    _instance ??= SingletonExample._internal();
    return _instance;
  }
}

class SingletonExample1 {
  /// Instance of SingletonExample Class
  /// instance mean Object from it SingletonExample singleton1 = SingletonExample;
  static SingletonExample1? _instance;

  /// To ensure that class cannot create instance from it
  /// And Make Private Constructor cannot use it out side class
  SingletonExample1._internal(){
    debugPrint('Private Constructor With Factory');
  }

     /// With Factory
  factory SingletonExample1(){
    /// create instance if it null
    _instance ??= SingletonExample1._internal();
    return  _instance!;
  }
}


class SingletonExample2 {
  /// Instance of SingletonExample Class
  /// instance mean Object from it SingletonExample singleton1 = SingletonExample;
  static SingletonExample2? _instance;

  /// To ensure that class cannot create instance from it
  /// And Make Private Constructor cannot use it out side class
  SingletonExample2._internal(){
    debugPrint('Private Constructor With Factory');
  }

  /// with get
  static get instance {
    _instance ??=  SingletonExample2._internal();
    return _instance;
  }
}
