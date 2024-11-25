import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_filme/nav_bar_filme_widget.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'filmes_model.dart';
export 'filmes_model.dart';

class FilmesWidget extends StatefulWidget {
  const FilmesWidget({
    super.key,
    this.userProfile,
  });

  final DocumentReference? userProfile;

  @override
  State<FilmesWidget> createState() => _FilmesWidgetState();
}

class _FilmesWidgetState extends State<FilmesWidget> {
  late FilmesModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => FilmesModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFF0B0D0F),
      appBar: AppBar(
        backgroundColor: Color(0xFF111417),
        automaticallyImplyLeading: false,
        actions: [
          Padding(
            padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: AlignmentDirectional(1.0, 0.0),
                  child: InkWell(
                    splashColor: Colors.transparent,
                    focusColor: Colors.transparent,
                    hoverColor: Colors.transparent,
                    highlightColor: Colors.transparent,
                    onTap: () async {
                      context.pushNamed(
                        'Perfil',
                        extra: <String, dynamic>{
                          kTransitionInfoKey: TransitionInfo(
                            hasTransition: true,
                            transitionType: PageTransitionType.fade,
                          ),
                        },
                      );
                    },
                    child: Icon(
                      Icons.account_circle_sharp,
                      color: Color(0xFF5E6C73),
                      size: 30.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
        centerTitle: true,
        elevation: 3.0,
      ),
      body: SafeArea(
        top: true,
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 68.0),
              child: SingleChildScrollView(
                primary: false,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      width: 100.0,
                      height: 225.0,
                      decoration: BoxDecoration(
                        color: Color(0xFF111417),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(12.0),
                          bottomRight: Radius.circular(12.0),
                          topLeft: Radius.circular(0.0),
                          topRight: Radius.circular(0.0),
                        ),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  10.0, 0.0, 10.0, 0.0),
                              child: StreamBuilder<List<BannerFilmesRecord>>(
                                stream: queryBannerFilmesRecord(),
                                builder: (context, snapshot) {
                                  // Customize what your widget looks like when it's loading.
                                  if (!snapshot.hasData) {
                                    return Center(
                                      child: SizedBox(
                                        width: 30.0,
                                        height: 30.0,
                                        child: CircularProgressIndicator(
                                          valueColor:
                                              AlwaysStoppedAnimation<Color>(
                                            Color(0xF09C9C9C),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                  List<BannerFilmesRecord>
                                      carouselBannerFilmesRecordList =
                                      snapshot.data!;

                                  return Container(
                                    width: double.infinity,
                                    height: 200.0,
                                    child: CarouselSlider.builder(
                                      itemCount:
                                          carouselBannerFilmesRecordList.length,
                                      itemBuilder: (context, carouselIndex, _) {
                                        final carouselBannerFilmesRecord =
                                            carouselBannerFilmesRecordList[
                                                carouselIndex];
                                        return InkWell(
                                          splashColor: Colors.transparent,
                                          focusColor: Colors.transparent,
                                          hoverColor: Colors.transparent,
                                          highlightColor: Colors.transparent,
                                          onTap: () async {
                                            await Navigator.push(
                                              context,
                                              PageTransition(
                                                type: PageTransitionType.fade,
                                                child:
                                                    FlutterFlowExpandedImageView(
                                                  image: Image.network(
                                                    carouselBannerFilmesRecord
                                                        .img,
                                                    fit: BoxFit.contain,
                                                  ),
                                                  allowRotation: false,
                                                  useHeroAnimation: false,
                                                ),
                                              ),
                                            );
                                          },
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              carouselBannerFilmesRecord.img,
                                              width: 300.0,
                                              height: 200.0,
                                              fit: BoxFit.fill,
                                            ),
                                          ),
                                        );
                                      },
                                      carouselController:
                                          _model.carouselController ??=
                                              CarouselSliderController(),
                                      options: CarouselOptions(
                                        initialPage: max(
                                            0,
                                            min(
                                                1,
                                                carouselBannerFilmesRecordList
                                                        .length -
                                                    1)),
                                        viewportFraction: 1.0,
                                        disableCenter: true,
                                        enlargeCenterPage: true,
                                        enlargeFactor: 0.25,
                                        enableInfiniteScroll: true,
                                        scrollDirection: Axis.horizontal,
                                        autoPlay: false,
                                        onPageChanged: (index, _) =>
                                            _model.carouselCurrentIndex = index,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 20.0, 10.0, 15.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StreamBuilder<List<TituloFilmesRecord>>(
                            stream: queryTituloFilmesRecord(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 30.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xF09C9C9C),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<TituloFilmesRecord>
                                  textTituloFilmesRecordList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final textTituloFilmesRecord =
                                  textTituloFilmesRecordList.isNotEmpty
                                      ? textTituloFilmesRecordList.first
                                      : null;

                              return Text(
                                textTituloFilmesRecord!.nome1,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                      child: StreamBuilder<List<ListaFilmes1Record>>(
                        stream: queryListaFilmes1Record(
                          queryBuilder: (listaFilmes1Record) =>
                              listaFilmes1Record.orderBy('Data',
                                  descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xF09C9C9C),
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ListaFilmes1Record> rowListaFilmes1RecordList =
                              snapshot.data!;

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  rowListaFilmes1RecordList.length, (rowIndex) {
                                final rowListaFilmes1Record =
                                    rowListaFilmes1RecordList[rowIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'Assistir1',
                                            queryParameters: {
                                              'filme': serializeParam(
                                                rowListaFilmes1Record.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 114.0,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF14181B),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              rowListaFilmes1Record.img,
                                              width: 123.0,
                                              height: 73.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 5.0, 0.0),
                                        child: Text(
                                          rowListaFilmes1Record.nome,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Colors.white,
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          rowListaFilmes1Record.detalhes,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 9.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StreamBuilder<List<TituloFilmesRecord>>(
                            stream: queryTituloFilmesRecord(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 30.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xF09C9C9C),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<TituloFilmesRecord>
                                  textTituloFilmesRecordList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final textTituloFilmesRecord =
                                  textTituloFilmesRecordList.isNotEmpty
                                      ? textTituloFilmesRecordList.first
                                      : null;

                              return Text(
                                textTituloFilmesRecord!.nome2,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                      child: StreamBuilder<List<ListaFilmes2Record>>(
                        stream: queryListaFilmes2Record(
                          queryBuilder: (listaFilmes2Record) =>
                              listaFilmes2Record.orderBy('Data',
                                  descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xF09C9C9C),
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ListaFilmes2Record> rowListaFilmes2RecordList =
                              snapshot.data!;

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  rowListaFilmes2RecordList.length, (rowIndex) {
                                final rowListaFilmes2Record =
                                    rowListaFilmes2RecordList[rowIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'Assistir2',
                                            queryParameters: {
                                              'filme2': serializeParam(
                                                rowListaFilmes2Record.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 114.0,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF14181B),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              rowListaFilmes2Record.img,
                                              width: 123.0,
                                              height: 73.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 5.0, 0.0),
                                        child: Text(
                                          rowListaFilmes2Record.nome,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Colors.white,
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          rowListaFilmes2Record.detalhes,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StreamBuilder<List<TituloFilmesRecord>>(
                            stream: queryTituloFilmesRecord(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 30.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xF09C9C9C),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<TituloFilmesRecord>
                                  textTituloFilmesRecordList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final textTituloFilmesRecord =
                                  textTituloFilmesRecordList.isNotEmpty
                                      ? textTituloFilmesRecordList.first
                                      : null;

                              return Text(
                                textTituloFilmesRecord!.nome3,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                      child: StreamBuilder<List<ListaFilmes3Record>>(
                        stream: queryListaFilmes3Record(
                          queryBuilder: (listaFilmes3Record) =>
                              listaFilmes3Record.orderBy('Data',
                                  descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xF09C9C9C),
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ListaFilmes3Record> rowListaFilmes3RecordList =
                              snapshot.data!;

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  rowListaFilmes3RecordList.length, (rowIndex) {
                                final rowListaFilmes3Record =
                                    rowListaFilmes3RecordList[rowIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'Assistir3',
                                            queryParameters: {
                                              'filme3': serializeParam(
                                                rowListaFilmes3Record.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 114.0,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF14181B),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              rowListaFilmes3Record.img,
                                              width: 123.0,
                                              height: 73.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 5.0, 0.0),
                                        child: Text(
                                          rowListaFilmes3Record.nome,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Colors.white,
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          rowListaFilmes3Record.detalhes,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(
                          10.0, 10.0, 10.0, 10.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StreamBuilder<List<TituloFilmesRecord>>(
                            stream: queryTituloFilmesRecord(
                              singleRecord: true,
                            ),
                            builder: (context, snapshot) {
                              // Customize what your widget looks like when it's loading.
                              if (!snapshot.hasData) {
                                return Center(
                                  child: SizedBox(
                                    width: 30.0,
                                    height: 30.0,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                        Color(0xF09C9C9C),
                                      ),
                                    ),
                                  ),
                                );
                              }
                              List<TituloFilmesRecord>
                                  textTituloFilmesRecordList = snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final textTituloFilmesRecord =
                                  textTituloFilmesRecordList.isNotEmpty
                                      ? textTituloFilmesRecordList.first
                                      : null;

                              return Text(
                                textTituloFilmesRecord!.nome4,
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Plus Jakarta Sans',
                                      color: Colors.white,
                                      fontSize: 13.0,
                                      letterSpacing: 0.0,
                                    ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsetsDirectional.fromSTEB(10.0, 0.0, 10.0, 10.0),
                      child: StreamBuilder<List<ListaFilmes4Record>>(
                        stream: queryListaFilmes4Record(
                          queryBuilder: (listaFilmes4Record) =>
                              listaFilmes4Record.orderBy('Data',
                                  descending: true),
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 30.0,
                                height: 30.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    Color(0xF09C9C9C),
                                  ),
                                ),
                              ),
                            );
                          }
                          List<ListaFilmes4Record> rowListaFilmes4RecordList =
                              snapshot.data!;

                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: List.generate(
                                  rowListaFilmes4RecordList.length, (rowIndex) {
                                final rowListaFilmes4Record =
                                    rowListaFilmes4RecordList[rowIndex];
                                return Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 8.0, 0.0),
                                      child: InkWell(
                                        splashColor: Colors.transparent,
                                        focusColor: Colors.transparent,
                                        hoverColor: Colors.transparent,
                                        highlightColor: Colors.transparent,
                                        onTap: () async {
                                          context.pushNamed(
                                            'Assistir4',
                                            queryParameters: {
                                              'filme4': serializeParam(
                                                rowListaFilmes4Record.reference,
                                                ParamType.DocumentReference,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              kTransitionInfoKey:
                                                  TransitionInfo(
                                                hasTransition: true,
                                                transitionType:
                                                    PageTransitionType.fade,
                                              ),
                                            },
                                          );
                                        },
                                        child: Container(
                                          width: 114.0,
                                          height: 150.0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFF14181B),
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 10.0,
                                                color: Color(0x33000000),
                                                offset: Offset(
                                                  0.0,
                                                  2.0,
                                                ),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8.0),
                                            child: Image.network(
                                              rowListaFilmes4Record.img,
                                              width: 123.0,
                                              height: 73.0,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 5.0, 5.0, 0.0),
                                        child: Text(
                                          rowListaFilmes4Record.nome,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Open Sans',
                                                color: Colors.white,
                                                fontSize: 11.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 5.0, 0.0),
                                        child: Text(
                                          rowListaFilmes4Record.detalhes,
                                          textAlign: TextAlign.start,
                                          style: FlutterFlowTheme.of(context)
                                              .bodyMedium
                                              .override(
                                                fontFamily: 'Plus Jakarta Sans',
                                                color: Color(0xFF95A1AC),
                                                fontSize: 10.0,
                                                letterSpacing: 0.0,
                                                fontWeight: FontWeight.w300,
                                              ),
                                        ),
                                      ),
                                    ),
                                  ],
                                );
                              }),
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: AlignmentDirectional(0.0, 1.0),
              child: wrapWithModel(
                model: _model.navBarFilmeModel,
                updateCallback: () => safeSetState(() {}),
                child: NavBarFilmeWidget(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
