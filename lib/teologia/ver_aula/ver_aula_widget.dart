import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_inicio/nav_bar_inicio_widget.dart';
import '/nav_bar/nav_bar_inicio_copy/nav_bar_inicio_copy_widget.dart';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'ver_aula_model.dart';
export 'ver_aula_model.dart';

class VerAulaWidget extends StatefulWidget {
  const VerAulaWidget({super.key});

  @override
  State<VerAulaWidget> createState() => _VerAulaWidgetState();
}

class _VerAulaWidgetState extends State<VerAulaWidget> {
  late VerAulaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => VerAulaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
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
          child: StreamBuilder<List<FilmeRecord>>(
            stream: queryFilmeRecord(
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
              List<FilmeRecord> stackFilmeRecordList = snapshot.data!;
              // Return an empty Container when the item does not exist.
              if (snapshot.data!.isEmpty) {
                return Container();
              }
              final stackFilmeRecord = stackFilmeRecordList.isNotEmpty
                  ? stackFilmeRecordList.first
                  : null;

              return Stack(
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding:
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 68.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: double.infinity,
                                height: 378.0,
                                child: Stack(
                                  alignment: AlignmentDirectional(0.0, -1.0),
                                  children: [
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.0, -1.0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 2.0),
                                        child: Image.asset(
                                          'assets/images/WhatsApp_Image_2024-08-12_at_13.19.14.jpeg',
                                          width: double.infinity,
                                          height: 500.0,
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(0.0, 1.0),
                                      child: ClipRRect(
                                        child: BackdropFilter(
                                          filter: ImageFilter.blur(
                                            sigmaX: 4.0,
                                            sigmaY: 10.0,
                                          ),
                                          child: Container(
                                            width: double.infinity,
                                            height: 506.0,
                                            decoration: BoxDecoration(
                                              color: Color(0x801D2429),
                                            ),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(
                                                      15.0, 0.0, 15.0, 0.0),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    width: 152.0,
                                                    height: 206.0,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00FFFFFF),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                      child: Image.asset(
                                                        'assets/images/WhatsApp_Image_2024-08-12_at_13.19.14.jpeg',
                                                        width: 152.0,
                                                        height: 213.0,
                                                        fit: BoxFit.cover,
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment:
                                          AlignmentDirectional(0.02, 0.68),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0.0, 95.0, 0.0, 0.0),
                                        child:
                                            StreamBuilder<List<TeologiaRecord>>(
                                          stream: queryTeologiaRecord(
                                            singleRecord: true,
                                          ),
                                          builder: (context, snapshot) {
                                            // Customize what your widget looks like when it's loading.
                                            if (!snapshot.hasData) {
                                              return Center(
                                                child: SizedBox(
                                                  width: 30.0,
                                                  height: 30.0,
                                                  child:
                                                      CircularProgressIndicator(
                                                    valueColor:
                                                        AlwaysStoppedAnimation<
                                                            Color>(
                                                      Color(0xF09C9C9C),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }
                                            List<TeologiaRecord>
                                                ratingBar22TeologiaRecordList =
                                                snapshot.data!;
                                            // Return an empty Container when the item does not exist.
                                            if (snapshot.data!.isEmpty) {
                                              return Container();
                                            }
                                            final ratingBar22TeologiaRecord =
                                                ratingBar22TeologiaRecordList
                                                        .isNotEmpty
                                                    ? ratingBar22TeologiaRecordList
                                                        .first
                                                    : null;

                                            return InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              child: RatingBar.builder(
                                                onRatingUpdate: (newValue) {
                                                  safeSetState(() =>
                                                      _model.ratingBar22Value =
                                                          newValue);
                                                  if (_model.ratingBar22Value ==
                                                      1.0) {
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(
                                                      SnackBar(
                                                        content: Text(
                                                          'Sua avaliação foi atualizada para 1 estrela',
                                                          style: TextStyle(
                                                            color: Color(
                                                                0xFFFFFFF7),
                                                          ),
                                                        ),
                                                        duration: Duration(
                                                            milliseconds: 2000),
                                                        backgroundColor:
                                                            Color(0xFF048331),
                                                      ),
                                                    );
                                                  } else {
                                                    if (_model
                                                            .ratingBar22Value ==
                                                        2.0) {
                                                      ScaffoldMessenger.of(
                                                              context)
                                                          .showSnackBar(
                                                        SnackBar(
                                                          content: Text(
                                                            'Sua avaliação foi atualizada para 2 estrelas',
                                                            style: TextStyle(
                                                              color: Color(
                                                                  0xFFFFFFF7),
                                                            ),
                                                          ),
                                                          duration: Duration(
                                                              milliseconds:
                                                                  2000),
                                                          backgroundColor:
                                                              Color(0xFF048331),
                                                        ),
                                                      );
                                                    } else {
                                                      if (_model
                                                              .ratingBar22Value ==
                                                          3.0) {
                                                        ScaffoldMessenger.of(
                                                                context)
                                                            .showSnackBar(
                                                          SnackBar(
                                                            content: Text(
                                                              'Sua avaliação foi atualizada para 3 estrelas',
                                                              style: TextStyle(
                                                                color: Color(
                                                                    0xFFFFFFF7),
                                                              ),
                                                            ),
                                                            duration: Duration(
                                                                milliseconds:
                                                                    2000),
                                                            backgroundColor:
                                                                Color(
                                                                    0xFF048331),
                                                          ),
                                                        );
                                                      } else {
                                                        if (_model
                                                                .ratingBar22Value ==
                                                            4.0) {
                                                          ScaffoldMessenger.of(
                                                                  context)
                                                              .showSnackBar(
                                                            SnackBar(
                                                              content: Text(
                                                                'Sua avaliação foi atualizada para 4 estrelas',
                                                                style:
                                                                    TextStyle(
                                                                  color: Color(
                                                                      0xFFFFFFF7),
                                                                ),
                                                              ),
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      2000),
                                                              backgroundColor:
                                                                  Color(
                                                                      0xFF048331),
                                                            ),
                                                          );
                                                        } else {
                                                          if (_model
                                                                  .ratingBar22Value ==
                                                              5.0) {
                                                            ScaffoldMessenger
                                                                    .of(context)
                                                                .showSnackBar(
                                                              SnackBar(
                                                                content: Text(
                                                                  'Sua avaliação foi atualizada para 5 estrelas',
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0xFFFFFFF7),
                                                                  ),
                                                                ),
                                                                duration: Duration(
                                                                    milliseconds:
                                                                        2000),
                                                                backgroundColor:
                                                                    Color(
                                                                        0xFF048331),
                                                              ),
                                                            );
                                                          }
                                                        }
                                                      }
                                                    }
                                                  }
                                                },
                                                itemBuilder: (context, index) =>
                                                    Icon(
                                                  Icons.star_rounded,
                                                  color: Color(0xFFE8790A),
                                                ),
                                                direction: Axis.horizontal,
                                                initialRating: _model
                                                    .ratingBar22Value ??= 0.0,
                                                unratedColor: Color(0xFF757575),
                                                itemCount: 5,
                                                itemSize: 40.0,
                                                glowColor: Color(0xFFE8790A),
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
                                    10.0, 16.0, 10.0, 8.0),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'INTRODUÇÃO À TEOLOGIA',
                                      style: FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Colors.white,
                                            fontSize: 12.0,
                                            letterSpacing: 0.0,
                                          ),
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (valueOrDefault<bool>(
                                                currentUserDocument?.bacharel,
                                                false) ==
                                            true)
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0.0, 0.0, 5.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) =>
                                                  FFButtonWidget(
                                                onPressed: () async {
                                                  context
                                                      .pushNamed('Ver_Aula2');
                                                },
                                                text: 'Bacharel',
                                                options: FFButtonOptions(
                                                  height: 26.0,
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(
                                                          16.0, 0.0, 16.0, 0.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFFF96E31),
                                                  textStyle:
                                                      FlutterFlowTheme.of(
                                                              context)
                                                          .titleSmall
                                                          .override(
                                                            fontFamily:
                                                                'Plus Jakarta Sans',
                                                            color: Colors.white,
                                                            letterSpacing: 0.0,
                                                          ),
                                                  elevation: 4.0,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          8.0),
                                                ),
                                              ),
                                            ),
                                          ),
                                        if (valueOrDefault<bool>(
                                                currentUserDocument?.adm,
                                                false) ==
                                            true)
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: AuthUserStreamWidget(
                                              builder: (context) => InkWell(
                                                splashColor: Colors.transparent,
                                                focusColor: Colors.transparent,
                                                hoverColor: Colors.transparent,
                                                highlightColor:
                                                    Colors.transparent,
                                                onTap: () async {
                                                  context.pushNamed(
                                                    'Criar_Estudo',
                                                    extra: <String, dynamic>{
                                                      kTransitionInfoKey:
                                                          TransitionInfo(
                                                        hasTransition: true,
                                                        transitionType:
                                                            PageTransitionType
                                                                .fade,
                                                      ),
                                                    },
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.add_circle_outline,
                                                  color: Color(0xFF95A1AC),
                                                  size: 20.0,
                                                ),
                                              ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        10.0, 0.0, 10.0, 0.0),
                                    child: StreamBuilder<List<TeologiaRecord>>(
                                      stream: queryTeologiaRecord(
                                        queryBuilder: (teologiaRecord) =>
                                            teologiaRecord.orderBy('Aula'),
                                      ),
                                      builder: (context, snapshot) {
                                        // Customize what your widget looks like when it's loading.
                                        if (!snapshot.hasData) {
                                          return Center(
                                            child: SizedBox(
                                              width: 30.0,
                                              height: 30.0,
                                              child: CircularProgressIndicator(
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  Color(0xF09C9C9C),
                                                ),
                                              ),
                                            ),
                                          );
                                        }
                                        List<TeologiaRecord>
                                            columnTeologiaRecordList =
                                            snapshot.data!;

                                        return SingleChildScrollView(
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.stretch,
                                            children: List.generate(
                                                columnTeologiaRecordList.length,
                                                (columnIndex) {
                                              final columnTeologiaRecord =
                                                  columnTeologiaRecordList[
                                                      columnIndex];
                                              return Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(
                                                        0.0, 0.0, 0.0, 8.0),
                                                child: InkWell(
                                                  splashColor:
                                                      Colors.transparent,
                                                  focusColor:
                                                      Colors.transparent,
                                                  hoverColor:
                                                      Colors.transparent,
                                                  highlightColor:
                                                      Colors.transparent,
                                                  onTap: () async {
                                                    context.pushNamed(
                                                      'Ver_Teologia',
                                                      queryParameters: {
                                                        'verTeologia':
                                                            serializeParam(
                                                          columnTeologiaRecord
                                                              .reference,
                                                          ParamType
                                                              .DocumentReference,
                                                        ),
                                                      }.withoutNulls,
                                                      extra: <String, dynamic>{
                                                        kTransitionInfoKey:
                                                            TransitionInfo(
                                                          hasTransition: true,
                                                          transitionType:
                                                              PageTransitionType
                                                                  .fade,
                                                        ),
                                                      },
                                                    );
                                                  },
                                                  child: Material(
                                                    color: Colors.transparent,
                                                    elevation: 4.0,
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8.0),
                                                    ),
                                                    child: Container(
                                                      width: double.infinity,
                                                      height: 100.0,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFF111417),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8.0),
                                                      ),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Expanded(
                                                                child: Stack(
                                                                  children: [
                                                                    Stack(
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              ClipRRect(
                                                                            borderRadius:
                                                                                BorderRadius.circular(8.0),
                                                                            child:
                                                                                Image.network(
                                                                              columnTeologiaRecord.capa,
                                                                              width: 165.0,
                                                                              height: 100.0,
                                                                              fit: BoxFit.cover,
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0.0,
                                                                              0.0),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            70.0,
                                                                            4.0,
                                                                            0.0,
                                                                            0.0),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .play_circle,
                                                                          color:
                                                                              Color(0xFF363D40),
                                                                          size:
                                                                              28.0,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    if (valueOrDefault<bool>(
                                                                            currentUserDocument?.adm,
                                                                            false) ==
                                                                        true)
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -1.0,
                                                                            -1.0),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              7.0,
                                                                              7.0,
                                                                              0.0,
                                                                              0.0),
                                                                          child:
                                                                              AuthUserStreamWidget(
                                                                            builder: (context) =>
                                                                                InkWell(
                                                                              splashColor: Colors.transparent,
                                                                              focusColor: Colors.transparent,
                                                                              hoverColor: Colors.transparent,
                                                                              highlightColor: Colors.transparent,
                                                                              onTap: () async {
                                                                                context.pushNamed(
                                                                                  'Editar_CapaAulas',
                                                                                  queryParameters: {
                                                                                    'editar': serializeParam(
                                                                                      columnTeologiaRecord.reference,
                                                                                      ParamType.DocumentReference,
                                                                                    ),
                                                                                  }.withoutNulls,
                                                                                  extra: <String, dynamic>{
                                                                                    kTransitionInfoKey: TransitionInfo(
                                                                                      hasTransition: true,
                                                                                      transitionType: PageTransitionType.fade,
                                                                                    ),
                                                                                  },
                                                                                );
                                                                              },
                                                                              child: Icon(
                                                                                Icons.edit_sharp,
                                                                                color: FlutterFlowTheme.of(context).secondaryText,
                                                                                size: 20.0,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10.0,
                                                                          0.0,
                                                                          0.0,
                                                                          0.0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Expanded(
                                                                    child:
                                                                        Stack(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              -1.0,
                                                                              0.0),
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0.0,
                                                                              0.0,
                                                                              5.0,
                                                                              0.0),
                                                                          child:
                                                                              Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            mainAxisAlignment:
                                                                                MainAxisAlignment.start,
                                                                            children: [
                                                                              Text(
                                                                                columnTeologiaRecord.aula,
                                                                                textAlign: TextAlign.start,
                                                                                style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                      fontFamily: 'Plus Jakarta Sans',
                                                                                      color: Colors.white,
                                                                                      fontSize: 12.0,
                                                                                      letterSpacing: 0.0,
                                                                                      lineHeight: 2.0,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 3.0, 0.0),
                                                                                child: Text(
                                                                                  '- ',
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        color: Colors.white,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 2.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 5.0, 0.0),
                                                                                child: Text(
                                                                                  columnTeologiaRecord.titulo.maybeHandleOverflow(
                                                                                    maxChars: 22,
                                                                                    replacement: '…',
                                                                                  ),
                                                                                  textAlign: TextAlign.start,
                                                                                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                                                                                        fontFamily: 'Plus Jakarta Sans',
                                                                                        color: Colors.white,
                                                                                        fontSize: 12.0,
                                                                                        letterSpacing: 0.0,
                                                                                        lineHeight: 2.0,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        if (valueOrDefault<bool>(currentUserDocument?.adm,
                                                                                false) ==
                                                                            true)
                                                                          Align(
                                                                            alignment:
                                                                                AlignmentDirectional(0.97, -0.74),
                                                                            child:
                                                                                Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 8.0, 0.0),
                                                                              child: AuthUserStreamWidget(
                                                                                builder: (context) => InkWell(
                                                                                  splashColor: Colors.transparent,
                                                                                  focusColor: Colors.transparent,
                                                                                  hoverColor: Colors.transparent,
                                                                                  highlightColor: Colors.transparent,
                                                                                  onTap: () async {
                                                                                    context.pushNamed(
                                                                                      'Editar_Estudoo',
                                                                                      queryParameters: {
                                                                                        'editarESTUDO': serializeParam(
                                                                                          columnTeologiaRecord.reference,
                                                                                          ParamType.DocumentReference,
                                                                                        ),
                                                                                      }.withoutNulls,
                                                                                      extra: <String, dynamic>{
                                                                                        kTransitionInfoKey: TransitionInfo(
                                                                                          hasTransition: true,
                                                                                          transitionType: PageTransitionType.fade,
                                                                                        ),
                                                                                      },
                                                                                    );
                                                                                  },
                                                                                  child: FaIcon(
                                                                                    FontAwesomeIcons.edit,
                                                                                    color: Color(0xFF95A1AC),
                                                                                    size: 18.0,
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            }),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.navBarInicioModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NavBarInicioWidget(),
                        ),
                      ),
                    ],
                  ),
                  if (stackFilmeRecord?.sim == true)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navBarInicioCopyModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavBarInicioCopyWidget(),
                      ),
                    ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
