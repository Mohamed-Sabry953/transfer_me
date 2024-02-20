
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsProvider extends ChangeNotifier {
  SettingsProvider() : super();
  static SettingsProvider get(context)=>Provider.of<SettingsProvider>(context,listen: false);
  String selectedValue="English";
  String selectedModeValue="light";
  List<String> modeItems = ["light","dark"];
  List<String> items = ["English", "عربى"];
  ThemeMode themeMode=ThemeMode.light;

  changeLangMenuVal(String value){
    selectedValue=value;
    notifyListeners();
  }
  changeModeMenuVal(String value){
    selectedModeValue=value;
    notifyListeners();
  }
  changeTheme(){
    if(selectedModeValue=="light"){
      themeMode=ThemeMode.light;
      notifyListeners();
    }
    if(selectedModeValue=="dark"){
      themeMode=ThemeMode.dark;
      notifyListeners();
    }
  }
}
