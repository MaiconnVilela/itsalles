import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_video_player.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_ler/nav_bar_ler_widget.dart';
import 'assistir4_widget.dart' show Assistir4Widget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class Assistir4Model extends FlutterFlowModel<Assistir4Widget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar_Ler component.
  late NavBarLerModel navBarLerModel;

  @override
  void initState(BuildContext context) {
    navBarLerModel = createModel(context, () => NavBarLerModel());
  }

  @override
  void dispose() {
    navBarLerModel.dispose();
  }
}
