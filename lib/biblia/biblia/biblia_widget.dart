import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/biblia/components/livros/livros_widget.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_biblia/nav_bar_biblia_widget.dart';
import '/nav_bar/nav_bar_biblia_copy/nav_bar_biblia_copy_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:webviewx_plus/webviewx_plus.dart';
import 'biblia_model.dart';
export 'biblia_model.dart';

class BibliaWidget extends StatefulWidget {
  const BibliaWidget({
    super.key,
    this.getBooksShortName,
    this.getChaptersNumbers,
    this.getVersesNumbers,
  });

  final String? getBooksShortName;
  final String? getChaptersNumbers;
  final String? getVersesNumbers;

  @override
  State<BibliaWidget> createState() => _BibliaWidgetState();
}

class _BibliaWidgetState extends State<BibliaWidget> {
  late BibliaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => BibliaModel());
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: Color(0xFF0B0D0F),
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
                            EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 0.0, 60.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Material(
                                  color: Colors.transparent,
                                  elevation: 3.0,
                                  child: Container(
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      color: Color(0xFF12161A),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          5.0, 15.0, 5.0, 15.0),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              FFButtonWidget(
                                                onPressed: () async {
                                                  await showModalBottomSheet(
                                                    isScrollControlled: true,
                                                    backgroundColor:
                                                        Colors.transparent,
                                                    context: context,
                                                    builder: (context) {
                                                      return WebViewAware(
                                                        child: GestureDetector(
                                                          onTap: () =>
                                                              FocusScope.of(
                                                                      context)
                                                                  .unfocus(),
                                                          child: Padding(
                                                            padding: MediaQuery
                                                                .viewInsetsOf(
                                                                    context),
                                                            child: Container(
                                                              height: MediaQuery
                                                                          .sizeOf(
                                                                              context)
                                                                      .height *
                                                                  0.9,
                                                              child:
                                                                  LivrosWidget(),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ).then((value) =>
                                                      safeSetState(() {}));
                                                },
                                                text: valueOrDefault<String>(
                                                  widget!.getBooksShortName,
                                                  'Gen',
                                                ),
                                                options: FFButtonOptions(
                                                  width: 100.0,
                                                  padding: EdgeInsets.all(15.0),
                                                  iconPadding:
                                                      EdgeInsetsDirectional
                                                          .fromSTEB(0.0, 0.0,
                                                              0.0, 0.0),
                                                  color: Color(0xFF12161A),
                                                  textStyle: FlutterFlowTheme
                                                          .of(context)
                                                      .labelLarge
                                                      .override(
                                                        fontFamily:
                                                            'Plus Jakarta Sans',
                                                        color: Colors.white,
                                                        fontSize: 13.0,
                                                        letterSpacing: 0.0,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                  elevation: 6.0,
                                                  borderSide: BorderSide(
                                                    color: Colors.transparent,
                                                    width: 1.0,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          0.0),
                                                ),
                                                showLoadingIndicator: false,
                                              ),
                                            ],
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(1.0, 0.0),
                                            child: InkWell(
                                              splashColor: Colors.transparent,
                                              focusColor: Colors.transparent,
                                              hoverColor: Colors.transparent,
                                              highlightColor:
                                                  Colors.transparent,
                                              onTap: () async {
                                                context.pushNamed(
                                                  'Perfil',
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
                                                Icons.account_circle_sharp,
                                                color: Color(0xFF5E6C73),
                                                size: 30.0,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    15.0, 15.0, 15.0, 10.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Expanded(
                                      child: FutureBuilder<ApiCallResponse>(
                                        future: BibleForUApiGroup
                                            .listOfVersesCall
                                            .call(
                                          versionShortName: FFAppState()
                                              .getVersionsShortNameVar,
                                          booksShortName:
                                              valueOrDefault<String>(
                                            widget!.getBooksShortName,
                                            'Gen',
                                          ),
                                          chaptersNum: valueOrDefault<String>(
                                            widget!.getChaptersNumbers,
                                            '1',
                                          ),
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
                                          final listViewListOfVersesResponse =
                                              snapshot.data!;

                                          return Builder(
                                            builder: (context) {
                                              final versesItems = getJsonField(
                                                listViewListOfVersesResponse
                                                    .jsonBody,
                                                r'''$.data.verses[:]''',
                                              ).toList();

                                              return ListView.builder(
                                                padding: EdgeInsets.zero,
                                                shrinkWrap: true,
                                                scrollDirection: Axis.vertical,
                                                itemCount: versesItems.length,
                                                itemBuilder: (context,
                                                    versesItemsIndex) {
                                                  final versesItemsItem =
                                                      versesItems[
                                                          versesItemsIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(0.0, 0.0,
                                                                0.0, 10.0),
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.min,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          getJsonField(
                                                            versesItemsItem,
                                                            r'''$.ref''',
                                                          ).toString(),
                                                          textAlign:
                                                              TextAlign.start,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Plus Jakarta Sans',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .alternate,
                                                                fontSize: 10.0,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w300,
                                                              ),
                                                        ),
                                                        Expanded(
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5.0,
                                                                        0.0,
                                                                        0.0,
                                                                        0.0),
                                                            child: Text(
                                                              getJsonField(
                                                                versesItemsItem,
                                                                r'''$.text''',
                                                              ).toString(),
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyMedium
                                                                  .override(
                                                                    fontFamily:
                                                                        'Plus Jakarta Sans',
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        15.0,
                                                                    letterSpacing:
                                                                        0.0,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  );
                                                },
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Align(
                        alignment: AlignmentDirectional(0.0, 1.0),
                        child: wrapWithModel(
                          model: _model.navBarBibliaModel,
                          updateCallback: () => safeSetState(() {}),
                          child: NavBarBibliaWidget(),
                        ),
                      ),
                    ],
                  ),
                  if (stackFilmeRecord?.sim == true)
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navBarBibliaCopyModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavBarBibliaCopyWidget(),
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
