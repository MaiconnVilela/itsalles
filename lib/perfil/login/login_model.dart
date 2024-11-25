import '/auth/firebase_auth/auth_util.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'dart:math';
import 'login_widget.dart' show LoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class LoginModel extends FlutterFlowModel<LoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress-login widget.
  FocusNode? emailAddressLoginFocusNode;
  TextEditingController? emailAddressLoginTextController;
  String? Function(BuildContext, String?)?
      emailAddressLoginTextControllerValidator;
  String? _emailAddressLoginTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório*';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Insira o e-mail cadastrado*';
    }
    return null;
  }

  // State field(s) for password-login widget.
  FocusNode? passwordLoginFocusNode;
  TextEditingController? passwordLoginTextController;
  late bool passwordLoginVisibility;
  String? Function(BuildContext, String?)? passwordLoginTextControllerValidator;
  String? _passwordLoginTextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório*';
    }

    if (val.length < 6) {
      return 'Mínimo 6 caracteres*';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    emailAddressLoginTextControllerValidator =
        _emailAddressLoginTextControllerValidator;
    passwordLoginVisibility = false;
    passwordLoginTextControllerValidator =
        _passwordLoginTextControllerValidator;
  }

  @override
  void dispose() {
    emailAddressLoginFocusNode?.dispose();
    emailAddressLoginTextController?.dispose();

    passwordLoginFocusNode?.dispose();
    passwordLoginTextController?.dispose();
  }
}
