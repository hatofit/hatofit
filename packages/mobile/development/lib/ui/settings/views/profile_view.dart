import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  late TextEditingController _conEmail;
  late TextEditingController _conPassword;
  late TextEditingController _conFirstName;
  late TextEditingController _conLastName;
  late TextEditingController _conDateOfBirth;
  late FocusNode _fnEmail;
  late FocusNode _fnPassword;
  late FocusNode _fnFirstName;
  late FocusNode _fnLastName;
  late FocusNode _fnDateOfBirth;
  late GlobalKey<FormState> _keyForm;
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
  @override
  void initState() {
    _conEmail = TextEditingController();
    _conPassword = TextEditingController();
    _conFirstName = TextEditingController();
    _conLastName = TextEditingController();
    _conDateOfBirth = TextEditingController();
    _fnEmail = FocusNode();
    _fnPassword = FocusNode();
    _fnFirstName = FocusNode();
    _fnLastName = FocusNode();
    _fnDateOfBirth = FocusNode();
    _keyForm = GlobalKey<FormState>();
    super.initState();
  }

  void setInitialVal() {
    final state = context.read<SettingsCubit>().state;
    final user = state.user;
    if (user != null) {
      _conFirstName.text = user.firstName ?? '';
      _conLastName.text = user.lastName ?? '';
      _conEmail.text = user.email ?? '';
      _conPassword.text = '********';
      final dob = user.dateOfBirth;
      _conDateOfBirth.text =
          '${dob?.day} ${dob?.month.toStringMonth(context)} ${dob?.year}';
    }
  }

  @override
  void didChangeDependencies() {
    setInitialVal();
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _conEmail.dispose();
    _conPassword.dispose();
    _conFirstName.dispose();
    _conLastName.dispose();
    _conDateOfBirth.dispose();
    _fnEmail.dispose();
    _fnPassword.dispose();
    _fnFirstName.dispose();
    _fnLastName.dispose();
    _fnDateOfBirth.dispose();
    _keyForm.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Parent(
          appBar: AppBar(
            title: Text(Strings.of(context)!.profile),
            titleTextStyle: Theme.of(context).textTheme.titleLarge,
            bottom: const TabBar(tabs: [
              Tab(
                icon: Icon(Icons.person_rounded),
              ),
              Tab(
                // ruler icon
                icon: Icon(Icons.straighten_rounded),
              ),
            ]),
          ),
          floatingButton: FloatingActionButton.extended(
              backgroundColor: Theme.of(context).primaryColor,
              onPressed: () {
                if (_keyForm.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().updateUserRestApi(RegisterParams(
                        email: _conEmail.text,
                        password: _conPassword.text,
                        firstName: _conFirstName.text,
                        lastName: _conLastName.text,
                      ));
                }
              },
              label: Row(
                children: [
                  const Icon(Icons.save, color: Colors.white),
                  SizedBox(width: Dimens.width8),
                  Text(
                    Strings.of(context)!.updateProfile,
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                          color: Colors.white,
                        ),
                  )
                ],
              )),
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, authState) {
              authState.whenOrNull(
                loading: () => context.show(),
                success: (data) {
                  context.dismiss();
                  Strings.of(context)!.userUpdated.toToastSuccess(context);
                  TextInput.finishAutofillContext();
                  context.read<SettingsCubit>().init();
                  while (GoRouter.of(context).canPop()) {
                    GoRouter.of(context).pop();
                  }
                  context.goNamed(Routes.settings.name);
                },
                failure: (message) {
                  context.dismiss();
                  message.toToastError(context);
                },
              );
            },
            builder: (context, aState) {
              return BlocBuilder<SettingsCubit, DataHelper>(
                builder: (context, sState) {
                  return AutofillGroup(
                    child: Form(
                      key: _keyForm,
                      child: TabBarView(
                        children: [
                          userInfo(authState: aState, settingState: sState),
                          metricInfo(authState: aState, settingState: sState),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
          )),
    );
  }

  Widget userInfo({
    required AuthState authState,
    required DataHelper settingState,
  }) {
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.width16, vertical: Dimens.height8),
      child: Column(
        children: [
          Center(
            child: AvataPicker(
                onTap: () => context.pickImage(
                      gallery: () {
                        context.read<AuthCubit>().getImageFromGallery(context);
                        // context.pop();
                      },
                      camera: () {
                        context.read<AuthCubit>().getImageFromCamera(context);
                        // context.pop();
                      },
                    ),
                firstChild: authState is ImagePicked
                    ? Container(
                        width: Dimens.height48,
                        height: Dimens.height48,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: FileImage((authState).image!),
                            fit: BoxFit.cover,
                          ),
                        ))
                    : settingState.user?.determinePhoto(
                        settingState.user?.photo, settingState.user?.gender)),
          ),
          SizedBox(height: Dimens.height16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: listGender
                .map((e) => e.buildGenderItem(
                      context: context,
                      svgAsset: e.iconPath ?? "",
                      gender: e.title ?? "",
                      genderColor: e.color!,
                      selected: settingState.user?.gender ?? "",
                      type: e.type ?? "",
                      onTap: () {
                        context.read<SettingsCubit>().updateGender(
                              (e.type ?? "").toLowerCase(),
                            );
                      },
                    ))
                .toList(),
          ),
          SizedBox(height: Dimens.height16),
          TextF(
            autofillHints: const [AutofillHints.givenName],
            key: const Key('firstName'),
            curFocusNode: _fnFirstName,
            nextFocusNode: _fnLastName,
            textInputAction: TextInputAction.next,
            controller: _conFirstName,
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(Icons.person),
            hint: Strings.of(context)!.firstName,
            validator: (String? value) {
              if (value!.isEmpty) {
                return Strings.of(context)!.firstNameCannotBeEmpty;
              }
              return null;
            },
          ),
          SizedBox(height: Dimens.height16),
          TextF(
            autofillHints: const [AutofillHints.familyName],
            key: const Key('lastName'),
            curFocusNode: _fnLastName,
            nextFocusNode: _fnEmail,
            textInputAction: TextInputAction.next,
            controller: _conLastName,
            keyboardType: TextInputType.name,
            prefixIcon: const Icon(Icons.person),
            hintText: "Doe",
            hint: Strings.of(context)!.lastName,
          ),
          SizedBox(height: Dimens.height16),
          GestureDetector(
            onTap: () => showDatePicker(
              context: context,
              initialDate: settingState.user?.dateOfBirth ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            ).then((value) => {
                  if (value != null)
                    {
                      setState(() {
                        _conDateOfBirth.text =
                            '${value.day} ${value.month.toStringMonth(context)} ${value.year}';
                      }),
                      context.read<SettingsCubit>().updateDateOfBirth(value),
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
              hint: Strings.of(context)!.dateOfBirth,
              enable: false,
              validator: (String? value) {
                if (value == null || value.isEmpty) {
                  return Strings.of(context)!.pleaseEnterYourDateOfBirth;
                }
                return null;
              },
            ),
          ),
          SizedBox(height: Dimens.height16),
          TextF(
            autofillHints: const [AutofillHints.email],
            key: const Key('email'),
            curFocusNode: _fnEmail,
            nextFocusNode: _fnPassword,
            textInputAction: TextInputAction.next,
            controller: _conEmail,
            keyboardType: TextInputType.emailAddress,
            prefixIcon: const Icon(Icons.email),
            hintText: "john@gmail.com",
            hint: Constants.get.email,
            validator: (String? value) => value != null
                ? (!value.isValidEmail()
                    ? Strings.of(context)?.errorInvalidEmail
                    : null)
                : null,
          ),
          SizedBox(height: Dimens.height16),
          TextF(
            key: const Key("password"),
            curFocusNode: _fnPassword,
            textInputAction: TextInputAction.next,
            controller: _conPassword,
            keyboardType: TextInputType.text,
            prefixIcon: Icon(
              Icons.lock_outline,
              color: Theme.of(context).textTheme.bodyLarge?.color,
            ),
            obscureText: context.read<AuthCubit>().isPasswordHide ?? false,
            maxLine: 1,
            hint: Strings.of(context)!.password,
            suffixIcon: IconButton(
              padding: EdgeInsets.zero,
              constraints: const BoxConstraints(),
              onPressed: () => context.read<AuthCubit>().showHidePassword(),
              icon: Icon(
                (context.read<AuthCubit>().isPasswordHide ?? false)
                    ? Icons.visibility_off
                    : Icons.visibility,
              ),
            ),
            validator: (String? value) => value != null
                ? (value.length < 8
                    ? Strings.of(context)!.errorPasswordLength
                    : null)
                : null,
            semantic: "password",
          ),
          SizedBox(height: Dimens.height84),
        ],
      ),
    ));
  }

  Widget metricInfo({
    required AuthState authState,
    required DataHelper settingState,
  }) {
    final setCub = context.read<SettingsCubit>();
    return SingleChildScrollView(
        child: Padding(
      padding: EdgeInsets.symmetric(
          horizontal: Dimens.width16, vertical: Dimens.height8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(Strings.of(context)!.bodyHeight),
          HorizontalPicker(
            minValue: 0,
            maxValue: 300,
            divisions: 300,
            height: Dimens.height100,
            showCursor: true,
            initialItem: settingState.user == null
                ? 150
                : settingState.user!.height ?? 150,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            activeItemTextColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              context.read<SettingsCubit>().updateHeight(value.toInt());
            },
          ),
          SizedBox(height: Dimens.height8),
          Text(Strings.of(context)!.bodyWeight),
          HorizontalPicker(
            minValue: 0,
            maxValue: 250,
            divisions: 250,
            height: Dimens.height100,
            showCursor: true,
            initialItem: settingState.user == null
                ? 125
                : settingState.user!.weight ?? 125,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            activeItemTextColor: Theme.of(context).primaryColor,
            onChanged: (value) {
              context.read<SettingsCubit>().updateWeight(value.toInt());
            },
          ),
          DropDown<DataHelper>(
            key: const Key("energy_metric"),
            hint: Strings.of(context)!.energyUnit,
            value: determineEnergy(
                settingState.user?.metricUnits?.energyUnits, setCub),
            prefixIcon: const Icon(Icons.bolt_outlined),
            items: setCub.listEnergyUnit
                .map(
                  (data) => DropdownMenuItem(
                    value: data,
                    child: Text(
                      data.title ?? "-",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
                .toList(),
            onChanged: (DataHelper? value) {
              settingState.sEUnit = value ?? setCub.listEnergyUnit[0];

              context.read<SettingsCubit>().uEUnit(value?.type ?? "kcal");
            },
          ),
          DropDown<DataHelper>(
            key: const Key("height_metric"),
            hint: Strings.of(context)!.heightUnit,
            value: determineHeight(
                settingState.user?.metricUnits?.heightUnits, setCub),
            prefixIcon: const Icon(Icons.rule_outlined),
            items: setCub.listHeightUnit
                .map(
                  (data) => DropdownMenuItem(
                    value: data,
                    child: Text(
                      data.title ?? "-",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
                .toList(),
            onChanged: (DataHelper? value) {
              settingState.sHUnit = value ?? setCub.listHeightUnit[0];

              context.read<SettingsCubit>().uHUnit(value?.type ?? "cm");
            },
          ),
          DropDown<DataHelper>(
            key: const Key("weight_metric"),
            hint: Strings.of(context)!.weightUnit,
            value: determineWeight(
                settingState.user?.metricUnits?.weightUnits, setCub),
            prefixIcon: const Icon(Icons.line_weight_outlined),
            items: setCub.listWeightUnit
                .map(
                  (data) => DropdownMenuItem(
                    value: data,
                    child: Text(
                      data.title ?? "-",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                )
                .toList(),
            onChanged: (DataHelper? value) {
              settingState.sWUnit = value ?? setCub.listWeightUnit[0];

              context.read<SettingsCubit>().uWUnit(value?.type ?? "kg");
            },
          ),
        ],
      ),
    ));
  }

  static DataHelper determineEnergy(String? u, SettingsCubit setCub) {
    if (u == null) return setCub.listEnergyUnit[0];
    switch (u) {
      case "kcal":
        return setCub.listEnergyUnit[0];
      case "kj":
        return setCub.listEnergyUnit[1];
      default:
        return setCub.listEnergyUnit[0];
    }
  }

  static DataHelper determineHeight(String? u, SettingsCubit setCub) {
    if (u == null) return setCub.listHeightUnit[0];
    switch (u) {
      case "cm":
        return setCub.listHeightUnit[0];
      case "inch":
        return setCub.listHeightUnit[1];
      default:
        return setCub.listHeightUnit[0];
    }
  }

  static DataHelper determineWeight(String? u, SettingsCubit setCub) {
    if (u == null) return setCub.listWeightUnit[0];
    switch (u) {
      case "kg":
        return setCub.listWeightUnit[0];
      case "lb":
        return setCub.listWeightUnit[1];
      default:
        return setCub.listWeightUnit[0];
    }
  }
}
