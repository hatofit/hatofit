import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class UserInfoView extends StatefulWidget with MainBoxMixin {
  const UserInfoView({super.key});

  @override
  State<UserInfoView> createState() => _UserInfoViewState();
}

class _UserInfoViewState extends State<UserInfoView> {
  late TextEditingController _conDateOfBirth;
  late FocusNode _fnDateOfBirth;
  late GlobalKey<FormState> _keyForm;

  @override
  void initState() {
    _conDateOfBirth = TextEditingController();
    _fnDateOfBirth = FocusNode();
    _keyForm = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _conDateOfBirth.dispose();
    _fnDateOfBirth.dispose();
    _keyForm.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    late final List<DataHelper> listGender = [
      DataHelper(
          title: Strings.of(context)!.male,
          iconPath: 'assets/images/avatar/male.png',
          color: Palette.male,
          type: 'male'),
      DataHelper(
          title: Strings.of(context)!.female,
          iconPath: 'assets/images/avatar/female.png',
          color: Palette.female,
          type: 'female'),
    ];
    return Parent(
      appBar: AppBar(
        title: Text(
          Strings.of(context)!.userPreferences,
        ),
        titleTextStyle: Theme.of(context).textTheme.titleLarge!.copyWith(
              fontWeight: FontWeight.w500,
            ),
        centerTitle: true,
      ),
      child: BlocBuilder<IntroCubit, IntroState>(
        builder: (context, state) => SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(Dimens.width16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Strings.of(context)!.selectYourGender,
                ),
                SizedBox(
                  height: Dimens.height16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: listGender
                      .map((e) => _buildGenderItem(context, e.iconPath ?? "",
                          e.title ?? "", e.color!, state, e.type ?? ""))
                      .toList(),
                ),
                SizedBox(
                  height: Dimens.height16,
                ),
                Text(
                  Strings.of(context)!.pickYourHeight,
                ),
                HorizontalPicker(
                  minValue: 0,
                  maxValue: 300,
                  divisions: 300,
                  height: Dimens.height100,
                  showCursor: true,
                  initialItem: state.height ?? 150,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  activeItemTextColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    context.read<IntroCubit>().updateHeight(value.toInt());
                  },
                ),
                SizedBox(
                  height: Dimens.height8,
                ),
                Text(
                  Strings.of(context)!.pickYourWeight,
                ),
                HorizontalPicker(
                  minValue: 0,
                  maxValue: 250,
                  divisions: 250,
                  height: Dimens.height100,
                  showCursor: true,
                  initialItem: state.weight ?? 125,
                  backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                  activeItemTextColor: Theme.of(context).primaryColor,
                  onChanged: (value) {
                    context.read<IntroCubit>().updateWeight(value.toInt());
                  },
                ),
                Text(
                  Strings.of(context)!.pickYourDateOfBirth,
                ),
                AutofillGroup(
                  child: Form(
                    key: _keyForm,
                    child: GestureDetector(
                      onTap: () => showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime.now(),
                      ).then((value) => {
                            if (value != null)
                              {
                                _conDateOfBirth.text =
                                    '${value.day} ${value.month.toStringMonth(context)} ${value.year}',
                                context.read<IntroCubit>().updateDateOfBirth(
                                    '${value.year}-${value.day}-${value.month}'),
                              }
                          }),
                      child: TextF(
                        prefixIcon: Icon(
                          Icons.cake_outlined,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                        suffixIcon: Icon(
                          Icons.calendar_today_outlined,
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                        ),
                        key: const Key("date_of_birth"),
                        curFocusNode: _fnDateOfBirth,
                        textInputAction: TextInputAction.next,
                        controller: _conDateOfBirth,
                        keyboardType: TextInputType.datetime,
                        hintText: 'dd/mm/yyyy',
                        enable: false,
                        validator: (String? value) {
                          if (value == null || value.isEmpty) {
                            return Strings.of(context)!
                                .pleaseEnterYourDateOfBirth;
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.height24,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      if (_keyForm.currentState?.validate() ?? false) {
                        context.read<IntroCubit>().updateAll();
                        context.pushNamed(Routes.login.name);
                      }
                    },
                    style: OutlinedButton.styleFrom(
                      backgroundColor: Palette.primary,
                      padding: EdgeInsets.symmetric(vertical: Dimens.height8),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(Dimens.radius8),
                      ),
                    ),
                    child: Text(
                      Strings.of(context)!.next,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildGenderItem(
    BuildContext context,
    String svgAsset,
    String gender,
    Color genderColor,
    IntroState state,
    String type,
  ) {
    final isSelected = type.toLowerCase() == state.selectedGender;
    return GestureDetector(
      onTap: () {
        context.read<IntroCubit>().updateGender(type.toLowerCase());
      },
      child: AnimatedContainer(
        width: Dimens.width128,
        height: Dimens.height128,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
        margin: EdgeInsets.symmetric(horizontal: Dimens.width8),
        padding: EdgeInsets.all(Dimens.radius8),
        decoration: BoxDecoration(
          border: Border.all(
            width: 2,
            color: isSelected ? genderColor : Colors.grey.withOpacity(0.5),
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(Dimens.radius15),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset(
              svgAsset,
              width: Dimens.width84,
              height: Dimens.height84,
            ),
            Text(
              gender.capitalizeFirst!,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    letterSpacing: 1.5,
                    fontWeight: FontWeight.normal,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}
