import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/backend/firebase_storage/storage.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/upload_data.dart';
import '/nav_bar/nav_bar_filme_copy/nav_bar_filme_copy_widget.dart';
import '/nav_bar/nav_bar_ler/nav_bar_ler_widget.dart';
import 'dart:ui';
import 'criar_estudo2_widget.dart' show CriarEstudo2Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CriarEstudo2Model extends FlutterFlowModel<CriarEstudo2Widget> {
  ///  State fields for stateful widgets in this page.

  final formKey = GlobalKey<FormState>();
  // State field(s) for emailAddress-login widget.
  FocusNode? emailAddressLoginFocusNode1;
  TextEditingController? emailAddressLoginTextController1;
  String? Function(BuildContext, String?)?
      emailAddressLoginTextController1Validator;
  String? _emailAddressLoginTextController1Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório*';
    }

    if (val.length < 8) {
      return 'Mínimo 8 caracteres*';
    }

    return null;
  }

  // State field(s) for emailAddress-login widget.
  FocusNode? emailAddressLoginFocusNode2;
  TextEditingController? emailAddressLoginTextController2;
  String? Function(BuildContext, String?)?
      emailAddressLoginTextController2Validator;
  String? _emailAddressLoginTextController2Validator(
      BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Campo obrigatório*';
    }

    if (val.length < 2) {
      return 'Mínimo 6 caracteres*';
    }

    return null;
  }

  // State field(s) for link widget.
  FocusNode? linkFocusNode;
  TextEditingController? linkTextController;
  String? Function(BuildContext, String?)? linkTextControllerValidator;
  bool isDataUploading1 = false;
  FFUploadedFile uploadedLocalFile1 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl1 = '';

  bool isDataUploading2 = false;
  FFUploadedFile uploadedLocalFile2 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl2 = '';

  bool isDataUploading3 = false;
  FFUploadedFile uploadedLocalFile3 =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl3 = '';

  // Model for NavBar_Ler component.
  late NavBarLerModel navBarLerModel;
  // Model for NavBar_FilmeCopy component.
  late NavBarFilmeCopyModel navBarFilmeCopyModel;

  @override
  void initState(BuildContext context) {
    emailAddressLoginTextController1Validator =
        _emailAddressLoginTextController1Validator;
    emailAddressLoginTextController2Validator =
        _emailAddressLoginTextController2Validator;
    navBarLerModel = createModel(context, () => NavBarLerModel());
    navBarFilmeCopyModel = createModel(context, () => NavBarFilmeCopyModel());
  }

  @override
  void dispose() {
    emailAddressLoginFocusNode1?.dispose();
    emailAddressLoginTextController1?.dispose();

    emailAddressLoginFocusNode2?.dispose();
    emailAddressLoginTextController2?.dispose();

    linkFocusNode?.dispose();
    linkTextController?.dispose();

    navBarLerModel.dispose();
    navBarFilmeCopyModel.dispose();
  }
}
