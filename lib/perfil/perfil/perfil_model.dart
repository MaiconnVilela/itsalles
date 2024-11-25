import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_animations.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_ler/nav_bar_ler_widget.dart';
import '/nav_bar/nav_bar_ler_copy/nav_bar_ler_copy_widget.dart';
import 'dart:math';
import 'perfil_widget.dart' show PerfilWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class PerfilModel extends FlutterFlowModel<PerfilWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar_Ler component.
  late NavBarLerModel navBarLerModel;
  // Model for NavBar_LerCopy component.
  late NavBarLerCopyModel navBarLerCopyModel;

  @override
  void initState(BuildContext context) {
    navBarLerModel = createModel(context, () => NavBarLerModel());
    navBarLerCopyModel = createModel(context, () => NavBarLerCopyModel());
  }

  @override
  void dispose() {
    navBarLerModel.dispose();
    navBarLerCopyModel.dispose();
  }
}
