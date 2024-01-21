import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hatofit/utils/utils.dart';

class SettingsCubit extends Cubit<DataHelper> {
  SettingsCubit() : super(DataHelper(type: "en"));
}
