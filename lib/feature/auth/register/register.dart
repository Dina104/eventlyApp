import 'dart:developer';
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
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool securedpassword = true;
  bool securedRepassword = true;
  late TextEditingController _nameController;
  late TextEditingController _emailComtroller;
  late TextEditingController _passwordController;
  late TextEditingController _repasswordController;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController = TextEditingController();
    _emailComtroller = TextEditingController();
    _passwordController = TextEditingController();
    _repasswordController = TextEditingController();
  }

  Widget build(BuildContext context) {
    AppLocalizations appLocalization = AppLocalizations.of(context)!;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          appLocalization.register,
          style: GoogleFonts.inter(color: ColorsManager.blue),
        ),
      ),

      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: MediaQuery.of(context).viewInsets.top,
        ),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(AssetsManager.Logo, width: 131.w, height: 141.h),
                SizedBox(height: 24.h),
                CustomTextFormField(
                  controller: _nameController,
                  validator: Validator.validateName,

                  label: appLocalization.name,
                  prefixIcon: Icons.person_3_outlined,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _emailComtroller,
                  validator: Validator.validateEmail,
                  label: appLocalization.email,
                  prefixIcon: Icons.email,
                  KeyboardType: TextInputType.emailAddress,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _passwordController,
                  validator: Validator.validatePassword,
                  isSecure: securedpassword,
                  label: appLocalization.password,
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(
                    onPressed: () {
                      securedpassword = !securedpassword;
                      setState(() {});
                    },
                    icon: Icon(
                      securedpassword ? Icons.visibility_off : Icons.visibility,
                    ),
                  ),
                  KeyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 16.h),
                CustomTextFormField(
                  controller: _repasswordController,
                  validator: Validator.validateRePassword,
                  isSecure: securedRepassword,
                  label: appLocalization.re_password,
                  prefixIcon: Icons.lock,
                  suffixIcon: IconButton(
                    onPressed: () {
                      securedRepassword = !securedRepassword;
                      setState(() {});
                    },
                    icon: Icon(
                      securedRepassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                    ),
                  ),
                  KeyboardType: TextInputType.visiblePassword,
                ),
                SizedBox(height: 16.h),
                CustomElevatedButtom(
                  title: appLocalization.create_account,
                  onPress: _createAccount,
                ),
                SizedBox(height: 16.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "${appLocalization.already_have_account} ",
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                    CustomTextButtom(
                      textfield: appLocalization.login,
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          RoutesManager.login,
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _createAccount() async {
    if (formKey.currentState?.validate() == false) return;
    try {
      UIUtils.showLoading(context);
      UserCredential userCredential = await FirebaseService.register(
        _emailComtroller.text,
        _passwordController.text,
      );
      await FirebaseService.addUserToFireStore(
        UserModel(
          email: _emailComtroller.text,
          name: _nameController.text,
          id: userCredential.user!.uid,
          favouriteEventsIds: []

        ),
      );
      UIUtils.hideDialog(context);
      UIUtils.showtoastMessage("User Registered Successfully", Colors.green);
      Navigator.pushReplacementNamed(context, RoutesManager.login);
    } on FirebaseAuthException catch (exeption) {
      UIUtils.hideDialog(context);
      UIUtils.showtoastMessage(exeption.code, Colors.red);
    } catch (exeption) {
      UIUtils.showtoastMessage("Failed to Register", Colors.red);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailComtroller.dispose();
    _passwordController.dispose();
    _repasswordController.dispose();
    super.dispose();
  }
}
