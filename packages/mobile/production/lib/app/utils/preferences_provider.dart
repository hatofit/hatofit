import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider {
  Future<SharedPreferences> init() async {
    return await SharedPreferences.getInstance();
  }

  // clear
  Future<bool> clear() async {
    final SharedPreferences prefs = await init();
    return prefs.clear();
  }

  // email
  Future<String?> getEmail() async {
    final SharedPreferences prefs = await init();
    return prefs.getString('email');
  }

  Future<bool> setEmail(String email) async {
    final SharedPreferences prefs = await init();
    final set = await prefs.setString('email', email);
    return set;
  }

  // firstName
  Future<String?> getFirstName() async {
    final SharedPreferences prefs = await init();
    return prefs.getString('firstName');
  }

  Future<bool> setFirstName(String firstName) async {
    final SharedPreferences prefs = await init();
    final set = await prefs.setString('firstName', firstName);
    return set;
  }

  // lastName
  Future<String?> getLastName() async {
    final SharedPreferences prefs = await init();
    return prefs.getString('lastName');
  }

  Future<bool> setLastName(String lastName) async {
    final SharedPreferences prefs = await init();
    final set = await prefs.setString('lastName', lastName);
    return set;
  }

  // dateOfBirth
  Future<String?> getDateOfBirth() async {
    final SharedPreferences prefs = await init();
    return prefs.getString('dateOfBirth');
  }

  Future<bool> setDateOfBirth(String dateOfBirth) async {
    final SharedPreferences prefs = await init();
    final set = await prefs.setString('dateOfBirth', dateOfBirth);
    return set;
  }

  // userToken
  Future<String?> getUserToken() async {
    final SharedPreferences prefs = await init();
    return prefs.getString('userToken');
  }

  Future<bool> setUserToken(String userToken) async {
    final SharedPreferences prefs = await init();
    final set = await prefs.setString('userToken', userToken);
    return set;
  }

  // weight
  Future<int?> getWeight() async {
    final SharedPreferences prefs = await init();
    return prefs.getInt('weight');
  }

  Future<bool> setWeight(int weight) async {
    final SharedPreferences prefs = await init();
    final set = await prefs.setInt('weight', weight);
    return set;
  }

  // height
  Future<int?> getHeight() async {
    final SharedPreferences prefs = await init();
    return prefs.getInt('height');
  }

  Future<bool> setHeight(int height) async {
    final SharedPreferences prefs = await init();
    final set = await prefs.setInt('height', height);
    return set;
  }

  // gender
  Future<String?> getGender() async {
    final SharedPreferences prefs = await init();
    return prefs.getString('gender');
  }

  Future<bool> setGender(String gender) async {
    final SharedPreferences prefs = await init();
    final set = await prefs.setString('gender', gender);
    return set;
  }

  // metricUnits
  Future<List> getMetricUnits() async {
    final SharedPreferences prefs = await init();
    final set = prefs.getStringList('metricUnits');
    return set!;
  }

  Future<bool> setMetricUnits(List<String> metricUnits) async {
    final SharedPreferences prefs = await init();
    final set = await prefs.setStringList('metricUnits', metricUnits);
    return set;
  }

  // createdAt
  Future<String?> getCreatedAt() async {
    final SharedPreferences prefs = await init();
    return prefs.getString('createdAt');
  }

  Future<bool> setCreatedAt(String createdAt) async {
    final SharedPreferences prefs = await init();
    final set = await prefs.setString('createdAt', createdAt);
    return set;
  }

  // updatedAt
  Future<String?> getUpdatedAt() async {
    final SharedPreferences prefs = await init();
    return prefs.getString('updatedAt');
  }

  Future<bool> setUpdatedAt(String updatedAt) async {
    final SharedPreferences prefs = await init();
    final set = await prefs.setString('updatedAt', updatedAt);
    return set;
  }
}
