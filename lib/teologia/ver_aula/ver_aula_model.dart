import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_inicio/nav_bar_inicio_widget.dart';
import '/nav_bar/nav_bar_inicio_copy/nav_bar_inicio_copy_widget.dart';
import 'dart:ui';
import 'ver_aula_widget.dart' show VerAulaWidget;
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class VerAulaModel extends FlutterFlowModel<VerAulaWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for RatingBar22 widget.
  double? ratingBar22Value;
  // Model for NavBar_Inicio component.
  late NavBarInicioModel navBarInicioModel;
  // Model for NavBar_InicioCopy component.
  late NavBarInicioCopyModel navBarInicioCopyModel;

  @override
  void initState(BuildContext context) {
    navBarInicioModel = createModel(context, () => NavBarInicioModel());
    navBarInicioCopyModel = createModel(context, () => NavBarInicioCopyModel());
  }

  @override
  void dispose() {
    navBarInicioModel.dispose();
    navBarInicioCopyModel.dispose();
  }
}
