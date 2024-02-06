import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/auth/cubit/auth_cubit.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:pinput/pinput.dart';

class ResetPasswordView extends StatefulWidget {
  const ResetPasswordView({super.key, required this.email});
  final String email;

  @override
  State<ResetPasswordView> createState() => _ResetPasswordViewState();
}

class _ResetPasswordViewState extends State<ResetPasswordView> {
  late TextEditingController _conPin;
  late TextEditingController _conPassword;
  late TextEditingController _conConfirmPassword;
  late FocusNode _fnPin;
  late FocusNode _fnPassword;
  late FocusNode _fnConfirmPassword;
  late GlobalKey<FormState> _keyForm;
  late GlobalKey<FormState> _keyForm2;

  late PinTheme _pinTheme;
  @override
  void initState() {
    _conPin = TextEditingController();
    _conPassword = TextEditingController();
    _conConfirmPassword = TextEditingController();
    _fnPin = FocusNode();
    _fnPassword = FocusNode();
    _fnConfirmPassword = FocusNode();
    _keyForm = GlobalKey<FormState>();
    _keyForm2 = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _conPin.dispose();
    _conPassword.dispose();
    _conConfirmPassword.dispose();
    _fnPin.dispose();
    _fnPassword.dispose();
    _fnConfirmPassword.dispose();
    _keyForm.currentState?.dispose();
    _keyForm2.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _pinTheme = PinTheme(
      width: Dimens.width48,
      height: Dimens.height48,
      textStyle: Theme.of(context).textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
      decoration: BoxDecoration(
        color: Theme.of(context).hintColor.withOpacity(0.1),
        borderRadius: BorderRadius.circular(Dimens.radius8),
        border: Border.all(color: Colors.transparent),
      ),
    );
    return Parent(
        // appBar: AppBar(
        //   title: Text(
        //     Strings.of(context)!.verificationCode,
        //     style: Theme.of(context).textTheme.titleLarge?.copyWith(
        //           fontWeight: FontWeight.w600,
        //         ),
        //   ),
        //   centerTitle: true,
        // ),
        child: Padding(
      padding: EdgeInsets.symmetric(
        horizontal: Dimens.width16,
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
            initial: null,
          );
        },
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: Dimens.height64,
              ),
              Container(
                padding: const EdgeInsets.all(28),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(666),
                  color: Colors.red.withOpacity(0.25),
                ),
                child: const Icon(
                  Icons.vpn_key,
                  size: 50,
                  color: Colors.red,
                ),
              ),
              SizedBox(
                height: Dimens.height32,
              ),
              context.watch<AuthCubit>().isCodeVerified
                  ? buildChangePassword()
                  : buildOtp(),
            ],
          ),
        ),
      ),
    ));
  }

  Widget buildChangePassword() => Column(
        children: [
          Text(
            Strings.of(context)!.changePassword,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: Dimens.height16,
          ),
          Text(
            Strings.of(context)!.enterYourNewPassword,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).hintColor,
                ),
          ),
          SizedBox(height: Dimens.height16),
          Form(
            key: _keyForm2,
            child: BlocBuilder<AuthCubit, AuthState>(
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
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      obscureText:
                          context.read<AuthCubit>().isPasswordHide ?? false,
                      hintText: '••••••••••••',
                      maxLine: 1,
                      hint: Strings.of(context)!.password,
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () =>
                            context.read<AuthCubit>().showHidePassword(),
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
                    SizedBox(height: Dimens.height16),
                    TextF(
                      key: const Key("repeat_password"),
                      curFocusNode: _fnConfirmPassword,
                      textInputAction: TextInputAction.done,
                      controller: _conConfirmPassword,
                      keyboardType: TextInputType.text,
                      prefixIcon: Icon(
                        Icons.lock_outline,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      obscureText:
                          context.read<AuthCubit>().isPasswordRepeatHide ??
                              false,
                      hintText: '••••••••••••',
                      maxLine: 1,
                      hint: Strings.of(context)!.confirmPassword,
                      suffixIcon: IconButton(
                        padding: EdgeInsets.zero,
                        constraints: const BoxConstraints(),
                        onPressed: () =>
                            context.read<AuthCubit>().showHidePasswordRepeat(),
                        icon: Icon(
                          (context.read<AuthCubit>().isPasswordRepeatHide ??
                                  false)
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      ),
                      validator: (String? value) => value != null
                          ? (value != _conPassword.text
                              ? Strings.of(context)?.errorPasswordNotMatch
                              : null)
                          : null,
                      semantic: "repeat_password",
                    ),
                    SizedBox(
                      height: Dimens.height16,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton(
                        onPressed: () {
                          if (_keyForm2.currentState?.validate() ?? false) {
                            context.read<AuthCubit>().resetPassword(
                                  ResetPasswordParams(
                                    email: widget.email,
                                    password: _conPassword.text,
                                    confirmPassword: _conConfirmPassword.text,
                                    code: _conPin.text,
                                  ),
                                );
                          }
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Palette.primary,
                          padding:
                              EdgeInsets.symmetric(vertical: Dimens.height8),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(Dimens.radius8),
                          ),
                        ),
                        child: Text(
                          Strings.of(context)!.submit,
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      );

  Widget buildOtp() => Column(
        children: [
          Text(
            Strings.of(context)!.verification,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.w600,
                ),
          ),
          SizedBox(
            height: Dimens.height16,
          ),
          Text(
            Strings.of(context)!.enterTheCodeThatWasSentTo,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontWeight: FontWeight.w400,
                  color: Theme.of(context).hintColor,
                ),
          ),
          SizedBox(
            height: Dimens.height16,
          ),
          Text(
            widget.email,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w400,
                ),
          ),
          SizedBox(
            height: Dimens.height32,
          ),
          Form(
            key: _keyForm,
            child: Pinput(
              length: 6,
              controller: _conPin,
              focusNode: _fnPin,
              validator: (value) {
                if (value!.length < 6) {
                  return 'Please enter 6 digit code';
                }
                return null;
              },
              onCompleted: (value) {
                if (_keyForm.currentState?.validate() ?? false) {
                  context.read<AuthCubit>().verifyCode(
                        ResetPasswordParams(
                          email: widget.email,
                          code: _conPin.text,
                        ),
                      );
                }
              },
              defaultPinTheme: _pinTheme,
              focusedPinTheme: _pinTheme.copyWith(
                height: Dimens.height64,
                width: Dimens.width64,
                decoration: _pinTheme.decoration!.copyWith(
                  border: Border.all(
                    color: Theme.of(context).colorScheme.primary,
                  ),
                ),
              ),
              errorPinTheme: _pinTheme.copyWith(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.error,
                  borderRadius: BorderRadius.circular(Dimens.radius8),
                ),
              ),
            ),
          ),
          SizedBox(
            height: Dimens.height16,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                Strings.of(context)!.dintReceiveCode,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              TextButton(
                onPressed: () => context.read<AuthCubit>().forgotPassword(
                      ForgotPasswordParams(
                        email: widget.email,
                      ),
                    ),
                child: Text(
                  Strings.of(context)!.resend,
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: Palette.blueLatte,
                      ),
                ),
              )
            ],
          ),
        ],
      );
}
