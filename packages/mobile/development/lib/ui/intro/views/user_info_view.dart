import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class UserInfoView extends StatefulWidget {
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
                      .map(
                        (e) => e.buildGenderItem(
                            context: context,
                            svgAsset: e.iconPath ?? "",
                            gender: e.title ?? "",
                            genderColor: e.color!,
                            selected: state.user?.gender ?? "",
                            type: e.type ?? "",
                            onTap: () {
                              context.read<IntroCubit>().updateGender(
                                    (e.type ?? "").toLowerCase(),
                                  );
                            }),
                      )
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
                  initialItem:
                      state.user == null ? 150 : state.user!.height ?? 150,
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
                  initialItem:
                      state.user == null ? 125 : state.user!.weight ?? 125,
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
                                context
                                    .read<IntroCubit>()
                                    .updateDateOfBirth(value),
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
                        if (state.user == null) {
                          return Strings.of(context)!
                              .pleaseSelectYourGender
                              .toToastError(context);
                        } else {
                          context.read<IntroCubit>().updateAll();
                          context
                              .read<IntroCubit>()
                              .isOfflineMode()
                              .then((value) {
                            if (value) {
                              context.goNamed(Routes.home.name);
                            } else {
                              context.pushNamed(Routes.login.name);
                            }
                          });
                        }
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
}
