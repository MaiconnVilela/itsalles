import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_expanded_image_view.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_web_view.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/nav_bar/nav_bar_musica/nav_bar_musica_widget.dart';
import '/nav_bar/nav_bar_musica_copy/nav_bar_musica_copy_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';
import 'musica_model.dart';
export 'musica_model.dart';

class MusicaWidget extends StatefulWidget {
  const MusicaWidget({
    super.key,
    this.userProfile,
  });

  final DocumentReference? userProfile;

  @override
  State<MusicaWidget> createState() => _MusicaWidgetState();
}

class _MusicaWidgetState extends State<MusicaWidget> {
  late MusicaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MusicaModel());
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
                    if (responsiveVisibility(
                      context: context,
                      desktop: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(0.0, 0.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 0.0, 68.0),
                          child: StreamBuilder<List<TelevisaoRecord>>(
                            stream: queryTelevisaoRecord(
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
                              List<TelevisaoRecord> webViewTelevisaoRecordList =
                                  snapshot.data!;
                              // Return an empty Container when the item does not exist.
                              if (snapshot.data!.isEmpty) {
                                return Container();
                              }
                              final webViewTelevisaoRecord =
                                  webViewTelevisaoRecordList.isNotEmpty
                                      ? webViewTelevisaoRecordList.first
                                      : null;

                              return FlutterFlowWebView(
                                content: webViewTelevisaoRecord!.radio,
                                height: 900.0,
                                verticalScroll: false,
                                horizontalScroll: false,
                              );
                            },
                          ),
                        ),
                      ),
                    if (responsiveVisibility(
                      context: context,
                      tablet: false,
                      tabletLandscape: false,
                      desktop: false,
                    ))
                      Align(
                        alignment: AlignmentDirectional(0.0, -1.0),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(
                              0.0, 2.0, 0.0, 0.0),
                          child: InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.fade,
                                  child: FlutterFlowExpandedImageView(
                                    image: Image.asset(
                                      'assets/images/Inserir_um_ttulo_(7).png',
                                      fit: BoxFit.contain,
                                    ),
                                    allowRotation: false,
                                    useHeroAnimation: false,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 250.0,
                              height: 250.0,
                              clipBehavior: Clip.antiAlias,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                              ),
                              child: Image.asset(
                                'assets/images/Inserir_um_ttulo_(7).png',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    Align(
                      alignment: AlignmentDirectional(0.0, 1.0),
                      child: wrapWithModel(
                        model: _model.navBarMusicaModel,
                        updateCallback: () => safeSetState(() {}),
                        child: NavBarMusicaWidget(),
                      ),
                    ),
                  ],
                ),
                if (stackFilmeRecord?.sim == true)
                  Align(
                    alignment: AlignmentDirectional(0.0, 1.0),
                    child: wrapWithModel(
                      model: _model.navBarMusicaCopyModel,
                      updateCallback: () => safeSetState(() {}),
                      child: NavBarMusicaCopyWidget(),
                    ),
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
