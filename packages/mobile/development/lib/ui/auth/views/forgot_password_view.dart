import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/ui.dart';
import 'package:hatofit/utils/utils.dart';

class ForgotPasswordView extends StatefulWidget {
  const ForgotPasswordView({super.key});

  @override
  State<ForgotPasswordView> createState() => _ForgotPasswordViewState();
}

class _ForgotPasswordViewState extends State<ForgotPasswordView> {
  late TextEditingController _conEmail;
  late FocusNode _fnEmail;
  late GlobalKey<FormState> _keyForm;

  @override
  void initState() {
    _conEmail = TextEditingController();
    _fnEmail = FocusNode();
    _keyForm = GlobalKey<FormState>();
    super.initState();
  }

  @override
  void dispose() {
    _conEmail.dispose();
    _fnEmail.dispose();
    _keyForm.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      appBar: AppBar(
        title: Text(
          Strings.of(context)!.forgotPassword,
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
        centerTitle: true,
      ),
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();
              Strings.of(context)!
                  .emailSentedPleaseCheckYourInbox
                  .toToastSuccess(context);
              TextInput.finishAutofillContext();
              context.pushNamed(
                Routes.resetPassword.name,
                extra: _conEmail.text,
              );
            },
            failure: (message) {
              context.dismiss();
              message.toToastError(context);
            },
          );
        },
        child: Padding(
          padding: EdgeInsets.all(Dimens.width16),
          child: Center(
            child: Column(
              children: [
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
                Text(
                  Strings.of(context)!
                      .pleaseEnterYourEmailAddressToReceiveVerificationCode,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                SizedBox(
                  height: Dimens.height32,
                ),
                AutofillGroup(
                  child: Form(
                    key: _keyForm,
                    child: TextF(
                      autofillHints: const [AutofillHints.email],
                      key: const Key("email"),
                      curFocusNode: _fnEmail,
                      textInputAction: TextInputAction.next,
                      controller: _conEmail,
                      keyboardType: TextInputType.emailAddress,
                      prefixIcon: Icon(
                        Icons.alternate_email,
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                      ),
                      hintText: "john@gmail.com",
                      hint: Constants.get.email,
                      validator: (String? value) => value != null
                          ? (!value.isValidEmail()
                              ? Strings.of(context)?.errorInvalidEmail
                              : null)
                          : null,
                    ),
                  ),
                ),
                SizedBox(
                  height: Dimens.height16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton(
                    onPressed: () {
                      if (_keyForm.currentState?.validate() ?? false) {
                        context.read<AuthCubit>().forgotPassword(
                              ForgotPasswordParams(
                                email: _conEmail.text,
                              ),
                            );
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
                      Strings.of(context)!.signIn,
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
