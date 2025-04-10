import 'package:dars49/datasource/datasources.dart';
import 'package:dars49/models/app_model.dart';
import 'package:flutter/material.dart';

class Viewmodel {
  //Singltn klass

  Viewmodel._konstruktor();

  static final Viewmodel _obyekt = Viewmodel._konstruktor();

  factory Viewmodel() {
    return _obyekt;
  }
  final PageController pageController = PageController();

  int currentIndex = 0;

  final LocalDataSource _localDataSource = LocalDataSource();

  void jumpToPage(int index) {
    pageController.jumpToPage(index);
  }

  //Home uchun bir nechta fakt list
  List<String> uzbekistanFacts = [
    "Poytaxti – Toshkent.",
    "Pul birligi – so‘m.",
    "Rasmiy til – o‘zbek tili.",
    "Mustaqillik kuni – 1-sentabr.",
    "Aholisi – 36 milliondan ortiq.",
    "Eng katta shahri – Toshkent.",
    "Eng uzun daryosi – Amudaryo.",
    "Eng katta cho‘li – Qizilqum.",
    "Mashhur taomi – palov.",
    "Registon – Samarqandda joylashgan.",
  ];

  //Controllerlar
  TextEditingController imageUrlController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController bioController = TextEditingController();

  AppModel _model = AppModel(
    image: "https://avatars.githubusercontent.com/u/185324594?v=4",
    phoneNumber: "+998 33 033 51 33",
    name: "Said",
    lastName: "Ro'zmamatov",
    bio: "Men Flutter dasturchiman. Bo'sh vaqtlarimda sayr qilishni yoqtiraman",
    isDark: false,
  );
  AppModel get model => _model;

  Future<void> getData() async {
    final updateModel = await _localDataSource.getData();
    if (updateModel != null) {
      _model = updateModel;
    }
  }

  Future<void> updateModel(AppModel model) async {
    _model = model;
    await _localDataSource.saveData(_model);
  }

  Future<void> themeUpdate() async {
    final model = _model.copyWith(isDark: !_model.isDark);
    await updateModel(model);
  }

  Future<void> imageUrlUpdate(String imageUrl) async {
    final model = _model.copyWith(image: imageUrl);
    await updateModel(model);
  }

  Future<void> nameUpdate(String name) async {
    final model = _model.copyWith(name: name);
    await updateModel(model);
  }

  Future<void> lastNameUpdate(String lastName) async {
    final model = _model.copyWith(lastName: lastName);
    await updateModel(model);
  }

  Future<void> phoneNumberUpdate(String phoneNumber) async {
    final model = _model.copyWith(phoneNumber: phoneNumber);
    await updateModel(model);
  }

  Future<void> bioUpdate(String bio) async {
    final model = _model.copyWith(bio: bio);
    await updateModel(model);
  }
}
