import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/auth/auth.dart';
import 'package:hatofit/utils/utils.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  late TextEditingController _conEmail;
  late TextEditingController _conPassword;
  late TextEditingController _conConfirmPassword;
  late TextEditingController _conFirstName;
  late TextEditingController _conLastName;
  late FocusNode _fnEmail;
  late FocusNode _fnPassword;
  late FocusNode _fnConfirmPassword;
  late FocusNode _fnFirstName;
  late FocusNode _fnLastName;
  late GlobalKey<FormState> _keyForm;

  @override
  void initState() {
    _conEmail = TextEditingController();
    _conPassword = TextEditingController();
    _conConfirmPassword = TextEditingController();
    _conFirstName = TextEditingController();
    _conLastName = TextEditingController();
    _fnEmail = FocusNode();
    _fnPassword = FocusNode();
    _fnConfirmPassword = FocusNode();
    _fnFirstName = FocusNode();
    _fnLastName = FocusNode();
    _keyForm = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _conEmail.dispose();
    _conPassword.dispose();
    _conConfirmPassword.dispose();
    _conFirstName.dispose();
    _conLastName.dispose();
    _fnEmail.dispose();
    _fnPassword.dispose();
    _fnConfirmPassword.dispose();
    _fnFirstName.dispose();
    _fnLastName.dispose();
    _keyForm.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: Text(
          Strings.of(context)!.signUp,
        ),
        titleTextStyle: Theme.of(context)
            .textTheme
            .titleLarge!
            .copyWith(fontWeight: FontWeight.w500),
        centerTitle: true,
      ),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();
              Strings.of(context)!.signUpSuccessfully.toToastSuccess(context);
              TextInput.finishAutofillContext();
              context.goNamed(Routes.home.name);
            },
            failure: (message) {
              context.dismiss();
              message.toToastError(context);
            },
          );
        },
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Center(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: Dimens.width16, vertical: Dimens.height8),
              child: AutofillGroup(
                child: Form(
                  key: _keyForm,
                  child: Column(
                    children: [
                      AvataPicker(
                        onTap: () => context.pickImage(
                          gallery: () {
                            context.read<AuthCubit>().getImageFromGallery(context);
                            context.pop();
                          },
                          camera: () {
                            context.read<AuthCubit>().getImageFromCamera(context);
                            context.pop();
                          },
                        ),
                        firstChild: BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final isImageSet =
                                context.watch<AuthCubit>().pickedImage != null;
                            if (isImageSet) {
                              return CircleAvatar(
                                backgroundImage: FileImage(
                                  context.read<AuthCubit>().pickedImage!,
                                ),
                              );
                            } else {
                              return Icon(
                                Icons.person,
                                size: Dimens.width84,
                                color: context.isDarkMode
                                    ? Colors.white
                                    : Colors.black,
                              );
                            }
                          },
                        ),
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
                        hintText: "John",
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
                        // validator: (String? value) {
                        //   if (value!.isEmpty) {
                        //     return Strings.of(context)!.lastNameCannotBeEmpty;
                        //   }
                        //   return null;
                        // },
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
                      BlocBuilder<AuthCubit, AuthState>(
                        builder: (_, state) {
                          return Column(
                            children: [
                              TextF(
                                key: const Key("password"),
                                curFocusNode: _fnPassword,
                                nextFocusNode: _fnConfirmPassword,
                                textInputAction: TextInputAction.next,
                                controller: _conPassword,
                                keyboardType: TextInputType.text,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color,
                                ),
                                obscureText:
                                    context.read<AuthCubit>().isPasswordHide ??
                                        false,
                                hintText: '••••••••••••',
                                maxLine: 1,
                                hint: Strings.of(context)!.password,
                                suffixIcon: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () => context
                                      .read<AuthCubit>()
                                      .showHidePassword(),
                                  icon: Icon(
                                    (context.read<AuthCubit>().isPasswordHide ??
                                            false)
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                validator: (String? value) => value != null
                                    ? (value.length < 8
                                        ? Strings.of(context)!
                                            .errorPasswordLength
                                        : null)
                                    : null,
                                semantic: "password",
                              ),
                              SizedBox(height: Dimens.height16),
                              TextF(
                                key: const Key("repeat_password"),
                                curFocusNode: _fnConfirmPassword,
                                textInputAction: TextInputAction.done,
                                controller: _conConfirmPassword,
                                keyboardType: TextInputType.text,
                                prefixIcon: Icon(
                                  Icons.lock_outline,
                                  color: Theme.of(context)
                                      .textTheme
                                      .bodyLarge
                                      ?.color,
                                ),
                                obscureText: context
                                        .read<AuthCubit>()
                                        .isPasswordRepeatHide ??
                                    false,
                                hintText: '••••••••••••',
                                maxLine: 1,
                                hint: Strings.of(context)!.confirmPassword,
                                suffixIcon: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: const BoxConstraints(),
                                  onPressed: () => context
                                      .read<AuthCubit>()
                                      .showHidePasswordRepeat(),
                                  icon: Icon(
                                    (context
                                                .read<AuthCubit>()
                                                .isPasswordRepeatHide ??
                                            false)
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                validator: (String? value) => value != null
                                    ? (value != _conPassword.text
                                        ? Strings.of(context)
                                            ?.errorPasswordNotMatch
                                        : null)
                                    : null,
                                semantic: "repeat_password",
                              ),
                            ],
                          );
                        },
                      ),
                      SizedBox(
                        height: Dimens.height16,
                      ),
                      SizedBox(
                        width: double.infinity,
                        child: OutlinedButton(
                          onPressed: () {
                            if (_keyForm.currentState?.validate() ?? false) {
                              context.read<AuthCubit>().signUpWithRestAPI(
                                    RegisterParams(
                                      email: _conEmail.text,
                                      password: _conPassword.text,
                                      confirmPassword: _conConfirmPassword.text,
                                      firstName: _conFirstName.text,
                                      lastName: _conLastName.text,
                                    ),
                                  );
                            }
                          },
                          style: OutlinedButton.styleFrom(
                            backgroundColor: Palette.primary,
                            padding:
                                EdgeInsets.symmetric(vertical: Dimens.height8),
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(Dimens.radius8),
                            ),
                          ),
                          child: Text(
                            Strings.of(context)!.signUp,
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                      ),
                      context.read<AuthCubit>().isGoogleOauthAvailable
                          ? const SignWitGoogle()
                          : const SizedBox(),
                      SizedBox(
                        height: Dimens.height8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Strings.of(context)!.alreadyHaveHatofitAccount,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          TextButton(
                            onPressed: () =>
                                context.pushNamed(Routes.register.name),
                            child: Text(
                              Strings.of(context)!.signIn,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    color: Palette.blueLatte,
                                  ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
