import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../models/filter_model.dart';
import '../../bloc/filter_cubit.dart';
import '../../bloc/home_cubit.dart';

class FilterBottomSheet extends StatefulWidget {
  const FilterBottomSheet({super.key});

  @override
  State<FilterBottomSheet> createState() => _FilterBottomSheetState();
}

class _FilterBottomSheetState extends State<FilterBottomSheet> {
  Set<FilterModel> size = {};
  Set<FilterModel> lab = {};
  Set<FilterModel> shape = {};
  Set<FilterModel> color = {};
  Set<FilterModel> clarity = {};

  @override
  void initState() {
    size.addAll(context.read<FilterCubit>().state.size);
    lab = context.read<FilterCubit>().state.lab;
    shape = context.read<FilterCubit>().state.shape;
    color = context.read<FilterCubit>().state.color;
    clarity = context.read<FilterCubit>().state.clarity;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 0.8,
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Filter",
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              clearAll();
                              context.read<FilterCubit>().updateFilterData(
                                size: size,
                                lab: lab,
                                shape: shape,
                                color: color,
                                clarity: clarity,
                              );
                              context.read<HomeCubit>().clearFilter();
                              Navigator.of(context).pop();
                            },
                            child: Text("Clear"),
                          ),
                          TextButton(
                            onPressed: () {
                              context.read<FilterCubit>().updateFilterData(
                                size: size,
                                lab: lab,
                                shape: shape,
                                color: color,
                                clarity: clarity,
                              );
                              context.read<HomeCubit>().applyFilter(
                                size: size,
                                lab: lab,
                                shape: shape,
                                color: color,
                                clarity: clarity,
                              );
                              Navigator.of(context).pop();
                            },
                            child: Text("Apply"),
                          ),
                        ],
                      ),
                    ],
                  ),

                  Text(
                    "Size",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ...size.map(
              (itm) => CheckboxListTile.adaptive(
                value: itm.isSelected,
                title: Text(itm.id),
                onChanged: (v) {
                  setState(() {
                    size =
                        size.map((e) {
                          if (e.id == itm.id) {
                            return e.copyWith(isSelected: !e.isSelected);
                          }
                          return e;
                        }).toSet();
                  });
                },
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Lab",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            ...lab.map(
              (itm) => CheckboxListTile.adaptive(
                value: itm.isSelected,
                title: Text(itm.id),
                onChanged: (v) {
                  setState(() {
                    lab =
                        lab.map((e) {
                          if (e.id == itm.id) {
                            return e.copyWith(isSelected: !e.isSelected);
                          }
                          return e;
                        }).toSet();
                  });
                },
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Shape",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            ...shape.map(
              (itm) => CheckboxListTile.adaptive(
                value: itm.isSelected,
                title: Text(itm.id),
                onChanged: (v) {
                  setState(() {
                    shape =
                        shape.map((e) {
                          if (e.id == itm.id) {
                            return e.copyWith(isSelected: !e.isSelected);
                          }
                          return e;
                        }).toSet();
                  });
                },
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Color",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            ...color.map(
              (itm) => CheckboxListTile.adaptive(
                value: itm.isSelected,
                title: Text(itm.id),
                onChanged: (v) {
                  setState(() {
                    color =
                        color.map((e) {
                          if (e.id == itm.id) {
                            return e.copyWith(isSelected: !e.isSelected);
                          }
                          return e;
                        }).toSet();
                  });
                },
              ),
            ),
            SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Clarity",
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
            ),
            ...clarity.map(
              (itm) => CheckboxListTile.adaptive(
                value: itm.isSelected,
                title: Text(itm.id),
                onChanged: (v) {
                  setState(() {
                    clarity =
                        clarity.map((e) {
                          if (e.id == itm.id) {
                            return e.copyWith(isSelected: !e.isSelected);
                          }
                          return e;
                        }).toSet();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  void clearAll() {
    size = size.map((e) => e.copyWith(isSelected: false)).toSet();
    lab = lab.map((e) => e.copyWith(isSelected: false)).toSet();
    color = color.map((e) => e.copyWith(isSelected: false)).toSet();
    shape = shape.map((e) => e.copyWith(isSelected: false)).toSet();
    clarity = clarity.map((e) => e.copyWith(isSelected: false)).toSet();
  }
}
