import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_drop_down.dart';
import '/flutter_flow/flutter_flow_icon_button.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/flutter_flow_widgets.dart';
import '/flutter_flow/form_field_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import 'menu_model.dart';
export 'menu_model.dart';

class MenuWidget extends StatefulWidget {
  const MenuWidget({super.key});

  @override
  State<MenuWidget> createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  late MenuModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MenuModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => safeSetState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<RecipeRecord>>(
      stream: queryRecipeRecord(
        singleRecord: true,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(
                    FlutterFlowTheme.of(context).primary,
                  ),
                ),
              ),
            ),
          );
        }
        List<RecipeRecord> menuRecipeRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final menuRecipeRecord =
            menuRecipeRecordList.isNotEmpty ? menuRecipeRecordList.first : null;

        return GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Scaffold(
            key: scaffoldKey,
            floatingActionButton: Align(
              alignment: AlignmentDirectional(0, 1),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(40, 0, 0, 0),
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
            appBar: AppBar(
              backgroundColor: Color(0xFF7D5136),
              automaticallyImplyLeading: false,
              leading: FlutterFlowIconButton(
                borderColor: Colors.transparent,
                borderRadius: 30,
                borderWidth: 1,
                buttonSize: 60,
                icon: Icon(
                  Icons.arrow_back_rounded,
                  color: Colors.white,
                  size: 30,
                ),
                onPressed: () async {
                  context.pop();
                },
              ),
              title: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Text(
                  'Menu',
                  textAlign: TextAlign.start,
                  style: FlutterFlowTheme.of(context).bodyMedium.override(
                        fontFamily: 'Lato',
                        color: Colors.white,
                        fontSize: 25,
                        letterSpacing: 0.0,
                        fontWeight: FontWeight.w800,
                      ),
                ),
              ),
              actions: [
                Align(
                  alignment: AlignmentDirectional(0.44, -0.86),
                  child: FlutterFlowIconButton(
                    borderColor: Colors.transparent,
                    borderRadius: 8,
                    buttonSize: 60,
                    icon: Icon(
                      Icons.home,
                      color: Colors.white,
                      size: 35,
                    ),
                    onPressed: () async {
                      context.pushNamed('Home');
                    },
                  ),
                ),
              ],
              centerTitle: true,
              elevation: 5,
            ),
            body: SafeArea(
              top: true,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(10, 8, 16, 12),
                    child: Container(
                      width: double.infinity,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3,
                            color: Color(0x33000000),
                            offset: Offset(
                              0,
                              1,
                            ),
                          )
                        ],
                        borderRadius: BorderRadius.circular(12),
                        border: Border.all(
                          color: FlutterFlowTheme.of(context).alternate,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(8, 0, 8, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 8,
                              buttonSize: 40,
                              icon: Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 24,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                            StreamBuilder<List<RecipeRecord>>(
                              stream: queryRecipeRecord(),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        valueColor:
                                            AlwaysStoppedAnimation<Color>(
                                          FlutterFlowTheme.of(context).primary,
                                        ),
                                      ),
                                    ),
                                  );
                                }
                                List<RecipeRecord> dropDownRecipeRecordList =
                                    snapshot.data!;

                                return FlutterFlowDropDown<String>(
                                  controller: _model.dropDownValueController ??=
                                      FormFieldController<String>(null),
                                  options: [
                                    'Indian',
                                    'Malaysian',
                                    'Chinese',
                                    'Other'
                                  ],
                                  onChanged: (val) => safeSetState(
                                      () => _model.dropDownValue = val),
                                  width: 304,
                                  height: 40,
                                  searchHintTextStyle:
                                      FlutterFlowTheme.of(context)
                                          .labelMedium
                                          .override(
                                            fontFamily: 'Inter',
                                            letterSpacing: 0.0,
                                          ),
                                  searchTextStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        letterSpacing: 0.0,
                                      ),
                                  textStyle: FlutterFlowTheme.of(context)
                                      .bodyMedium
                                      .override(
                                        fontFamily: 'Inter',
                                        fontSize: 18,
                                        letterSpacing: 0.0,
                                      ),
                                  hintText: 'search',
                                  searchHintText: 'Search...',
                                  icon: Icon(
                                    Icons.keyboard_arrow_down_rounded,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                  fillColor: FlutterFlowTheme.of(context)
                                      .secondaryBackground,
                                  elevation: 2,
                                  borderColor: Color(0x00434343),
                                  borderWidth: 0,
                                  borderRadius: 8,
                                  margin: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  hidesUnderline: true,
                                  isOverButton: false,
                                  isSearchable: true,
                                  isMultiSelect: false,
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Align(
                    alignment: AlignmentDirectional(-1, -1),
                    child: Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
                      child: Text(
                        'Recipes',
                        textAlign: TextAlign.start,
                        style: FlutterFlowTheme.of(context).bodyMedium.override(
                              fontFamily: 'Inter',
                              fontSize: 20,
                              letterSpacing: 0.0,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 200,
                      decoration: BoxDecoration(),
                      child: StreamBuilder<List<RecipeRecord>>(
                        stream: queryRecipeRecord(
                          queryBuilder: (recipeRecord) => recipeRecord.where(
                            'category',
                            isEqualTo: _model.dropDownValue,
                          ),
                        ),
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
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: listViewRecipeRecordList.length,
                            itemBuilder: (context, listViewIndex) {
                              final listViewRecipeRecord =
                                  listViewRecipeRecordList[listViewIndex];
                              return Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    20, 10, 20, 20),
                                child: Material(
                                  color: Colors.transparent,
                                  elevation: 10,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(14),
                                  ),
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(14),
                                    ),
                                    child: SingleChildScrollView(
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Align(
                                            alignment:
                                                AlignmentDirectional(0, -1),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: Container(
                                                width: 363,
                                                height: 215,
                                                decoration: BoxDecoration(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .secondaryBackground,
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(10, 10, 10, 0),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.network(
                                                      listViewRecipeRecord
                                                          .photo,
                                                      width: 300,
                                                      height: 239,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 10, 15, 20),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.max,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            -1, 0),
                                                    child: Container(
                                                      width: 55,
                                                      height: 25,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0xFFFFE9D0),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(12),
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 5, 0, 5),
                                                        child: Text(
                                                          listViewRecipeRecord
                                                              .time,
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 5,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyMedium
                                                              .override(
                                                                fontFamily:
                                                                    'Inter',
                                                                fontSize: 12,
                                                                letterSpacing:
                                                                    0.0,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                lineHeight: 0,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        listViewRecipeRecord
                                                            .name,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyMedium
                                                                .override(
                                                                  fontFamily:
                                                                      'Inter',
                                                                  fontSize: 30,
                                                                  letterSpacing:
                                                                      0.0,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                      ),
                                                      ToggleIcon(
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

                                                          context.pushNamed(
                                                              'Favourites');
                                                        },
                                                        value:
                                                            listViewRecipeRecord
                                                                .favorite,
                                                        onIcon: Icon(
                                                          Icons
                                                              .favorite_outlined,
                                                          color:
                                                              Color(0xFFFF3838),
                                                          size: 30,
                                                        ),
                                                        offIcon: Icon(
                                                          Icons
                                                              .favorite_border_outlined,
                                                          color: Colors.black,
                                                          size: 30,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Text(
                                                    listViewRecipeRecord
                                                        .category,
                                                    textAlign: TextAlign.start,
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyMedium
                                                        .override(
                                                          fontFamily: 'Inter',
                                                          fontSize: 15,
                                                          letterSpacing: 0.0,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Container(
                                                      width: 345,
                                                      height: 159,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x26858585),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          10,
                                                                          10,
                                                                          0),
                                                              child: Text(
                                                                'Ingredients',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          5,
                                                                          10,
                                                                          0),
                                                              child: Text(
                                                                listViewRecipeRecord
                                                                    .ingredients,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                    ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 0, 0),
                                                    child: Container(
                                                      width: 345,
                                                      height: 169,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x26858585),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                      ),
                                                      child:
                                                          SingleChildScrollView(
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          10,
                                                                          10,
                                                                          0),
                                                              child: Text(
                                                                'Directions',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w800,
                                                                      decoration:
                                                                          TextDecoration
                                                                              .underline,
                                                                    ),
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          5,
                                                                          10,
                                                                          0),
                                                              child: Text(
                                                                listViewRecipeRecord
                                                                    .directions,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyMedium
                                                                    .override(
                                                                      fontFamily:
                                                                          'Inter',
                                                                      letterSpacing:
                                                                          0.0,
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
                                            ),
                                          ),
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Align(
                                                alignment:
                                                    AlignmentDirectional(0, 0),
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: FFButtonWidget(
                                                    onPressed: () async {
                                                      await listViewRecipeRecord
                                                          .reference
                                                          .delete();

                                                      context.pushNamed('Menu');
                                                    },
                                                    text: 'Delete',
                                                    options: FFButtonOptions(
                                                      height: 40,
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  16, 0, 16, 0),
                                                      iconPadding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 0),
                                                      color: Color(0xFF7D5136),
                                                      textStyle:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .titleSmall
                                                              .override(
                                                                fontFamily:
                                                                    'Inter Tight',
                                                                color: Colors
                                                                    .white,
                                                                letterSpacing:
                                                                    0.0,
                                                              ),
                                                      elevation: 0,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              8),
                                                    ),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                            child: FlutterFlowIconButton(
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 60, 10),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
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
                                Navigator.pop(context);
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
        );
      },
    );
  }
}
