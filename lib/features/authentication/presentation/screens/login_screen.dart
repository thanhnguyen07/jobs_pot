import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:jobs_pot/common/app_colors.dart';
import 'package:jobs_pot/common/app_icons.dart';
import 'package:jobs_pot/common/app_images.dart';
import 'package:jobs_pot/common/app_text_styles.dart';
import 'package:jobs_pot/common/validation_keys.dart';
import 'package:jobs_pot/common/widgets/CutomButton.dart';
import 'package:jobs_pot/common/widgets/InputReactiveForms.dart';
import 'package:jobs_pot/common/widgets/RememberAndForgot.dart';
import 'package:jobs_pot/common/widgets/SuggestionsText.dart';
import 'package:jobs_pot/config/app_configs.dart';
import 'package:jobs_pot/features/authentication/auth_providers.dart';
import 'package:jobs_pot/resources/i18n/generated/locale_keys.dart';
import 'package:reactive_forms/reactive_forms.dart';

@RoutePage()
class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String path = "/LoginScreen";

  @override
  ConsumerState createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  FormControl<dynamic>? formControlEmail;
  FormControl<dynamic>? formControlPassword;

  late bool showPassword = true;
  late bool rememberState = true;
  late FormGroup loginForm;

  @override
  void initState() {
    super.initState();

    final controller = ref.read(loginControllerProvider.notifier);

    loginForm = controller.loginForm;

    loginForm.reset();

    formControlEmail = loginForm.control(ValidationKeys.email) as FormControl?;

    formControlPassword =
        loginForm.control(ValidationKeys.password) as FormControl?;
  }

  void _onLogin(FormGroup form) {
    FocusManager.instance.primaryFocus?.unfocus();
    final email = form.controls[ValidationKeys.email]?.value.toString() ?? "";
    final password =
        form.controls[ValidationKeys.password]?.value.toString() ?? "";

    final isValid = form.valid;
    if (isValid) {
      // ref
      //     .read(signinWithEmailProvider.notifier)
      //     .signinWithMail(email, password);
    } else {
      form.controls.forEach((key, value) {
        if (value.invalid) {
          value.setErrors({
            ValidationKeys.required: LocaleKeys.authenticationInputRequired
          });
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: Container(
          width: double.infinity,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 30),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: _bodyWidget(context),
          ),
        ),
      ),
    );
  }

  Column _bodyWidget(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 80),
          child: RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
              text: '${LocaleKeys.authenticationLoginTitle.tr()}\n',
              style: AppTextStyle.darkPurpleBoldS30,
              children: <TextSpan>[
                TextSpan(
                  text: LocaleKeys.onboardingSubTitle.tr(),
                  style: AppTextStyle.textColor1RegularS14,
                )
              ],
            ),
          ),
        ),
        ReactiveForm(
          formGroup: loginForm,
          child: Column(
            children: [
              _formInput(),
              RememberAndForgot(
                state: rememberState,
                setState: () => {
                  setState(() {
                    rememberState = !rememberState;
                  })
                },
              ),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return Container(
                    margin: const EdgeInsets.all(15),
                    child: CutomButton(
                      title: const Text(
                        LocaleKeys.authenticationLoginButtonTitle,
                        style: AppTextStyle.whiteBoldS14,
                      ).tr(),
                      backgroundColor: AppColors.egglantColor,
                      onPressed: () {
                        _onLogin(form);
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(left: 15, right: 15, top: 5),
          child: CutomButton(
            title: const Text(
              LocaleKeys.authenticationGoogleButtonTitle,
              style: AppTextStyle.egglantBoldS14,
            ).tr(),
            backgroundColor: AppColors.lavenderColor,
            onPressed: () {},
            icon: Container(
              margin: const EdgeInsets.only(right: 10),
              child: Image.asset(
                AppImages.google,
                width: 15,
                height: 20,
              ),
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SuggestionsText(
          textSuggestions: LocaleKeys.authenticationSuggestionsSignUp.tr(),
          textAction: LocaleKeys.authenticationSuggestionsActionSignUp.tr(),
          action: () {},
        ),
        TextButton(
          onPressed: () {
            if (Localizations.localeOf(context) == AppConfigs.appLanguageEn) {
              context.setLocale(AppConfigs.appLanguageVi);
            } else {
              context.setLocale(AppConfigs.appLanguageEn);
            }
          },
          child: const Text(LocaleKeys.changeLanguageTitle).tr(),
        ),
      ],
    );
  }

  Widget _formInput() {
    return Column(
      children: [
        InputReactiveForms(
          keyboardType: TextInputType.emailAddress,
          hintText: LocaleKeys.authenticationInputEmailHintText.tr(),
          obscureText: false,
          formController: formControlEmail,
          title: const Text(
            LocaleKeys.authenticationEmailInputTitle,
            style: AppTextStyle.darkPurpleBoldS14,
          ).tr(),
          validationMessages: {
            ValidationKeys.required: (error) =>
                LocaleKeys.authenticationInputRequired.tr(),
            ValidationKeys.email: (error) =>
                LocaleKeys.authenticationInputEmailFormatInCorrect.tr(),
          },
        ),
        InputReactiveForms(
          hintText: LocaleKeys.authenticationInputPasswordHintText.tr(),
          obscureText: showPassword,
          suffixIcon: _buildSuffixIcon(),
          formController: formControlPassword,
          title: const Text(
            LocaleKeys.authenticationPasswordInputTitle,
            style: AppTextStyle.darkPurpleBoldS14,
          ).tr(),
          validationMessages: {
            ValidationKeys.required: (error) =>
                LocaleKeys.authenticationInputRequired.tr(),
            ValidationKeys.nonAlphanumeric: (error) =>
                LocaleKeys.authenticationPasswordValidationMessages1.tr(),
            ValidationKeys.number: (error) =>
                LocaleKeys.authenticationPasswordValidationMessages2.tr(),
            ValidationKeys.lowerCase: (error) =>
                LocaleKeys.authenticationPasswordValidationMessages3.tr(),
            ValidationKeys.upperCase: (error) =>
                LocaleKeys.authenticationPasswordValidationMessages4.tr(),
            ValidationKeys.min: (error) =>
                LocaleKeys.authenticationPasswordValidationMessages5.tr(),
          },
        ),
      ],
    );
  }

  Widget _buildSuffixIcon() {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
      ),
      child: TextButton(
        onPressed: () {
          setState(() {
            showPassword = !showPassword;
          });
        },
        child: SvgPicture.asset(
          showPassword ? AppIcons.showEye : AppIcons.hideEye,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
