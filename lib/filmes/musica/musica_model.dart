import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_musica/nav_bar_musica_widget.dart';
import '/nav_bar/nav_bar_musica_copy/nav_bar_musica_copy_widget.dart';
import 'musica_widget.dart' show MusicaWidget;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class MusicaModel extends FlutterFlowModel<MusicaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar_Musica component.
  late NavBarMusicaModel navBarMusicaModel;
  // Model for NavBar_MusicaCopy component.
  late NavBarMusicaCopyModel navBarMusicaCopyModel;

  @override
  void initState(BuildContext context) {
    navBarMusicaModel = createModel(context, () => NavBarMusicaModel());
    navBarMusicaCopyModel = createModel(context, () => NavBarMusicaCopyModel());
  }

  @override
  void dispose() {
    navBarMusicaModel.dispose();
    navBarMusicaCopyModel.dispose();
  }
}
