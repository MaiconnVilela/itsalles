import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/biblia/components/livros/livros_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_biblia/nav_bar_biblia_widget.dart';
import '/nav_bar/nav_bar_biblia_copy/nav_bar_biblia_copy_widget.dart';
import 'biblia_widget.dart' show BibliaWidget;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';

class BibliaModel extends FlutterFlowModel<BibliaWidget> {
  ///  State fields for stateful widgets in this page.

  // Model for NavBar_Biblia component.
  late NavBarBibliaModel navBarBibliaModel;
  // Model for NavBar_BibliaCopy component.
  late NavBarBibliaCopyModel navBarBibliaCopyModel;

  @override
  void initState(BuildContext context) {
    navBarBibliaModel = createModel(context, () => NavBarBibliaModel());
    navBarBibliaCopyModel = createModel(context, () => NavBarBibliaCopyModel());
  }

  @override
  void dispose() {
    navBarBibliaModel.dispose();
    navBarBibliaCopyModel.dispose();
  }
}
