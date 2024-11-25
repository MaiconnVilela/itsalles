import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/components/deletar_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_filme_copy/nav_bar_filme_copy_widget.dart';
import '/nav_bar/nav_bar_ler/nav_bar_ler_widget.dart';
import 'dart:ui';
import 'editar_estudoo_widget.dart' show EditarEstudooWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class EditarEstudooModel extends FlutterFlowModel<EditarEstudooWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Titulo widget.
  FocusNode? tituloFocusNode;
  TextEditingController? tituloTextController;
  String? Function(BuildContext, String?)? tituloTextControllerValidator;
  String? _tituloTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório*';
    }

    if (val.length < 5) {
      return 'Mínimo 5 caracteres*';
    }

    return null;
  }

  // State field(s) for numeroAULA widget.
  FocusNode? numeroAULAFocusNode;
  TextEditingController? numeroAULATextController;
  String? Function(BuildContext, String?)? numeroAULATextControllerValidator;
  String? _numeroAULATextControllerValidator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório*';
    }

    if (val.length < 1) {
      return 'Mínimo 1 caracteres*';
    }

    return null;
  }

  // Model for NavBar_Ler component.
  late NavBarLerModel navBarLerModel;
  // Model for NavBar_FilmeCopy component.
  late NavBarFilmeCopyModel navBarFilmeCopyModel;

  @override
  void initState(BuildContext context) {
    tituloTextControllerValidator = _tituloTextControllerValidator;
    numeroAULATextControllerValidator = _numeroAULATextControllerValidator;
    navBarLerModel = createModel(context, () => NavBarLerModel());
    navBarFilmeCopyModel = createModel(context, () => NavBarFilmeCopyModel());
  }

  @override
  void dispose() {
    tituloFocusNode?.dispose();
    tituloTextController?.dispose();

    numeroAULAFocusNode?.dispose();
    numeroAULATextController?.dispose();

    navBarLerModel.dispose();
    navBarFilmeCopyModel.dispose();
  }
}
