import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/deletar_u_s_u_a_r_i_o_copy_widget.dart';
import '/components/ver_usuario_widget.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_ler/nav_bar_ler_widget.dart';
import 'dart:math';
import 'criar_login_widget.dart' show CriarLoginWidget;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class CriarLoginModel extends FlutterFlowModel<CriarLoginWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for nome widget.
  FocusNode? nomeFocusNode1;
  TextEditingController? nomeTextController1;
  String? Function(BuildContext, String?)? nomeTextController1Validator;
  String? _nomeTextController1Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório*';
    }

    if (val.length < 4) {
      return 'Mínimo 4 caracteres*';
    }

    return null;
  }

  // State field(s) for nome widget.
  FocusNode? nomeFocusNode2;
  TextEditingController? nomeTextController2;
  String? Function(BuildContext, String?)? nomeTextController2Validator;
  String? _nomeTextController2Validator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório*';
    }

    if (val.length < 4) {
      return 'Mínimo 4 caracteres*';
    }

    return null;
  }

  // State field(s) for email widget.
  FocusNode? emailFocusNode;
  TextEditingController? emailTextController;
  String? Function(BuildContext, String?)? emailTextControllerValidator;
  String? _emailTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório*';
    }

    if (!RegExp(kTextValidatorEmailRegex).hasMatch(val)) {
      return 'Insira um  e-mail válido*';
    }
    return null;
  }

  // State field(s) for senha widget.
  FocusNode? senhaFocusNode;
  TextEditingController? senhaTextController;
  late bool senhaVisibility;
  String? Function(BuildContext, String?)? senhaTextControllerValidator;
  String? _senhaTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório*';
    }

    if (val.length < 6) {
      return 'Precisa conter 6 dígitos*';
    }

    return null;
  }

  // Model for NavBar_Ler component.
  late NavBarLerModel navBarLerModel;

  @override
  void initState(BuildContext context) {
    nomeTextController1Validator = _nomeTextController1Validator;
    nomeTextController2Validator = _nomeTextController2Validator;
    emailTextControllerValidator = _emailTextControllerValidator;
    senhaVisibility = false;
    senhaTextControllerValidator = _senhaTextControllerValidator;
    navBarLerModel = createModel(context, () => NavBarLerModel());
  }

  @override
  void dispose() {
    nomeFocusNode1?.dispose();
    nomeTextController1?.dispose();

    nomeFocusNode2?.dispose();
    nomeTextController2?.dispose();

    emailFocusNode?.dispose();
    emailTextController?.dispose();

    senhaFocusNode?.dispose();
    senhaTextController?.dispose();

    navBarLerModel.dispose();
  }
}
