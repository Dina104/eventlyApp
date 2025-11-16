import 'package:evently_app_app/core/Ui_Utils/Ui_Utils.dart';
import 'package:evently_app_app/core/resourese/assets_manager.dart';
import 'package:evently_app_app/core/resourese/colors_manager.dart';
import 'package:evently_app_app/core/resourese/validator.dart';
import 'package:evently_app_app/core/routes_manager/routes_manager.dart';
import 'package:evently_app_app/core/widget/custom_elevated_buttom.dart';
import 'package:evently_app_app/core/widget/custom_text_buttom.dart';
import 'package:evently_app_app/core/widget/custom_text_form_field.dart';
import 'package:evently_app_app/firebase_service/firebase_service.dart';
import 'package:evently_app_app/l10n/app_localizations.dart';
import 'package:evently_app_app/models/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  late TextEditingController _emailController;
  late TextEditingController _passwordController;
  bool securePassword = true;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _emailController = TextEditingController();
    _passwordController = TextEditingController();
  }

  Widget build(BuildContext context) {
    AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(AssetsManager.Logo, width: 136.w, height: 186.h),
              SizedBox(height: 24.sp),
              CustomTextFormField(
                label: appLocalization.email,
                validator: Validator.validateEmail,
                controller: _emailController,
                prefixIcon: Icons.email_outlined,
                KeyboardType: TextInputType.emailAddress,
              ),
              SizedBox(height: 16.sp),
              CustomTextFormField(
                isSecure: securePassword,
                label: appLocalization.password,
                validator: Validator.validatePassword,
                controller: _passwordController,
                KeyboardType: TextInputType.visiblePassword,
                prefixIcon: Icons.lock,
                suffixIcon: IconButton(
                  onPressed: onPasswordIconClicked,
                  icon: Icon(
                    securePassword ? Icons.visibility_off : Icons.visibility,
                  ),
                ),
              ),
              SizedBox(height: 24.sp),
              CustomTextButtom(
                textfield: "${appLocalization.forget_password}",
                textAlign: TextAlign.right,
                onTap: () {},
              ),
              SizedBox(height: 24.sp),
              CustomElevatedButtom(
                title: appLocalization.login,
                onPress: _Login,
              ),
              SizedBox(height: 16.sp),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "${appLocalization.dont_have_account}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  CustomTextButtom(
                    textfield: appLocalization.create_account,
                    onTap: () {
                      Navigator.pushReplacementNamed(
                        context,
                        RoutesManager.register,
                      );
                    },
                  ),
                ],
              ),
              SizedBox(height: 24.sp),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: ColorsManager.blue,
                      endIndent: 14,
                      indent: 14,
                    ),
                  ),
                  Text(
                    " Or ",
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: ColorsManager.black,
                    ),
                  ),
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: ColorsManager.blue,
                      endIndent: 14,
                      indent: 14,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.sp),
              OutlinedButton(
                style: OutlinedButton.styleFrom(
                  padding: REdgeInsets.symmetric(vertical: 16),
                  side: BorderSide(color: ColorsManager.blue, width: 2),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                onPressed: () {},
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(AssetsManager.GoogleLogo),
                    SizedBox(width: 2),
                    Text(
                      "Login With Google",
                      style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: ColorsManager.blue,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void onPasswordIconClicked() {
    setState(() {
      securePassword = !securePassword;
    });
  }

  void _Login() async {
    if (_formKey.currentState?.validate() == false) return;
    try {
      UIUtils.showLoading(context);
      UserCredential userCredential = await FirebaseService.login(
        _emailController.text,
        _passwordController.text,
      );
      UserModel.currentUser=await FirebaseService.getUsersFromFireStoreById(userCredential.user!.uid);
      UIUtils.hideDialog(context);
      UIUtils.showtoastMessage("Logged-In Successfully", Colors.green);

      Navigator.pushReplacementNamed(context, RoutesManager.mainlayout);
    } on FirebaseAuthException catch (exception) {
      UIUtils.hideDialog(context);
      UIUtils.showtoastMessage("Wrong Email or Password", Colors.red);
    } catch (exception) {
      UIUtils.hideDialog(context);
      print(exception.toString());
      UIUtils.showtoastMessage("Failed To Login ", Colors.red);
    }
  }
}
