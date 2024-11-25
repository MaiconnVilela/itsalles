import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'certificado_widget.dart' show CertificadoWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CertificadoModel extends FlutterFlowModel<CertificadoWidget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for Editar_Nom widget.
  FocusNode? editarNomFocusNode;
  TextEditingController? editarNomTextController;
  String? Function(BuildContext, String?)? editarNomTextControllerValidator;
  String? _editarNomTextControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório*';
    }

    if (val.length < 4) {
      return 'Mínimo 4 caracteres*';
    }

    return null;
  }

  @override
  void initState(BuildContext context) {
    editarNomTextControllerValidator = _editarNomTextControllerValidator;
  }

  @override
  void dispose() {
    editarNomFocusNode?.dispose();
    editarNomTextController?.dispose();
  }
}
