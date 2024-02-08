import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:hatofit/core/core.dart';
import 'package:hatofit/domain/domain.dart';
import 'package:hatofit/ui/auth/auth.dart';
import 'package:hatofit/utils/utils.dart';
import 'package:video_player/video_player.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController _conEmail;
  late TextEditingController _conPassword;
  late FocusNode _fnEmail;
  late FocusNode _fnPassword;
  late GlobalKey<FormState> _keyForm;
  late VideoPlayerController _videoPlayerController;

  @override
  void initState() {
    _conEmail = TextEditingController();
    _conPassword = TextEditingController();
    _fnEmail = FocusNode();
    _fnPassword = FocusNode();
    _keyForm = GlobalKey<FormState>();
    _videoPlayerController = VideoPlayerController.asset(
      'assets/videos/login.mp4',
    )..initialize().then((_) {
        _videoPlayerController.play();
        _videoPlayerController.setLooping(true);
      });
    super.initState();
  }

  @override
  void dispose() {
    _conEmail.dispose();
    _conPassword.dispose();
    _fnEmail.dispose();
    _fnPassword.dispose();
    _keyForm.currentState?.dispose();
    _videoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Parent(
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) {
          state.whenOrNull(
            loading: () => context.show(),
            success: (data) {
              context.dismiss();
              Strings.of(context)!.signInSuccessfully.toToastSuccess(context);
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
          child: AutofillGroup(
            child: Form(
              key: _keyForm,
              child: Column(
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: Dimens.height270,
                        child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                            Theme.of(context)
                                .scaffoldBackgroundColor
                                .withOpacity(0.5),
                            BlendMode.srcOver,
                          ),
                          child: VideoPlayer(_videoPlayerController),
                        ),
                      ),
                      Positioned.fill(
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                colors: [
                                  Colors.transparent,
                                  Theme.of(context).scaffoldBackgroundColor,
                                ],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            ),
                            height: Dimens.height100,
                          ),
                        ),
                      ),
                      SizedBox(
                          height: Dimens.height270,
                          child: const Center(
                            child: BreathingAnimation(),
                          )),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.all(Dimens.width16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          Strings.of(context)!.signIn,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        SizedBox(
                          height: Dimens.height16,
                        ),
                        TextF(
                          autofillHints: const [AutofillHints.email],
                          key: const Key("email"),
                          curFocusNode: _fnEmail,
                          nextFocusNode: _fnPassword,
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
                        SizedBox(
                          height: Dimens.height16,
                        ),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (_, state) {
                            return TextF(
                              autofillHints: const [AutofillHints.password],
                              key: const Key("password"),
                              curFocusNode: _fnPassword,
                              textInputAction: TextInputAction.done,
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
                                      ? Strings.of(context)!.errorPasswordLength
                                      : null)
                                  : null,
                            );
                          },
                        ),
                        SizedBox(
                          height: Dimens.height4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const SizedBox(),
                            // Row(
                            //   children: [
                            //     Checkbox(
                            //       value: true,
                            //       onChanged: (value) {},
                            //     ),
                            //     Text(
                            //       'Remember me',
                            //       style: Theme.of(context).textTheme.bodyMedium,
                            //     ),
                            //   ],
                            // ),
                            TextButton(
                              onPressed: () =>
                                  context.pushNamed(Routes.forgotPassword.name),
                              child: Text(
                                '${Strings.of(context)!.forgotPassword} ?',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(
                                      color: Palette.blueLatte,
                                    ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: Dimens.height4,
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: OutlinedButton(
                            onPressed: () {
                              if (_keyForm.currentState?.validate() ?? false) {
                                context.read<AuthCubit>().signInWithRestAPI(
                                      LoginParams(
                                        email: _conEmail.text,
                                        password: _conPassword.text,
                                      ),
                                    );
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              backgroundColor: Palette.primary,
                              padding: EdgeInsets.symmetric(
                                  vertical: Dimens.height8),
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.circular(Dimens.radius8),
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
                              Strings.of(context)!.dontHaveHatofitAccount,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            TextButton(
                              onPressed: () =>
                                  context.pushNamed(Routes.register.name),
                              child: Text(
                                Strings.of(context)!.signUp,
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
