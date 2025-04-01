import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'home_model.dart';
export 'home_model.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({super.key});

  @override
  State<HomeWidget> createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  late HomeModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => HomeModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
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
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        floatingActionButton: Align(
          alignment: AlignmentDirectional(0, 1),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 30),
            child: FloatingActionButton(
              onPressed: () async {
                context.pushNamed('CreateRecipe');
              },
              backgroundColor: Color(0xFF7D5136),
              elevation: 8,
              child: Icon(
                Icons.add_rounded,
                color: FlutterFlowTheme.of(context).info,
                size: 24,
              ),
            ),
          ),
        ),
        drawer: Drawer(
          elevation: 16,
          child: Container(
            width: 300,
            decoration: BoxDecoration(
              color: Color(0xFF946E6E),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: Image.asset(
                  'assets/images/CM.webp',
                ).image,
              ),
              boxShadow: [
                BoxShadow(
                  blurRadius: 4,
                  color: Color(0x33000000),
                  offset: Offset(
                    0,
                    2,
                  ),
                )
              ],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
              child: Container(
                decoration: BoxDecoration(),
                child: Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 30, 0, 0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 12, 0, 8),
                        child: Text(
                          'My Profile',
                          textAlign: TextAlign.start,
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Plus Jakarta Sans',
                                    color: Color(0xFF57636C),
                                    fontSize: 20,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.w500,
                                  ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 8, 0),
                              child: AuthUserStreamWidget(
                                builder: (context) => ClipRRect(
                                  borderRadius: BorderRadius.circular(40),
                                  child: Image.network(
                                    currentUserPhoto,
                                    width: 32,
                                    height: 32,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 0, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AuthUserStreamWidget(
                                    builder: (context) => Text(
                                      currentUserDisplayName,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF14181B),
                                            fontSize: 20,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w800,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      currentUserEmail,
                                      style: FlutterFlowTheme.of(context)
                                          .bodySmall
                                          .override(
                                            fontFamily: 'Plus Jakarta Sans',
                                            color: Color(0xFF7D5136),
                                            fontSize: 15,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Divider(
                        thickness: 1,
                        color: Color(0xFFE0E3E7),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Home');
                        },
                        child: Container(
                          width: 287,
                          height: 52,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.home_sharp,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              Text(
                                'Home',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 20,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 20))
                                .addToStart(SizedBox(width: 20)),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Favourites');
                        },
                        child: Container(
                          width: 287,
                          height: 52,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.favorite_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              Text(
                                'Favourite',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 20,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 20))
                                .addToStart(SizedBox(width: 20)),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Menu');
                        },
                        child: Container(
                          width: 287,
                          height: 52,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.restaurant_menu,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              Text(
                                'Menu',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 20,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 20))
                                .addToStart(SizedBox(width: 20)),
                          ),
                        ),
                      ),
                      InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          GoRouter.of(context).prepareAuthEvent();
                          await authManager.signOut();
                          GoRouter.of(context).clearRedirectLocation();

                          context.goNamedAuth('SplashScreen', context.mounted);
                        },
                        child: Container(
                          width: 287,
                          height: 52,
                          decoration: BoxDecoration(),
                          child: Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Icon(
                                Icons.login_outlined,
                                color: FlutterFlowTheme.of(context).primaryText,
                                size: 24,
                              ),
                              Text(
                                'Log Out',
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Lato',
                                      fontSize: 20,
                                      letterSpacing: 0.0,
                                      fontWeight: FontWeight.w900,
                                    ),
                              ),
                            ]
                                .divide(SizedBox(width: 20))
                                .addToStart(SizedBox(width: 20)),
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
        appBar: AppBar(
          backgroundColor: Color(0xFF7D5136),
          automaticallyImplyLeading: false,
          leading: FlutterFlowIconButton(
            borderColor: Colors.transparent,
            borderRadius: 30,
            borderWidth: 1,
            buttonSize: 60,
            icon: Icon(
              Icons.dehaze,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              context.pushNamed('Profile');
            },
          ),
          title: Text(
            'Home',
            style: FlutterFlowTheme.of(context).headlineMedium.override(
                  fontFamily: 'Inter Tight',
                  color: Colors.white,
                  fontSize: 22,
                  letterSpacing: 0.0,
                ),
          ),
          actions: [
            FlutterFlowIconButton(
              borderRadius: 8,
              buttonSize: 54,
              icon: Icon(
                Icons.logout,
                color: FlutterFlowTheme.of(context).info,
                size: 24,
              ),
              onPressed: () async {
                GoRouter.of(context).prepareAuthEvent();
                await authManager.signOut();
                GoRouter.of(context).clearRedirectLocation();

                context.goNamedAuth('SplashScreen', context.mounted);
              },
            ),
          ],
          centerTitle: true,
          elevation: 2,
        ),
        body: SafeArea(
          top: true,
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.max,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                        child: Text(
                          'New Recipe From Chef',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    fontSize: 16,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(16, 10, 16, 30),
                  child: Container(
                    width: 220,
                    height: 291,
                    decoration: BoxDecoration(
                      color: FlutterFlowTheme.of(context).secondaryBackground,
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 4,
                          color: Color(0x33000000),
                          offset: Offset(
                            0,
                            2,
                          ),
                        )
                      ],
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: FlutterFlowTheme.of(context).alternate,
                        width: 1,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: Stack(
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    'https://img.i-scmp.com/cdn-cgi/image/fit=contain,width=1024,format=auto/sites/default/files/d8/images/methode/2019/12/11/50eb3334-a38c-11e9-9a3c-98259c87fba2_972x_160525.jpg',
                                    width: double.infinity,
                                    height: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Align(
                                  alignment: AlignmentDirectional(-0.92, -0.83),
                                  child: Container(
                                    width: 55,
                                    height: 25,
                                    decoration: BoxDecoration(
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 6.5, 0, 5),
                                      child: Text(
                                        '20 min',
                                        textAlign: TextAlign.center,
                                        maxLines: 5,
                                        style: FlutterFlowTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              letterSpacing: 0.0,
                                              fontWeight: FontWeight.w500,
                                              lineHeight: 0,
                                            ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                                child: Container(
                                  width: 72,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFE9D0),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 6.5, 8, 6.5),
                                    child: Text(
                                      '#FromChef',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 10,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 10, 0, 0),
                                child: Container(
                                  width: 72,
                                  height: 25,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFFE9D0),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        8, 6.5, 8, 6.5),
                                    child: Text(
                                      '#Challenge',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            fontSize: 10,
                                            letterSpacing: 0.0,
                                            fontWeight: FontWeight.w500,
                                          ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
                            child: Text(
                              'Nasi Lemak - Challenge',
                              style: FlutterFlowTheme.of(context)
                                  .titleLarge
                                  .override(
                                    fontFamily: 'Inter Tight',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(1, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 2, 0),
                                      child: AuthUserStreamWidget(
                                        builder: (context) => Container(
                                          width: 30,
                                          height: 30,
                                          clipBehavior: Clip.antiAlias,
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                          ),
                                          child: Image.network(
                                            currentUserPhoto,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: AlignmentDirectional(-1, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 1, 0, 0),
                                        child: AuthUserStreamWidget(
                                          builder: (context) => Text(
                                            currentUserDisplayName,
                                            textAlign: TextAlign.start,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Inter',
                                                  fontSize: 15,
                                                  letterSpacing: 0.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Align(
                                  alignment: AlignmentDirectional(1, 0),
                                  child: Icon(
                                    Icons.favorite,
                                    color: Color(0xFFFF0000),
                                    size: 40,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 0, 0),
                      child: Text(
                        'Recipe List',
                        style:
                            FlutterFlowTheme.of(context).labelMedium.override(
                                  fontFamily: 'Inter',
                                  color: Colors.black,
                                  fontSize: 16,
                                  letterSpacing: 0.0,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(16, 0, 20, 0),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed('Menu');
                        },
                        child: Text(
                          'SEE ALL',
                          style:
                              FlutterFlowTheme.of(context).labelMedium.override(
                                    fontFamily: 'Inter',
                                    color: Colors.black,
                                    letterSpacing: 0.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  width: 100,
                  height: 317,
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                        child: StreamBuilder<List<RecipeRecord>>(
                          stream: queryRecipeRecord(),
                          builder: (context, snapshot) {
                            // Customize what your widget looks like when it's loading.
                            if (!snapshot.hasData) {
                              return Center(
                                child: SizedBox(
                                  width: 50,
                                  height: 50,
                                  child: CircularProgressIndicator(
                                    valueColor: AlwaysStoppedAnimation<Color>(
                                      FlutterFlowTheme.of(context).primary,
                                    ),
                                  ),
                                ),
                              );
                            }
                            List<RecipeRecord> listViewRecipeRecordList =
                                snapshot.data!;

                            return ListView.builder(
                              padding: EdgeInsets.zero,
                              primary: false,
                              scrollDirection: Axis.horizontal,
                              itemCount: listViewRecipeRecordList.length,
                              itemBuilder: (context, listViewIndex) {
                                final listViewRecipeRecord =
                                    listViewRecipeRecordList[listViewIndex];
                                return Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 20, 20, 20),
                                  child: Material(
                                    color: Colors.transparent,
                                    elevation: 10,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Container(
                                      width: 233,
                                      height: 34,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        borderRadius: BorderRadius.circular(18),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsets.all(10),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                child: Image.network(
                                                  listViewRecipeRecord.photo,
                                                  width: 206,
                                                  height: 133,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  width: 72,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFFE9D0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 6.5, 8, 6.5),
                                                    child: Text(
                                                      '#${listViewRecipeRecord.category}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 10,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Container(
                                                  width: 72,
                                                  height: 25,
                                                  decoration: BoxDecoration(
                                                    color: Color(0xFFFFE9D0),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            12),
                                                  ),
                                                  alignment:
                                                      AlignmentDirectional(
                                                          0, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                8, 6.5, 8, 6.5),
                                                    child: Text(
                                                      '#${listViewRecipeRecord.name}',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily: 'Inter',
                                                            fontSize: 10,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ].divide(SizedBox(width: 10)),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          -1, 0),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                5, 10, 0, 0),
                                                    child: Text(
                                                      listViewRecipeRecord.name,
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyMedium
                                                          .override(
                                                            fontFamily:
                                                                'Inter Tight',
                                                            fontSize: 25,
                                                            letterSpacing: 0.0,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(5, 0, 60, 0),
                                                  child: Text(
                                                    listViewRecipeRecord.time,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15,
                                                          letterSpacing: 0.0,
                                                        ),
                                                  ),
                                                ),
                                                Align(
                                                  alignment:
                                                      AlignmentDirectional(
                                                          1, -1),
                                                  child: ToggleIcon(
                                                    onPressed: () async {
                                                      await listViewRecipeRecord
                                                          .reference
                                                          .update({
                                                        ...mapToFirestore(
                                                          {
                                                            'favorite':
                                                                !listViewRecipeRecord
                                                                    .favorite,
                                                          },
                                                        ),
                                                      });

                                                      await FavouriteRecord
                                                          .collection
                                                          .doc()
                                                          .set(
                                                              createFavouriteRecordData(
                                                            photo:
                                                                listViewRecipeRecord
                                                                    .photo,
                                                            name:
                                                                listViewRecipeRecord
                                                                    .name,
                                                            time:
                                                                listViewRecipeRecord
                                                                    .time,
                                                            category:
                                                                listViewRecipeRecord
                                                                    .category,
                                                          ));
                                                    },
                                                    value: listViewRecipeRecord
                                                        .favorite,
                                                    onIcon: Icon(
                                                      Icons.favorite_outlined,
                                                      color: Color(0xFFFF3838),
                                                      size: 30,
                                                    ),
                                                    offIcon: Icon(
                                                      Icons
                                                          .favorite_border_sharp,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 30,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 423,
                  height: 57,
                  decoration: BoxDecoration(
                    color: Color(0xFFECD5BE),
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.home,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('Home');
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 60, 10),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.favorite_outlined,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('Favourites');
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.restaurant_menu_sharp,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('Menu');
                            },
                          ),
                        ),
                        Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                          child: FlutterFlowIconButton(
                            borderColor: Colors.transparent,
                            borderRadius: 8,
                            buttonSize: 40,
                            icon: Icon(
                              Icons.person,
                              color: Colors.black,
                              size: 30,
                            ),
                            onPressed: () async {
                              context.pushNamed('Profile');
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
        ),
      ),
    );
  }
}
