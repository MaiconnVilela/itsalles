import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_filme/nav_bar_filme_widget.dart';
import 'filmes_widget.dart' show FilmesWidget;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

class FilmesModel extends FlutterFlowModel<FilmesWidget> {
  ///  State fields for stateful widgets in this page.

  // State field(s) for Carousel widget.
  CarouselSliderController? carouselController;
  int carouselCurrentIndex = 1;

  // Model for NavBar_Filme component.
  late NavBarFilmeModel navBarFilmeModel;

  @override
  void initState(BuildContext context) {
    navBarFilmeModel = createModel(context, () => NavBarFilmeModel());
  }

  @override
  void dispose() {
    navBarFilmeModel.dispose();
  }
}
